public with sharing class XMLToQuotes{
    public Quote__c QuoteObj;
    public List<Quote_Payment_Schedule__c> ScheduleList;
    
    public XMLToQuotes(Quote__c quote) {
        if (quote==null) QuoteObj =new   Quote__c();
        else QuoteObj =quote;
        ScheduleList = new List<Quote_Payment_Schedule__c>();
    }
    
    public void Run(string xmldata)
    {
        xmldom d;        
        d = new xmldom(xmldata);
        //d.dumpAll(); 
        
        QuoteObj.Facility_Type__c = GetStringFromXml(d,'CalcTypeName');
        if(QuoteObj.Facility_Type__c == 'Novated Finance Lease')
            QuoteObj.Facility_Type__c = 'Novated Lease';

        QuoteObj.Balloon__c = GetDecimalFromXml(d,'BalloonPercent')*100;
        QuoteObj.Balloon_Amount__c = GetDecimalFromXml(d,'BalloonAmountExclGST');
        QuoteObj.Balloon_Amount_incl_GST__c= GetDecimalFromXml(d,'BalloonAmount');
        QuoteObj.Brokerage__c = GetDecimalFromXml(d,'BrokagePercent')*100;
        QuoteObj.Brokerage_Amount__c = GetDecimalFromXml(d,'BrokageAmount');
        QuoteObj.Cost_incl_GST__c = GetDecimalFromXml(d,'EquipmentCost');
        QuoteObj.Lessor_Rate__c = GetDecimalFromXml(d,'LessorRate')*100;
        
        QuoteObj.Fees_and_Other_Amounts_Financed__c = GetDecimalFromXml(d,'FeesAndChargesFinanced');
        
        // depending on the product, we need to assign the installments
        String product = QuoteObj.Facility_Type__c;
        //Needs to display as "Protected Novated Lease" in Quote but as "Novated Lease" in Application
            
        Boolean IsLeases = (product == 'Lease Finance' || product == 'Novated Lease' || product == 'Novated Finance Lease' || product == 'Finance Lease' || product == 'Protected Novated Lease');
        Boolean IsCompoundedGST = (product == 'Hire Purchase');
        
        if(IsLeases ) {
            QuoteObj.Installment_Amount__c = GetDecimalFromXml(d,'TotalLeaseRental');
            QuoteObj.Installment_Amount_ex_GST__c = GetDecimalFromXml(d,'RentalInAdvanceLease');
        }
        else {
            QuoteObj.Installment_Amount__c = GetDecimalFromXml(d,'TotalInstallment');    
            QuoteObj.Installment_Amount_ex_GST__c = GetDecimalFromXml(d,'TotalInstallment');        
        }
        
        QuoteObj.Lessee_Rate__c = (GetDecimalFromXml(d,'LesseeRate')*100).setscale(2);
        QuoteObj.Mortgage_Duty__c = GetDecimalFromXml(d,'MortgageDuty');
        QuoteObj.Number_of_Installments__c = GetDecimalFromXml(d,'NumberInstallments');
        QuoteObj.Stamp_Duty_on_Rental__c = GetDecimalFromXml(d,'RentalDuty');
        QuoteObj.State__c = GetStringFromXml(d,'State');
        
        QuoteObj.Term__c = GetDecimalFromXml(d,'TermInMonths');
        if(IsLeases ) {
            QuoteObj.Total_Amount_Interest_Payable__c = 0;
            QuoteObj.Total_Amount_of_Repayments__c = 0;
        }
        else{
            QuoteObj.Total_Amount_Interest_Payable__c = GetDecimalFromXml(d,'TotalAmountInterest');
            QuoteObj.Total_Amount_of_Repayments__c = GetDecimalFromXml(d,'TotalAmountRepayments');
        }
        QuoteObj.Amount_Financed__c = GetDecimalFromXml(d,'AmountFinanced');
        
        
        QuoteObj.Vehicle_Registration__c = GetDecimalFromXml(d,'MVRegoCost');
        QuoteObj.Frequency__c = GetStringFromXml(d,'Frequency');

        if (IsCompoundedGST)
        {
        	QuoteObj.GST_on_the_Contract__c = GetDecimalFromXml(d,'TotalGST');
        }
        else
        {
        	QuoteObj.GST_on_the_Contract__c = GetDecimalFromXml(d,'GST');
        }

        QuoteObj.Luxury_Car_Tax__c = GetDecimalFromXml(d,'LCT');
        QuoteObj.Input_Tax_Credit_on_Purchase__c = GetDecimalFromXml(d,'ITC');
        QuoteObj.Less_Deposit_Trade_in__c = GetDecimalFromXml(d,'TradeIn');
        QuoteObj.Other_Credit_Charges_on_Rental_Payments__c = GetDecimalFromXml(d,'RentalDuty');
        QuoteObj.Option__c = GetDecimalFromXml(d,'Options');
        QuoteObj.Supplier_Delivery_Extras__c = GetDecimalFromXml(d,'SupplierDelivery');
        QuoteObj.Supplier_Discount__c = GetDecimalFromXml(d,'SupplierDiscount');
        QuoteObj.GSTOnResidual__c = GetDecimalFromXml(d,'GSTOnResidual');
        QuoteObj.GST_on_Rental__c = GetDecimalFromXml(d,'GSTRentalDuty');                                   
        //add new schedules
        ScheduleList = new List<Quote_Payment_Schedule__c>();
        try{
            for (XMlDom.Element e: d.getElementsByTagName('Schedule'))
            {
                Quote_Payment_Schedule__c schedule = new Quote_Payment_Schedule__c();
                schedule.Quote_ID__c = QuoteObj.ID;
                schedule.Payment_Start_Date__c = stringToDate(e.getAttribute('DDate'));
                schedule.Payment_Frequency__c = (e.getAttribute('Payment_Frequency'));
                schedule.Payment_Amount__c = GetDecimalFromString(e.getAttribute('TotalPayment'));
                schedule.No_of_Payments__c = GetDecimalFromString(e.getAttribute('No_of_Payments'));
                schedule.LastInstallmentDate__c = stringToDate(e.getAttribute('LastInstallmentDate'));
                schedule.GST_on_Payment__c = (schedule.Payment_Amount__c*(GetDecimalFromXml(d,'GSTPercentRate')));
                schedule.Payment_without_Residual__c = schedule.Payment_Amount__c -  GetDecimalFromString(e.getAttribute('AutoAdditionalPayment'));
                schedule.GST_on_Payment_without_residual__c = (schedule.Payment_without_Residual__c*(GetDecimalFromXml(d,'GSTPercentRate')));
                ScheduleList .Add(schedule);
            }
        }
        catch (Exception e)  {
        }
        
    }
        private decimal GetDecimalFromXml(xmldom d,string tagname)
    {
        try{
        return decimal.valueOf(d.getElementsByTagName(tagname)[0].nodeValue);
        }  catch (Exception e)  {return 0;}
    }
    
    private decimal GetDecimalFromString(string val)
    {
        try{
        return decimal.valueOf(val);
        }  catch (Exception e)  {return 0;}
    }
        
        private String GetStringFromXml(xmldom d,string tagname)
    {
        try{
        return d.getElementsByTagName(tagname)[0].nodeValue;
        }  catch (Exception e)  {return '';}
    }
    
    public static Date stringToDate(String s){
    try{
      //XML Date String is in the format dd/mm/yyyy
      String[] stringDate = s.split('/');
      Integer d =  Integer.valueOf(stringDate[0]);
      Integer m = Integer.valueOf(stringDate[1]);
      Integer y = Integer.valueOf(stringDate[2]);
      return date.newInstance(y,m,d);
      } catch (Exception e)  {return null;}
    }
}