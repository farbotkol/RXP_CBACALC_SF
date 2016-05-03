/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class QuoteConverterTest {
    // this method tests the UpdateApplicationWithQuoteCalc public method in the QuoteConverter class.
    static testMethod void UpdateApplicationWithQuoteCalcTest() {
        QuoteConverter quoteConverter = new QuoteConverter();
    
        // create some records that the UpdateApplicationWithQuoteCalc can work with
        Application__c app = new Application__c();
        Quote__c quote = new Quote__c();
        Application_Extension_Object__c appExt = new Application_Extension_Object__c();
        List<Quote_Payment_Schedule__c> paymentSchedules = new List<Quote_Payment_Schedule__c>();
        
        // fill up the mock records with data and insert them into the test.
        quote.Facility_Type__c = 'Equipment Loan';
        quote.Cost_incl_GST__c = 50000;
        quote.Less_Deposit_Trade_in__c = 10000;
        quote.Amount_Financed__c = 60000;
        quote.Installment_Amount__c = 1000;
        quote.Lessor_Rate__c = 1.00;
        quote.Lessee_Rate__c = 1.00;
        quote.Term__c = 48;
        quote.Balloon__c = 40;
        quote.Balloon_Amount_incl_GST__c = 21000;
        quote.Brokerage__c = 2;
        quote.XML_Calculation_Data__c = '<Calculator><Calculator>';
        
        insert quote;
        insert app;
        insert appExt;
        

        for(Integer i = 1; i <= 6; i++) {
            Quote_Payment_Schedule__c quotePaymentSchedule = new Quote_Payment_Schedule__c();
            quotePaymentSchedule.Quote_ID__c=quote.id;
            quotePaymentSchedule.Payment_Amount__c = 1400;
            quotePaymentSchedule.No_of_Payments__c = 48;
            quotePaymentSchedule.Payment_Frequency__c = 'Monthly';
            Date startDate = Date.Today();
            quotePaymentSchedule.Payment_Start_Date__c = startDate;
            quotePaymentSchedule.LastInstallmentDate__c = startDate.addMonths(48);
            paymentSchedules.add(quotePaymentSchedule);
            insert quotePaymentSchedule;
        }        
        
        // get a list of all the valid application types 
        RecordType[] applicationTypes = [SELECT ID, Name FROM RecordType WHERE sObjectType='Application__c'];
        Boolean error = false;
        try{
        //call the UpdateApplicationWithQuoteCalc for each record type
        for(RecordType appType : applicationTypes) {
            quoteConverter.UpdateApplicationWithQuoteCalc(app, appExt, appType.Name, quote, paymentSchedules);
        }
        }catch(Exception e)
        {
            error = true;
        }
        System.assertEquals(false,error);
        
        // also call the UpdateApplicationWithQuoteCalc method with an invalid application type
        error = !quoteConverter.UpdateApplicationWithQuoteCalc(app, appExt, null, quote, paymentSchedules);
        System.assertEquals(true,error);
    }
    
    // this method tests the UpdateApplicationWithQuoteCalc public method in the QuoteConverter class.
    static testMethod void UpdateApplicationWithQuoteCalcWithoutPaymentScheduleTest() {
        QuoteConverter quoteConverter = new QuoteConverter();
    
        // create some records that the UpdateApplicationWithQuoteCalc can work with
        Application__c app = new Application__c();
        Quote__c quote = new Quote__c();
        Application_Extension_Object__c appExt = new Application_Extension_Object__c();
        List<Quote_Payment_Schedule__c> paymentSchedules = new List<Quote_Payment_Schedule__c>();
        
        // fill up the mock records with data and insert them into the test.
        quote.Facility_Type__c = 'Novated Finance Lease';
        quote.Cost_incl_GST__c = 50000;
        quote.Less_Deposit_Trade_in__c = 10000;
        quote.Amount_Financed__c = 60000;
        quote.Installment_Amount__c = 1000;
        quote.Lessor_Rate__c = 1.00;
        quote.Lessee_Rate__c = 1.00;
        quote.Term__c = 48;
        quote.Balloon__c = 40;
        quote.Balloon_Amount_incl_GST__c = 21000;
        quote.Brokerage__c = 2;
        quote.XML_Calculation_Data__c = '<Calculator><Calculator>';
        
        insert quote;
        insert app;
        insert appExt;
        
        
        // get a list of all the valid application types 
        RecordType[] applicationTypes = [SELECT ID, Name FROM RecordType WHERE sObjectType='Application__c'];
        
        Boolean error = false;
        try{
        //call the UpdateApplicationWithQuoteCalc for each record type
        for(RecordType appType : applicationTypes) {
            quoteConverter.UpdateApplicationWithQuoteCalc(app, appExt, appType.Name, quote, paymentSchedules);
        }
        }catch(Exception e)
        {
            error = true;
        }
        System.assertEquals(false,error);
        
        // also call the UpdateApplicationWithQuoteCalc method with an invalid application type
        error = !quoteConverter.UpdateApplicationWithQuoteCalc(app, appExt, null, quote, paymentSchedules);
        System.assertEquals(true,error);
    }    
    
    // this method tests the GetRecordTypeName public method in the QuoteConverter class
    static testMethod void GetRecordTypeName() {
        // variable user to store return value from the method call
        String recName;
        ID recID;
    
        // create QuoteConcerter object for use in this test case
        QuoteConverter quoteConverter = new QuoteConverter();
        
        // get any RecordType for an application and record its name and id
        RecordType[] recs = [SELECT ID, Name FROM RecordType LIMIT 1];
        recID = recs[0].ID;
        recName = recs[0].Name;
        
        // call the method passing in a valid record id
        String returnedRecName = quoteConverter.GetRecordTypeName(recID);
        System.assertEquals(returnedRecName, recName);
        
        // call the method passing in an invalid id
        recID = null;
        returnedRecName = quoteConverter.GetRecordTypeName(recID);
        System.assertEquals(returnedRecName, null);
    }
}