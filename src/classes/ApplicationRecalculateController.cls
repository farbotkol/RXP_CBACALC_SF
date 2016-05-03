public with sharing class ApplicationRecalculateController{
    public String xmlData{get; set;}
    private final Application__c obj;
    private final Application_Extension_Object__c appExtObj;
    private boolean isDebug = false;
    public String currentRecordId {get;set;}
    
    // Constructor
    public ApplicationRecalculateController(ApexPages.StandardController stdController){
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        string debug = ApexPages.currentPage().getParameters().get('debug');
        isDebug = (debug != null && debug != '');
        if(stdController.getRecord()== null)
            return;
        this.obj= (Application__c)stdController.getRecord();
        if (this.obj == null) return;
        Application__c tmpobj = [SELECT ID, App_Ext_ID__c
            FROM Application__c
            WHERE ID = :obj.ID];
        List<Application_Extension_Object__c> app_exts = 
        [SELECT XML_calculation_data__c
            FROM Application_Extension_Object__c
            WHERE Application_ID__c = :obj.ID];

        if (app_exts.size() > 0) {
           appExtObj = app_exts.get(0);
           xmlData = appExtObj.XML_calculation_data__c;
        }
        else if (tmpobj.App_Ext_ID__c !=null){
            app_exts = 
            [SELECT Application_ID__c, XML_calculation_data__c
            FROM Application_Extension_Object__c
            WHERE ID = :tmpobj.App_Ext_ID__c];
            if (app_exts.size() > 0) {
               appExtObj = app_exts.get(0);
               xmlData = appExtObj.XML_calculation_data__c;
               appExtObj.Application_ID__c = obj.ID;
               //upsert appExtObj;
           }
        
        }
        if(appExtObj == null)
        {
            appExtObj = new Application_Extension_Object__c();
            appExtObj.Application_ID__c = obj.ID;
        }
    }
    
    public string getDebug() {
        return isDebug ? 'true' : 'false';
    }
    
    // currently does the same thing as cancel (need to change it later)
    public PageReference customsave(){
        try{
        //Convert XML -> Quote
         Quote__c quoteObj;
         XMLToQuotes converter = new XMLToQuotes(quoteObj);
        converter.Run(xmlData);
   
         quoteObj = converter .QuoteObj;
        //Convert Quote -> Application
         QuoteConverter quoteToAppConverted = new QuoteConverter();
         string recordTypename = quoteToAppConverted.GetRecordTypeName(obj.RecordTypeId);
    
         boolean isValid = quoteToAppConverted.UpdateApplicationWithQuoteCalc(obj, appExtObj, recordTypename ,quoteObj, 
         converter.ScheduleList); 
     
         if (!isValid)
             return null;
         
        appExtObj.Application_ID__c = obj.ID;
        appExtObj.XML_Calculation_Data__c= xmlData;

        upsert obj;
        upsert appExtObj;         
 
          PageReference acctPage = new ApexPages.StandardController(obj).view();
          acctPage.setRedirect(true);
 
          // redirect back to our application

           return acctPage ;
           }
           catch(Exception e)  {
           ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO, 
                    e.getMessage()));
           }
           return null;
    }
    
    public PageReference cancel(){
        // redirect back to our application
        PageReference p = new PageReference('/'+obj.ID);
        p.setRedirect(true);
        return p;
    }

    @RemoteAction  
    public static string getXMLData(string Id )
    {  
        Application_Extension_Object__c appExt =  [SELECT Application_ID__c , XML_calculation_data__c
                        FROM Application_Extension_Object__c
                        WHERE Application_ID__c = :Id ];  
        return appExt.XML_calculation_data__c;
    }
}