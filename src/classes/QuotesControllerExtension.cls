public with sharing class QuotesControllerExtension{

/// This class is to manage the conversion between XML from flex to SF fields.
    private final Quote__c obj;
    private string debug;
    public String currentRecordId {get;set;}
    // The extension constructor initializes the private member  
    // variable acct by using the getRecord method from the standard  
    // controller.  
    
    public QuotesControllerExtension(ApexPages.StandardController stdController) {
        debug = ApexPages.currentPage().getParameters().get('debug');
        this.obj= (Quote__c)stdController.getRecord();
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
    }
    
    public string getDebug()
    {
        return (debug==null||debug=='')? 'false':'true';
    }

    public PageReference customsave()
    {
    try{
        XMLToQuotes converter = new XMLToQuotes(obj);
        converter.Run(obj.XML_Calculation_Data__c);

        upsert obj;
        
        //delete existing schedules
       List<Quote_Payment_Schedule__c> listSchedule = [SELECT 
                                    id                                
                                FROM Quote_Payment_Schedule__c WHERE Quote_ID__c = :obj.ID]; 
        if (listSchedule.size()>0)
            delete  listSchedule;
                                       
        for (Quote_Payment_Schedule__c schedule : converter.ScheduleList)
        {
            schedule.Quote_ID__c = obj.ID;
        }
        if (converter.ScheduleList.size()>0)
            upsert converter.ScheduleList;
        
        PageReference acctPage = new ApexPages.StandardController(obj).view();
        acctPage.setRedirect(true);

        return acctPage;
        }
        catch (Exception e)
        {
            Log(e.getMessage());
            return null;
        }
    }


    public PageReference backToQuote()
    {
        PageReference acctPage = new PageReference('/apex/QuotesCalculator2?Id=' + currentRecordId);
        acctPage.setRedirect(true);

        return acctPage;

    }

    public PageReference customSaveNoRedirect()
    {
    try{
        XMLToQuotes converter = new XMLToQuotes(obj);
        converter.Run(obj.XML_Calculation_Data__c);

        upsert obj;
        
        //delete existing schedules
       List<Quote_Payment_Schedule__c> listSchedule = [SELECT 
                                    id                                
                                FROM Quote_Payment_Schedule__c WHERE Quote_ID__c = :obj.ID]; 
        if (listSchedule.size()>0)
            delete  listSchedule;
                                       
        for (Quote_Payment_Schedule__c schedule : converter.ScheduleList)
        {
            schedule.Quote_ID__c = obj.ID;
        }
        if (converter.ScheduleList.size()>0)
            upsert converter.ScheduleList;
        

        PageReference acctPage = new PageReference('/apex/QuotesCalculatorPrint?Id=' + currentRecordId);
        acctPage.setRedirect(true);
    
        //PageReference acctPage = new ApexPages.StandardController(obj).view();
        //acctPage.setRedirect(true);

        return acctPage;
        }
        catch (Exception e)
        {
            Log(e.getMessage());
            return null;
        }
    }
        // Provides logging for messages
    private void Log(string text) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO, PrettyMessage(text)));
            System.Debug(text);
    }
    
    private String PrettyMessage(string errorMessage)
    {
        String valText = 'FIELD_CUSTOM_VALIDATION_EXCEPTION,';
        Integer index = errorMessage.indexOf(valText);
        if (index >0)
        {
            errorMessage = errorMessage.substring(index + valText.length()).trim();
            index = errorMessage.lastIndexOf(':');
            if (index >0)
            {
                errorMessage = errorMessage.substring(0,index);
            }
        }
        
        return errorMessage;
    }

   @RemoteAction  
   public static string getXMLData(string Id )
   {  
        Quote__c quote =  [SELECT Id,XML_Calculation_Data__c FROM Quote__c where Id = :Id ];  
        return quote.XML_Calculation_Data__c;
   }

   @RemoteAction  
   public static string getNothing( )
   {  
        return '';
   }
}