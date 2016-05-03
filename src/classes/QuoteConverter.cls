/*
    ----------------------------------------------------------------------------------------------
    QuoteConverter
   
    Used for the conversion of quotes to an application.
    ----------------------------------------------------------------------------------------------
*/

public with sharing class QuoteConverter{
    // --------------------------------------------------------------------------
    // Public Methods
    // --------------------------------------------------------------------------
    public String GetRecordTypeName(ID recordID)
    {
        RecordType[] application_types = [SELECT ID, Name FROM RecordType WHERE ID=:recordID];
        if (application_types.size() > 0)
            return application_types[0].Name;
        else 
            return null;
    }

    public Boolean UpdateApplicationWithQuoteCalc(Application__c application, Application_Extension_Object__c appExtObj,
        string AppTypeName, Quote__c quote, List<Quote_Payment_Schedule__c> quotePaymentSchedule)
    {
        appExtObj.XML_Calculation_Data__c = quote.XML_Calculation_Data__c;
        boolean IsApplicationCreation = false;
        boolean IsServed= false;
        //Log('ENTERING MULTIPLEXER WITH RECORD NAME: ' + AppTypeName);
        if(AppTypeName == 'Application for Equipment Finance' || 
        AppTypeName  == 'Balloon/Residual Refinance Application' ||
        AppTypeName  == 'Drawdown under Master Limit Request'||
        AppTypeName  == 'Existing Customer Equipment Finance Application'||
        AppTypeName  == 'Replacement Application')
        {
            IsServed = true;
            application.Select_Product_Type__c = quote.Facility_Type__c;
            application.Purchase_price_for_the_goods_including__c = quote.Cost_incl_GST__c;
            application.Deposit_amount__c = quote.Less_Deposit_Trade_in__c;
            application.Trade_in_Value__c = quote.Less_Deposit_Trade_in__c;
            //comment out due to validation
            //application.Amount_Financed__c = quote.Amount_Financed__c;
            application.Monthly_Repayment__c = quote.Installment_Amount__c;
            application.Base_Interest_Rate__c = quote.Lessor_Rate__c;
            application.Effective_Interest_Rate__c = quote.Lessee_Rate__c;
            application.Term__c = quote.Term__c;
            application.Ballon_residual_value__c = quote.Balloon__c;
            //ID says inclusive but it's actually exclusive
            application.Residual_Value_inclusive_of_GST__c = quote.Balloon_Amount__c;
            //comment out due to validation
            //application.Brokerage_Percent__c = quote.Brokerage__c;
            //application.Brokerage_Amount_including_GST__c = quote.Brokerage_Amount_inc_GST__c;            
                       
            application.Select_Product_Type__c = quote.Facility_Type__c;
            application.Ballon_Residual_to_be_financed__c = quote.Amount_Financed__c;
            application.New_Ballon_Residual__c = quote.Balloon__c;            
            application.New_Repayment_Level__c = quote.Installment_Amount__c;
            application.Base_Interest_Rate__c = quote.Lessor_Rate__c;
            application.Effective_Interest_Rate__c = quote.Lessee_Rate__c;            
            application.Term__c = quote.Term__c;
            //application.Brokerage_Percent__c = quote.Brokerage__c;
            //application.Brokerage_Amount_including_GST__c = quote.Brokerage_Amount_inc_GST__c;

            application.Select_Product_Type__c = quote.Facility_Type__c;
            application.Purchase_price_for_the_goods_including__c = quote.Cost_incl_GST__c;
            application.Deposit_amount__c = quote.Less_Deposit_Trade_in__c;
            application.Amount_Sought__c = quote.Amount_Financed__c;
            application.Ballon_residual_value__c = quote.Balloon__c;
            application.Balloon_Residual_Amount__c = quote.Balloon_Amount__c;
            application.Monthly_Repayment__c = quote.Installment_Amount__c;
            application.Term__c = quote.Term__c;
            application.Base_Interest_Rate__c = quote.Lessor_Rate__c;
            application.Effective_Interest_Rate__c = quote.Lessee_Rate__c;
            //prepopulated
            //application.Brokerage_Amount_including_GST__c = quote.Brokerage_Amount_inc_GST__c;

            application.Select_Product_Type__c = quote.Facility_Type__c;
            application.Purchase_price_for_the_goods_including__c = quote.Cost_incl_GST__c;
            application.Deposit_amount__c = quote.Less_Deposit_Trade_in__c;
            //comment out due to validation
            //application.Amount_Financed__c = quote.Amount_Financed__c;
            application.Monthly_Repayment__c = quote.Installment_Amount__c;
            application.Base_Interest_Rate__c = quote.Lessor_Rate__c;
            application.Effective_Interest_Rate__c = quote.Lessee_Rate__c;
            application.Term__c = quote.Term__c;
            application.Ballon_residual_value__c = quote.Balloon__c;
            application.Balloon_Residual_Amount__c = quote.Balloon_Amount__c;
            //application.Brokerage_Percent__c = quote.Brokerage__c;
            //prepopulated
            //application.Brokerage_Amount_including_GST__c = quote.Brokerage_Amount_inc_GST__c;

            application.Select_Product_Type__c = quote.Facility_Type__c;
            application.Purchase_price_for_the_goods_including__c = quote.Cost_incl_GST__c;
            application.Deposit_amount__c = quote.Less_Deposit_Trade_in__c;
            //comment out due to validation
            //application.Amount_Financed__c = quote.Amount_Financed__c;
            application.New_Repayment_Level__c = quote.Installment_Amount__c;
            application.Base_Interest_Rate__c = quote.Lessor_Rate__c;
            application.Effective_Interest_Rate__c = quote.Lessee_Rate__c;
            application.Term__c = quote.Term__c;
            application.Ballon_residual_value__c = quote.Balloon__c;
            //application.Brokerage_Percent__c = quote.Brokerage__c;
            //prepopulated
            //application.Brokerage_Amount_including_GST__c = quote.Brokerage_Amount_inc_GST__c;
            
            
            //Creation only
            application.Documentation_Fee__c = quote.Documentation_Fee__c;
            application.Security_Registration_Fee__c = quote.Security_Registration_Fee__c;
            
            application.Select_Product_Type__c = quote.Facility_Type__c;
            if(application.Select_Product_Type__c == 'Novated Finance Lease')
                application.Select_Product_Type__c = 'Novated Lease';
            //Needs to display as "Protected Novated Lease" in Quote but as "Novated Lease" in Application
            if(application.Select_Product_Type__c == 'Protected Novated Lease')
                application.Select_Product_Type__c = 'Novated Lease';
        //Log('Link: Setting application.Select_Product_Type__c ' + application.Select_Product_Type__c);
    	//system.debug('Link: Setting application.Select_Product_Type__c ' + application.Select_Product_Type__c);
            IsApplicationCreation  = true;
        }
        if(IsApplicationCreation || AppTypeName  == 'Equipment Loan Long Form' || AppTypeName  == 'Equipment Loan Short Form')
        {
            IsServed = true;
            application.Loan_Amount__c = quote.Amount_Financed__c;
            application.Balloon_Amount__c = quote.Balloon_Amount__c;
            application.Term__c = quote.Term__c;
            application.Number_of_Instalments__c = quote.Number_of_Installments__c;
            application.Instalment_Amount__c = quote.Installment_Amount__c;
            application.Repayment_Frequency__c = quote.Frequency__c;
            application.Total_Amount_of_Repayments__c = quote.Total_Amount_of_Repayments__c;
            application.Total_Interest_Payable_on_Contract__c = quote.Total_Amount_Interest_Payable__c;
            application.Mortgage_Duty__c = quote.Mortgage_Duty__c;
            
            // fill details from the payment schedule
            if(quotePaymentSchedule.size()>0)
            {
                application.X1st_Instalment_Due__c = String.valueOf(quotePaymentSchedule.get(0).Payment_Start_Date__c);
                application.Last_Instalment_Due__c = String.valueOf(quotePaymentSchedule.get(0).LastInstallmentDate__c);
                application.Balloon_payment_due_date__c = String.valueOf(quotePaymentSchedule.get(quotePaymentSchedule.size()-1).LastInstallmentDate__c);
            }
        }
        if(IsApplicationCreation || AppTypeName  == 'Equipment Long Form 2')
        {
            IsServed = true;
            application.Loan_Amount__c = quote.Amount_Financed__c;
            application.Term__c = quote.Term__c;
            application.Total_Amount_of_Repayments__c = quote.Total_Amount_of_Repayments__c;
            application.Total_Interest_Payable_on_Contract__c = quote.Total_Amount_Interest_Payable__c;
            application.Mortgage_Duty__c = quote.Mortgage_Duty__c;
          
            // fill details from the payment schedule
            Integer i = 0;
                if(quotePaymentSchedule.size() > 0) {
                    i = 0;
                    application.X1_Number_of_Instalments__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X1_1st_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X1_Last_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X1_Instalment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X1_Repayment_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X1_Number_of_Instalments__c = 0;
                    application.X1_1st_Instalment_Due_Date__c = null;
                    application.X1_Last_Instalment_Due_Date__c = null;
                    application.X1_Instalment_Amount__c = 0;
                    application.X1_Repayment_Frequency__c = '';
                }
                
                if(quotePaymentSchedule.size() > 1) {
                    i=1;
                    application.X2_Number_of_Instalments__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X2_1st_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X2_Last_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X2_Instalment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X2_Repayment_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X2_Number_of_Instalments__c = 0;
                    application.X2_1st_Instalment_Due_Date__c = null;
                    application.X2_Last_Instalment_Due_Date__c = null;
                    application.X2_Instalment_Amount__c = 0;
                    application.X2_Repayment_Frequency__c = '';
                }
                
                 if(quotePaymentSchedule.size() > 2)  {
                    i=2;
                    application.X3_Number_of_Instalments__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X3_1st_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X3_Last_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X3_Instalment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X3_Repayment_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X3_Number_of_Instalments__c = 0;
                    application.X3_1st_Instalment_Due_Date__c = null;
                    application.X3_Last_Instalment_Due_Date__c = null;
                    application.X3_Instalment_Amount__c = 0;
                    application.X3_Repayment_Frequency__c = '';
                }
                
                if(quotePaymentSchedule.size() > 3)  {
                    i=3;
                    application.X4_Number_of_Instalments__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X4_1st_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X4_Last_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X4_Instalment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X4_Repayment_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X4_Number_of_Instalments__c = 0;
                    application.X4_1st_Instalment_Due_Date__c = null;
                    application.X4_Last_Instalment_Due_Date__c = null;
                    application.X4_Instalment_Amount__c = 0;
                    application.X4_Repayment_Frequency__c = '';
                }
                if(quotePaymentSchedule.size() > 4)  {
                    i=4;
                    application.X5_Number_of_Instalments__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X5_1st_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X5_Last_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X5_Instalment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X5_Repayment_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X5_Number_of_Instalments__c = 0;
                    application.X5_1st_Instalment_Due_Date__c = null;
                    application.X5_Last_Instalment_Due_Date__c = null;
                    application.X5_Instalment_Amount__c = 0;
                    application.X5_Repayment_Frequency__c = '';
                }
                if(quotePaymentSchedule.size() > 5)  {
                    i=5;
                    application.X6_Number_of_Instalments__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X6_1st_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X6_Last_Instalment_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X6_Instalment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X6_Repayment_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X6_Number_of_Instalments__c = 0;
                    application.X6_1st_Instalment_Due_Date__c = null;
                    application.X6_Last_Instalment_Due_Date__c = null;
                    application.X6_Instalment_Amount__c = 0;
                    application.X6_Repayment_Frequency__c = '';
                }
        }       
        if(IsApplicationCreation || AppTypeName  == 'Hire Purchase Long Form' || AppTypeName  == 'Hire Purchase Short Form')
        {
            IsServed = true;        
            application.Purchase_Price_of_Goods_incl_of_GST__c = quote.Cost_incl_GST__c;
            application.Vehicle_Registration_Stamp_Duty_CTP__c = quote.Vehicle_Registration__c;
            application.Fees_and_Other_Amounts_Financed__c = quote.Fees_and_Other_Amounts_Financed__c;
            application.GST_on_the_Contract__c = quote.GST_on_the_Contract__c;
            application.Input_Tax_Credit_on_purchase__c = quote.Input_Tax_Credit_on_purchase__c;
            application.Amount_Financed__c = quote.Amount_Financed__c;
            application.Deposit_to_Financier__c = quote.Less_Deposit_Trade_in__c;
            application.Balloon_Amount__c = quote.Balloon_Amount__c;
            application.Term__c = quote.Term__c;
            application.Other_Credit_Charges_on_Rental_Payments__c = quote.Other_Credit_Charges_on_Rental_Payments__c;
            application.Rental_Payment_Amount__c = quote.Installment_Amount__c;
            application.Repayment_Frequency__c = quote.Frequency__c;
            application.Number_of_Instalments__c = quote.Number_of_Installments__c;
            application.Total_Amount_of_Repayments__c = quote.Total_Amount_of_Repayments__c;
            application.Total_Interest_Payable_on_Contract__c = quote.Total_Amount_Interest_Payable__c;
            
            if(quotePaymentSchedule.size()>0)
            {
                // fill details from the payment schedule
                application.X1st_Instalment_Due__c = String.valueOf(quotePaymentSchedule.get(0).Payment_Start_Date__c);
                application.Last_Instalment_Due__c = String.valueOf(quotePaymentSchedule.get(0).LastInstallmentDate__c);
                application.Balloon_payment_due_date__c = String.valueOf(quotePaymentSchedule.get(quotePaymentSchedule.size()-1).LastInstallmentDate__c);
            }
        }
        if(IsApplicationCreation || AppTypeName  == 'Hire Purchase Long Form 2')
        {
            IsServed = true;        
            application.Purchase_Price_of_Goods_incl_of_GST__c = quote.Cost_incl_GST__c;
            application.Vehicle_Registration_Stamp_Duty_CTP__c = quote.Vehicle_Registration__c;
            application.Fees_and_Other_Amounts_Financed__c = quote.Fees_and_Other_Amounts_Financed__c;
            application.GST_on_the_Contract__c = quote.GST_on_the_Contract__c;
            application.Input_Tax_Credit_on_purchase__c = quote.Input_Tax_Credit_on_purchase__c;
            application.Amount_Financed__c = quote.Amount_Financed__c;
            application.Deposit_to_Financier__c = quote.Less_Deposit_Trade_in__c;
            application.Total_Interest_Payable_on_Contract__c = quote.Total_Amount_Interest_Payable__c;
            //application.Balloon_Amount__c = quote.Balloon_Amount__c;
            application.Term__c = quote.Term__c;
            application.Total_Amount_of_Repayments__c = quote.Total_Amount_of_Repayments__c;
            
            // fill details from the payment schedule
            Integer i = 0;
                if(quotePaymentSchedule.size() > 0) {
                    i = 0;
                    application.X1_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X1_First_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X1_Last_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X1_Rental_Payment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X1_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X1_Number_of_Rentals__c = 0;
                    application.X1_First_Rental_Payment_Due__c = null;
                    application.X1_Last_Rental_Payment_Due__c = null;
                    application.X1_Rental_Payment_Amount__c = 0;
                    application.X1_Frequency__c = '';
                }

                if(quotePaymentSchedule.size() > 1) {
                    i=1;
                    application.X2_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X2_First_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X2_Last_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X2_Rental_Payment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X2_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X2_Number_of_Rentals__c = 0;
                    application.X2_First_Rental_Payment_Due__c = null;
                    application.X2_Last_Rental_Payment_Due__c = null;
                    application.X2_Rental_Payment_Amount__c = 0;
                    application.X2_Frequency__c = '';
                }
                
                 if(quotePaymentSchedule.size() > 2)  {
                    i=2;
                    application.X3_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X3_First_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X3_Last_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X3_Rental_Payment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X3_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X3_Number_of_Rentals__c = 0;
                    application.X3_First_Rental_Payment_Due__c = null;
                    application.X3_Last_Rental_Payment_Due__c = null;
                    application.X3_Rental_Payment_Amount__c = 0;
                    application.X3_Frequency__c = '';
                }
                
                if(quotePaymentSchedule.size() > 3)  {
                    i=3;
                    application.X4_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X4_First_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X4_Last_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X4_Rental_Payment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X4_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X4_Number_of_Rentals__c = 0;
                    application.X4_First_Rental_Payment_Due__c = null;
                    application.X4_Last_Rental_Payment_Due__c = null;
                    application.X4_Rental_Payment_Amount__c = 0;
                    application.X4_Frequency__c = '';
                }
                if(quotePaymentSchedule.size() > 4)  {
                    i=4;
                    application.X5_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X5_First_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X5_Last_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X5_Rental_Payment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X5_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X5_Number_of_Rentals__c = 0;
                    application.X5_First_Rental_Payment_Due__c = null;
                    application.X5_Last_Rental_Payment_Due__c = null;
                    application.X5_Rental_Payment_Amount__c = 0;
                    application.X5_Frequency__c = '';
                }
                if(quotePaymentSchedule.size() > 5)  {
                    i=5;
                    application.X6_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X6_First_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X6_Last_Rental_Payment_Due__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X6_Rental_Payment_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X6_Frequency__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                }
                else {
                    application.X6_Number_of_Rentals__c = 0;
                    application.X6_First_Rental_Payment_Due__c = null;
                    application.X6_Last_Rental_Payment_Due__c = null;
                    application.X6_Rental_Payment_Amount__c = 0;
                    application.X6_Frequency__c = '';
                }
        }
        if(IsApplicationCreation || AppTypeName  == 'Lease Finance Short Form' ||AppTypeName  == 'Lease Finance Long Form')
        {
            IsServed = true;
            application.Purchase_Price_of_Goods_incl_of_GST__c = quote.Cost_incl_GST__c;
            application.Amount_Financed__c = quote.Amount_Financed__c;
            application.Fees_and_Charges_Financed__c = quote.Fees_and_Other_Amounts_Financed__c;
            application.Term__c = quote.Term__c;
            //ID says inclusive but it's actually exclusive
            application.Residual_Value_inclusive_of_GST__c = quote.Balloon_Amount__c;


            application.Rental_Amount__c = quote.Installment_Amount_ex_GST__c;
            application.Stamp_Duty_on_Rental__c = quote.Stamp_Duty_on_Rental__c;
            application.GST_on_Rental__c = quote.GST_on_Rental__c;
            application.Total_Rental_Amount__c = 
                GetNumber(application.Rental_Amount__c) 
                        + GetNumber(application.Stamp_Duty_on_Rental__c) 
                        + GetNumber(application.GST_on_Rental__c);    
            application.Number_of_Instalments__c = quote.Number_of_Installments__c;
            application.Repayment_Frequency__c = quote.Frequency__c;
            
            // fill details from the payment schedule
            if(quotePaymentSchedule.size()>0)
            {
                application.X1st_Instalment_Due__c = String.valueOf(quotePaymentSchedule.get(0).Payment_Start_Date__c);
                application.Last_Instalment_Due__c = String.valueOf(quotePaymentSchedule.get(quotePaymentSchedule.size()-1).LastInstallmentDate__c);
            }
        }
        if(IsApplicationCreation || AppTypeName  == 'Lease Finance Long Form 2')
        {
            IsServed = true;
            application.Purchase_Price_of_Goods_incl_of_GST__c = quote.Cost_incl_GST__c;
            application.Amount_Financed__c = quote.Amount_Financed__c;
            application.Fees_and_Charges_Financed__c = quote.Fees_and_Other_Amounts_Financed__c;
            application.Term__c = quote.Term__c;
            //ID says inclusive but it's actually exclusive
            application.Residual_Value_inclusive_of_GST__c = quote.Balloon_Amount__c;

            //Not included in the mapping doc.
            application.Vehicle_Registration_Stamp_Duty_CTP__c = quote.Vehicle_Registration__c;
            application.GST_on_the_Contract__c = quote.GST_on_the_Contract__c;
            application.Input_Tax_Credit_on_purchase__c = quote.Input_Tax_Credit_on_purchase__c;
            application.Deposit_to_Financier__c = quote.Less_Deposit_Trade_in__c;
            application.Balloon_Amount__c = quote.Balloon_Amount__c;
            application.Total_Amount_of_Repayments__c = quote.Total_Amount_of_Repayments__c;

            // fill details from the payment schedule
            Integer i = 0;
                if(quotePaymentSchedule.size() > 0) {
                    i = 0;
                    application.X1_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X1_First_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X1_Last_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X1_Base_Rental_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X1_Payable__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                    application.X1_GST_on_Rental__c =  quotePaymentSchedule.get(i).GST_on_Payment__c;
                }
                else {
                    application.X1_Number_of_Rentals__c = 0;
                    application.X1_First_Rental_Due_Date__c = null;
                    application.X1_Last_Rental_Due_Date__c = null;
                    application.X1_Base_Rental_Amount__c = 0;
                    application.X1_Payable__c = '';
                    application.X1_GST_on_Rental__c = 0;
                }
                
                if(quotePaymentSchedule.size() > 1) {
                    i=1;
                    application.X2_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X2_First_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X2_Last_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X2_Base_Rental_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X2_Payable__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                    application.X2_GST_on_Rental__c =  quotePaymentSchedule.get(i).GST_on_Payment__c;
                }
                else {
                    application.X2_Number_of_Rentals__c = 0;
                    application.X2_First_Rental_Due_Date__c = null;
                    application.X2_Last_Rental_Due_Date__c = null;
                    application.X2_Base_Rental_Amount__c = 0;
                    application.X2_Payable__c = '';
                    application.X2_GST_on_Rental__c = 0;
                }
                
                 if(quotePaymentSchedule.size() > 2)  {
                    i=2;
                    application.X3_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X3_First_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X3_Last_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X3_Base_Rental_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X3_Payable__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                    application.X3_GST_on_Rental__c =  quotePaymentSchedule.get(i).GST_on_Payment__c;
                }
                else {
                    application.X3_Number_of_Rentals__c = 0;
                    application.X3_First_Rental_Due_Date__c = null;
                    application.X3_Last_Rental_Due_Date__c = null;
                    application.X3_Base_Rental_Amount__c = 0;
                    application.X3_Payable__c = '';
                    application.X3_GST_on_Rental__c = 0;
                }
                
                if(quotePaymentSchedule.size() > 3)  {
                    i=3;
                    application.X4_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X4_First_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X4_Last_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X4_Base_Rental_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X4_Payable__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                    application.X4_GST_on_Rental__c =  quotePaymentSchedule.get(i).GST_on_Payment__c;
                }
                else {
                    application.X4_Number_of_Rentals__c = 0;
                    application.X4_First_Rental_Due_Date__c = null;
                    application.X4_Last_Rental_Due_Date__c = null;
                    application.X4_Base_Rental_Amount__c = 0;
                    application.X4_Payable__c = '';
                    application.X4_GST_on_Rental__c = 0;
                }
                if(quotePaymentSchedule.size() > 4)  {
                    i=4;
                    application.X5_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X5_First_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X5_Last_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X5_Base_Rental_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X5_Payable__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                    application.X5_GST_on_Rental__c =  quotePaymentSchedule.get(i).GST_on_Payment__c;
                }
                else {
                    application.X5_Number_of_Rentals__c = 0;
                    application.X5_First_Rental_Due_Date__c = null;
                    application.X5_Last_Rental_Due_Date__c = null;
                    application.X5_Base_Rental_Amount__c = 0;
                    application.X5_Payable__c = '';
                    application.X5_GST_on_Rental__c = 0;
                }
                if(quotePaymentSchedule.size() > 5)  {
                    i=5;
                    application.X6_Number_of_Rentals__c = quotePaymentSchedule.get(i).No_of_Payments__c;
                    application.X6_First_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).Payment_Start_Date__c);
                    application.X6_Last_Rental_Due_Date__c = String.valueOf(quotePaymentSchedule.get(i).LastInstallmentDate__c);
                    application.X6_Base_Rental_Amount__c = quotePaymentSchedule.get(i).Payment_Amount__c;
                    application.X6_Payable__c = quotePaymentSchedule.get(i).Payment_Frequency__c;
                    application.X6_GST_on_Rental__c =  quotePaymentSchedule.get(i).GST_on_Payment__c;
                }
                else {
                    application.X6_Number_of_Rentals__c = 0;
                    application.X6_First_Rental_Due_Date__c = null;
                    application.X6_Last_Rental_Due_Date__c = null;
                    application.X6_Base_Rental_Amount__c = 0;
                    application.X6_Payable__c = '';
                    application.X6_GST_on_Rental__c = 0;
                }

            application.X1_Rental_Instalment__c = GetNumber(application.X1_Base_Rental_Amount__c) 
                        + GetNumber(application.X1_Stamp_Duty_on_Rental__c) 
                        + GetNumber(application.X1_GST_on_Rental__c);
            application.X2_Rental_Instalment__c = GetNumber(application.X2_Base_Rental_Amount__c) 
                        + GetNumber(application.X2_Stamp_Duty_on_Rental__c) 
                        + GetNumber(application.X2_GST_on_Rental__c);
            application.X3_Rental_Instalment__c = GetNumber(application.X3_Base_Rental_Amount__c) 
                        + GetNumber(application.X3_Stamp_Duty_on_Rental__c) 
                        + GetNumber(application.X3_GST_on_Rental__c);
            application.X4_Rental_Instalment__c = GetNumber(application.X4_Base_Rental_Amount__c) 
                        + GetNumber(application.X4_Stamp_Duty_on_Rental__c) 
                        + GetNumber(application.X4_GST_on_Rental__c);
            application.X5_Rental_Instalment__c = GetNumber(application.X5_Base_Rental_Amount__c) 
                        + GetNumber(application.X5_Stamp_Duty_on_Rental__c) 
                        + GetNumber(application.X5_GST_on_Rental__c);
            application.X6_Rental_Instalment__c = GetNumber(application.X6_Base_Rental_Amount__c) 
                        + GetNumber(application.X6_Stamp_Duty_on_Rental__c) 
                        + GetNumber(application.X6_GST_on_Rental__c);
         }

         
         if (!IsServed){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO, 
                    'Quote can not be converted to the selected application type : '+AppTypeName   ));
            Log('DEBUG::The application type: ' + AppTypeName   + ' is not supported for conversion.');
            return false; // leave before we cause any damage
        }
         
        return true;
    }
    
    // --------------------------------------------------------------------------
    // Private Methods
    // --------------------------------------------------------------------------
    // Provides logging for messages
    private void Log(string text) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO, text));
        System.Debug(text);
    }
    
    private decimal GetNumber (object item1)
    {
        try{
        return (decimal)item1+ 0;
        }
        catch (Exception exp){
        return 0;
        }        
    }
}