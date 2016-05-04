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
private class QuotesControllerExtensionTest {
    // This method tests the getDebug method
    static testMethod void getDebugTest() {
        // setup objects to allow getDebug method to be tested
        Quote__c quote = new Quote__c();
        ApexPages.StandardController controller = new ApexPages.StandardController(quote);
        ApexPages.currentPage().getParameters().put('debug', 'true');
        QuotesControllerExtension quoteConExt = new QuotesControllerExtension(controller);
        System.assertNotEquals(quoteConExt, null);
        
        // test the getDebug method
        String isDebug = quoteConExt.getDebug();
        System.assertEquals(isDebug, 'true');
        
        //Test custom save with blank values.
        System.assertEquals(null, quoteConExt.customsave());
    }
    
        // This method tests the customsave method and its various conditional execution paths
    static testMethod void customSaveTest() {
        // setup objects to allow customsave method to be tested
        Quote__c quote = new Quote__c();
        // enter some VALID quote calculation data
        quote.XML_Calculation_Data__c = '<CBACalculatorTools><CBACalculatorForm><CalcTypeName>Hire Purchase</CalcTypeName><CalcType>2</CalcType><InAdvanced>true</InAdvanced><Frequency>Monthly</Frequency><State>NSW</State><DDate>15/02/2011</DDate><AssetType>All Other Assets</AssetType><EquipmentCost>80000</EquipmentCost><TradeIn>15000</TradeIn><MVRegoCost>1500</MVRegoCost><Options>1000</Options><SupplierDelivery>2000</SupplierDelivery><SupplierDiscount>2000</SupplierDiscount><FeesAndChargesFinanced>5000</FeesAndChargesFinanced><LessorRate>0.1</LessorRate><TermInMonths>48</TermInMonths><BrokageAmount>304.5</BrokageAmount><BrokagePercent>0.0042</BrokagePercent><ResidualAmount>30000.5</ResidualAmount><ResidualPercent>0.4138</ResidualPercent><BalloonAmount>30000.5</BalloonAmount><BalloonPercent>0.4138</BalloonPercent><FrequencyPerPeriod>1</FrequencyPerPeriod><AmountFinanced>72500</AmountFinanced><TotalAmountFinanced>72500</TotalAmountFinanced><FrequencyPerYear>12</FrequencyPerYear><EquipmentCostExclRego>81000</EquipmentCostExclRego><TotalEquipmentCost>82500</TotalEquipmentCost><TermInMonthsInstallment>48</TermInMonthsInstallment><DelayedPayment>0</DelayedPayment><GST>7363.636363636365</GST><LCT>0</LCT><ITC>7363.636363636365</ITC><BrokeragePercentHPEL>0.0042</BrokeragePercentHPEL><AssetFinancedLease>80136.36363636363</AssetFinancedLease><AmountFinancedHirePurchaseEquipmentLoan>72500</AmountFinancedHirePurchaseEquipmentLoan><ITCLease>5224</ITCLease><ITC_HPEL>7363.636363636365</ITC_HPEL><HPEL_Installment>1324.58597157777</HPEL_Installment><RentalDuty>0</RentalDuty><TotalInstallment>1324.58597157777</TotalInstallment><RentalPMT>1324.58597157777</RentalPMT><RentalInAdvanceLease>1324.59</RentalInAdvanceLease><TotalLeaseRental>1457.05</TotalLeaseRental><ResidualValueInclGST>33000.55</ResidualValueInclGST><LesseeRate>0.1017608642578125</LesseeRate><LCTLimit>75375</LCTLimit><CarLuxuryTaxValue>79701.92</CarLuxuryTaxValue><RentalInstallment>1457.05</RentalInstallment><GSTOnResidual>3000.05</GSTOnResidual><GST_HPEL>7363.636363636365</GST_HPEL><GSTRentalDuty>132.46</GSTRentalDuty><MaxITCOnLease>5224</MaxITCOnLease><CarCostExclGSTAndLCT>3933.5664335664333</CarCostExclGSTAndLCT><NumberInstallments>48</NumberInstallments><TotalAmountRepayments>93580.81999999999</TotalAmountRepayments><TotalAmountInterest>21080.82</TotalAmountInterest><MortgageDuty>261</MortgageDuty></CBACalculatorForm><CBACalculatorFacts><LCTLimit>75375</LCTLimit><LCTLimitFuelEfficient>75375</LCTLimitFuelEfficient><GSTPercentRate>0.1</GSTPercentRate><MortgageDutyBaseNSW>5</MortgageDutyBaseNSW><MortgageDutyLimitNSW>16000</MortgageDutyLimitNSW><MortgageDutyRateNSW>0.4</MortgageDutyRateNSW><MortgageDutyCeilFactorNSW>16000</MortgageDutyCeilFactorNSW><MortgageDutyBaseSA>0</MortgageDutyBaseSA><MortgageDutyLimitSA>0</MortgageDutyLimitSA><MortgageDutyRateSA>0</MortgageDutyRateSA><MortgageDutyCeilFactorSA>100</MortgageDutyCeilFactorSA></CBACalculatorFacts><CBACalculatorSchedule><CBACalculatorAddPayments/><Seasonal>null</Seasonal><ScheduledPaymentPerFreq>1324.58597157777</ScheduledPaymentPerFreq><Schedules><Schedule DDate="15/02/2011" LastInstallmentDate="15/01/2015" Payment="1324.58597157777" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="1324.58597157777" No_of_Payments="48" Payment_Frequency="Monthly"/><Schedule DDate="15/02/2015" LastInstallmentDate="15/02/2015" Payment="0" AutoAdditionalPayment="30000.5" AdditionalPayment="0" TotalPayment="30000.5" No_of_Payments="1" Payment_Frequency="Specific"/></Schedules></CBACalculatorSchedule></CBACalculatorTools>';
        insert quote;
        System.assertNotEquals(quote.ID, null);
        // create and add some schedules to the quote
        for(Integer i = 1; i <= 6; i++) {
            Quote_Payment_Schedule__c quotePaymentSchedule = new Quote_Payment_Schedule__c();
            quotePaymentSchedule.Quote_ID__c = quote.id;
            quotePaymentSchedule.Payment_Amount__c = 1400;
            quotePaymentSchedule.No_of_Payments__c = 48;
            quotePaymentSchedule.Payment_Frequency__c = 'Monthly';
            Date startDate = Date.Today();
            quotePaymentSchedule.Payment_Start_Date__c = startDate;
            quotePaymentSchedule.LastInstallmentDate__c = startDate.addMonths(48);
            insert quotePaymentSchedule;
            System.assertNotEquals(quotePaymentSchedule.ID, null);
        }
        
        // instantiate our test object
        ApexPages.StandardController controller = new ApexPages.StandardController(quote);
        QuotesControllerExtension quoteConExt = new QuotesControllerExtension(controller);
        System.assertNotEquals(quoteConExt, null);
        
        // test the customsave method
        System.assertNotEquals(null, quoteConExt.customsave());
    }

    static testMethod void customSaveNoRedirectTest() {
        // setup objects to allow customsave method to be tested
        Quote__c quote = new Quote__c();
        // enter some VALID quote calculation data
        quote.XML_Calculation_Data__c = '<CBACalculatorTools><CBACalculatorForm><CalcTypeName>Hire Purchase</CalcTypeName><CalcType>2</CalcType><InAdvanced>true</InAdvanced><Frequency>Monthly</Frequency><State>NSW</State><DDate>15/02/2011</DDate><AssetType>All Other Assets</AssetType><EquipmentCost>80000</EquipmentCost><TradeIn>15000</TradeIn><MVRegoCost>1500</MVRegoCost><Options>1000</Options><SupplierDelivery>2000</SupplierDelivery><SupplierDiscount>2000</SupplierDiscount><FeesAndChargesFinanced>5000</FeesAndChargesFinanced><LessorRate>0.1</LessorRate><TermInMonths>48</TermInMonths><BrokageAmount>304.5</BrokageAmount><BrokagePercent>0.0042</BrokagePercent><ResidualAmount>30000.5</ResidualAmount><ResidualPercent>0.4138</ResidualPercent><BalloonAmount>30000.5</BalloonAmount><BalloonPercent>0.4138</BalloonPercent><FrequencyPerPeriod>1</FrequencyPerPeriod><AmountFinanced>72500</AmountFinanced><TotalAmountFinanced>72500</TotalAmountFinanced><FrequencyPerYear>12</FrequencyPerYear><EquipmentCostExclRego>81000</EquipmentCostExclRego><TotalEquipmentCost>82500</TotalEquipmentCost><TermInMonthsInstallment>48</TermInMonthsInstallment><DelayedPayment>0</DelayedPayment><GST>7363.636363636365</GST><LCT>0</LCT><ITC>7363.636363636365</ITC><BrokeragePercentHPEL>0.0042</BrokeragePercentHPEL><AssetFinancedLease>80136.36363636363</AssetFinancedLease><AmountFinancedHirePurchaseEquipmentLoan>72500</AmountFinancedHirePurchaseEquipmentLoan><ITCLease>5224</ITCLease><ITC_HPEL>7363.636363636365</ITC_HPEL><HPEL_Installment>1324.58597157777</HPEL_Installment><RentalDuty>0</RentalDuty><TotalInstallment>1324.58597157777</TotalInstallment><RentalPMT>1324.58597157777</RentalPMT><RentalInAdvanceLease>1324.59</RentalInAdvanceLease><TotalLeaseRental>1457.05</TotalLeaseRental><ResidualValueInclGST>33000.55</ResidualValueInclGST><LesseeRate>0.1017608642578125</LesseeRate><LCTLimit>75375</LCTLimit><CarLuxuryTaxValue>79701.92</CarLuxuryTaxValue><RentalInstallment>1457.05</RentalInstallment><GSTOnResidual>3000.05</GSTOnResidual><GST_HPEL>7363.636363636365</GST_HPEL><GSTRentalDuty>132.46</GSTRentalDuty><MaxITCOnLease>5224</MaxITCOnLease><CarCostExclGSTAndLCT>3933.5664335664333</CarCostExclGSTAndLCT><NumberInstallments>48</NumberInstallments><TotalAmountRepayments>93580.81999999999</TotalAmountRepayments><TotalAmountInterest>21080.82</TotalAmountInterest><MortgageDuty>261</MortgageDuty></CBACalculatorForm><CBACalculatorFacts><LCTLimit>75375</LCTLimit><LCTLimitFuelEfficient>75375</LCTLimitFuelEfficient><GSTPercentRate>0.1</GSTPercentRate><MortgageDutyBaseNSW>5</MortgageDutyBaseNSW><MortgageDutyLimitNSW>16000</MortgageDutyLimitNSW><MortgageDutyRateNSW>0.4</MortgageDutyRateNSW><MortgageDutyCeilFactorNSW>16000</MortgageDutyCeilFactorNSW><MortgageDutyBaseSA>0</MortgageDutyBaseSA><MortgageDutyLimitSA>0</MortgageDutyLimitSA><MortgageDutyRateSA>0</MortgageDutyRateSA><MortgageDutyCeilFactorSA>100</MortgageDutyCeilFactorSA></CBACalculatorFacts><CBACalculatorSchedule><CBACalculatorAddPayments/><Seasonal>null</Seasonal><ScheduledPaymentPerFreq>1324.58597157777</ScheduledPaymentPerFreq><Schedules><Schedule DDate="15/02/2011" LastInstallmentDate="15/01/2015" Payment="1324.58597157777" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="1324.58597157777" No_of_Payments="48" Payment_Frequency="Monthly"/><Schedule DDate="15/02/2015" LastInstallmentDate="15/02/2015" Payment="0" AutoAdditionalPayment="30000.5" AdditionalPayment="0" TotalPayment="30000.5" No_of_Payments="1" Payment_Frequency="Specific"/></Schedules></CBACalculatorSchedule></CBACalculatorTools>';
        insert quote;
        System.assertNotEquals(quote.ID, null);
        // create and add some schedules to the quote
        for(Integer i = 1; i <= 6; i++) {
            Quote_Payment_Schedule__c quotePaymentSchedule = new Quote_Payment_Schedule__c();
            quotePaymentSchedule.Quote_ID__c = quote.id;
            quotePaymentSchedule.Payment_Amount__c = 1400;
            quotePaymentSchedule.No_of_Payments__c = 48;
            quotePaymentSchedule.Payment_Frequency__c = 'Monthly';
            Date startDate = Date.Today();
            quotePaymentSchedule.Payment_Start_Date__c = startDate;
            quotePaymentSchedule.LastInstallmentDate__c = startDate.addMonths(48);
            insert quotePaymentSchedule;
            System.assertNotEquals(quotePaymentSchedule.ID, null);
        }
        
        // instantiate our test object
        ApexPages.StandardController controller = new ApexPages.StandardController(quote);
        QuotesControllerExtension quoteConExt = new QuotesControllerExtension(controller);
        System.assertNotEquals(quoteConExt, null);
        
        // test the customsave method
        System.assertNotEquals(null, quoteConExt.customSaveNoRedirect());
    }


    static testMethod void backToQuoteTest() {
        // setup objects to allow customsave method to be tested
        Quote__c quote = new Quote__c();
        // enter some VALID quote calculation data
        quote.XML_Calculation_Data__c = '<CBACalculatorTools><CBACalculatorForm><CalcTypeName>Hire Purchase</CalcTypeName><CalcType>2</CalcType><InAdvanced>true</InAdvanced><Frequency>Monthly</Frequency><State>NSW</State><DDate>15/02/2011</DDate><AssetType>All Other Assets</AssetType><EquipmentCost>80000</EquipmentCost><TradeIn>15000</TradeIn><MVRegoCost>1500</MVRegoCost><Options>1000</Options><SupplierDelivery>2000</SupplierDelivery><SupplierDiscount>2000</SupplierDiscount><FeesAndChargesFinanced>5000</FeesAndChargesFinanced><LessorRate>0.1</LessorRate><TermInMonths>48</TermInMonths><BrokageAmount>304.5</BrokageAmount><BrokagePercent>0.0042</BrokagePercent><ResidualAmount>30000.5</ResidualAmount><ResidualPercent>0.4138</ResidualPercent><BalloonAmount>30000.5</BalloonAmount><BalloonPercent>0.4138</BalloonPercent><FrequencyPerPeriod>1</FrequencyPerPeriod><AmountFinanced>72500</AmountFinanced><TotalAmountFinanced>72500</TotalAmountFinanced><FrequencyPerYear>12</FrequencyPerYear><EquipmentCostExclRego>81000</EquipmentCostExclRego><TotalEquipmentCost>82500</TotalEquipmentCost><TermInMonthsInstallment>48</TermInMonthsInstallment><DelayedPayment>0</DelayedPayment><GST>7363.636363636365</GST><LCT>0</LCT><ITC>7363.636363636365</ITC><BrokeragePercentHPEL>0.0042</BrokeragePercentHPEL><AssetFinancedLease>80136.36363636363</AssetFinancedLease><AmountFinancedHirePurchaseEquipmentLoan>72500</AmountFinancedHirePurchaseEquipmentLoan><ITCLease>5224</ITCLease><ITC_HPEL>7363.636363636365</ITC_HPEL><HPEL_Installment>1324.58597157777</HPEL_Installment><RentalDuty>0</RentalDuty><TotalInstallment>1324.58597157777</TotalInstallment><RentalPMT>1324.58597157777</RentalPMT><RentalInAdvanceLease>1324.59</RentalInAdvanceLease><TotalLeaseRental>1457.05</TotalLeaseRental><ResidualValueInclGST>33000.55</ResidualValueInclGST><LesseeRate>0.1017608642578125</LesseeRate><LCTLimit>75375</LCTLimit><CarLuxuryTaxValue>79701.92</CarLuxuryTaxValue><RentalInstallment>1457.05</RentalInstallment><GSTOnResidual>3000.05</GSTOnResidual><GST_HPEL>7363.636363636365</GST_HPEL><GSTRentalDuty>132.46</GSTRentalDuty><MaxITCOnLease>5224</MaxITCOnLease><CarCostExclGSTAndLCT>3933.5664335664333</CarCostExclGSTAndLCT><NumberInstallments>48</NumberInstallments><TotalAmountRepayments>93580.81999999999</TotalAmountRepayments><TotalAmountInterest>21080.82</TotalAmountInterest><MortgageDuty>261</MortgageDuty></CBACalculatorForm><CBACalculatorFacts><LCTLimit>75375</LCTLimit><LCTLimitFuelEfficient>75375</LCTLimitFuelEfficient><GSTPercentRate>0.1</GSTPercentRate><MortgageDutyBaseNSW>5</MortgageDutyBaseNSW><MortgageDutyLimitNSW>16000</MortgageDutyLimitNSW><MortgageDutyRateNSW>0.4</MortgageDutyRateNSW><MortgageDutyCeilFactorNSW>16000</MortgageDutyCeilFactorNSW><MortgageDutyBaseSA>0</MortgageDutyBaseSA><MortgageDutyLimitSA>0</MortgageDutyLimitSA><MortgageDutyRateSA>0</MortgageDutyRateSA><MortgageDutyCeilFactorSA>100</MortgageDutyCeilFactorSA></CBACalculatorFacts><CBACalculatorSchedule><CBACalculatorAddPayments/><Seasonal>null</Seasonal><ScheduledPaymentPerFreq>1324.58597157777</ScheduledPaymentPerFreq><Schedules><Schedule DDate="15/02/2011" LastInstallmentDate="15/01/2015" Payment="1324.58597157777" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="1324.58597157777" No_of_Payments="48" Payment_Frequency="Monthly"/><Schedule DDate="15/02/2015" LastInstallmentDate="15/02/2015" Payment="0" AutoAdditionalPayment="30000.5" AdditionalPayment="0" TotalPayment="30000.5" No_of_Payments="1" Payment_Frequency="Specific"/></Schedules></CBACalculatorSchedule></CBACalculatorTools>';
        insert quote;
        System.assertNotEquals(quote.ID, null);
        // create and add some schedules to the quote
        for(Integer i = 1; i <= 6; i++) {
            Quote_Payment_Schedule__c quotePaymentSchedule = new Quote_Payment_Schedule__c();
            quotePaymentSchedule.Quote_ID__c = quote.id;
            quotePaymentSchedule.Payment_Amount__c = 1400;
            quotePaymentSchedule.No_of_Payments__c = 48;
            quotePaymentSchedule.Payment_Frequency__c = 'Monthly';
            Date startDate = Date.Today();
            quotePaymentSchedule.Payment_Start_Date__c = startDate;
            quotePaymentSchedule.LastInstallmentDate__c = startDate.addMonths(48);
            insert quotePaymentSchedule;
            System.assertNotEquals(quotePaymentSchedule.ID, null);
        }
        
        // instantiate our test object
        ApexPages.StandardController controller = new ApexPages.StandardController(quote);
        QuotesControllerExtension quoteConExt = new QuotesControllerExtension(controller);
        System.assertNotEquals(quoteConExt, null);
        
        // test the customsave method
        System.assertNotEquals(null, quoteConExt.backToQuote());
    }

    static testMethod void LogTest() {
        Quote__c quote = new Quote__c();
        // enter some VALID quote calculation data
        quote.XML_Calculation_Data__c = null;
        insert quote;
        System.assertNotEquals(quote.ID, null);
        // create and add some schedules to the quote
        for(Integer i = 1; i <= 6; i++) {
            Quote_Payment_Schedule__c quotePaymentSchedule = new Quote_Payment_Schedule__c();
            quotePaymentSchedule.Quote_ID__c = quote.id;
            quotePaymentSchedule.Payment_Amount__c = 1400;
            quotePaymentSchedule.No_of_Payments__c = 48;
            quotePaymentSchedule.Payment_Frequency__c = 'Monthly';
            Date startDate = Date.Today();
            quotePaymentSchedule.Payment_Start_Date__c = startDate;
            quotePaymentSchedule.LastInstallmentDate__c = startDate.addMonths(48);
            insert quotePaymentSchedule;
            System.assertNotEquals(quotePaymentSchedule.ID, null);
        }
        
        // instantiate our test object
        ApexPages.StandardController controller = new ApexPages.StandardController(quote);
        QuotesControllerExtension quoteConExt = new QuotesControllerExtension(controller);
        System.assertNotEquals(quoteConExt, null);
        
        // test the customsave method
        System.assertEquals(null, quoteConExt.customSaveNoRedirect());
    }


    public static testMethod void getNothingTest()
    {
    
        System.assertEquals('', QuotesControllerExtension.getNothing());
    }

    public static testMethod void getXMLDataTest()
    {
        Quote__c quote = new Quote__c();
        // enter some VALID quote calculation data
        quote.XML_Calculation_Data__c = '<CBACalculatorTools><CBACalculatorForm><CalcTypeName>Hire Purchase</CalcTypeName><CalcType>2</CalcType><InAdvanced>true</InAdvanced><Frequency>Monthly</Frequency><State>NSW</State><DDate>15/02/2011</DDate><AssetType>All Other Assets</AssetType><EquipmentCost>80000</EquipmentCost><TradeIn>15000</TradeIn><MVRegoCost>1500</MVRegoCost><Options>1000</Options><SupplierDelivery>2000</SupplierDelivery><SupplierDiscount>2000</SupplierDiscount><FeesAndChargesFinanced>5000</FeesAndChargesFinanced><LessorRate>0.1</LessorRate><TermInMonths>48</TermInMonths><BrokageAmount>304.5</BrokageAmount><BrokagePercent>0.0042</BrokagePercent><ResidualAmount>30000.5</ResidualAmount><ResidualPercent>0.4138</ResidualPercent><BalloonAmount>30000.5</BalloonAmount><BalloonPercent>0.4138</BalloonPercent><FrequencyPerPeriod>1</FrequencyPerPeriod><AmountFinanced>72500</AmountFinanced><TotalAmountFinanced>72500</TotalAmountFinanced><FrequencyPerYear>12</FrequencyPerYear><EquipmentCostExclRego>81000</EquipmentCostExclRego><TotalEquipmentCost>82500</TotalEquipmentCost><TermInMonthsInstallment>48</TermInMonthsInstallment><DelayedPayment>0</DelayedPayment><GST>7363.636363636365</GST><LCT>0</LCT><ITC>7363.636363636365</ITC><BrokeragePercentHPEL>0.0042</BrokeragePercentHPEL><AssetFinancedLease>80136.36363636363</AssetFinancedLease><AmountFinancedHirePurchaseEquipmentLoan>72500</AmountFinancedHirePurchaseEquipmentLoan><ITCLease>5224</ITCLease><ITC_HPEL>7363.636363636365</ITC_HPEL><HPEL_Installment>1324.58597157777</HPEL_Installment><RentalDuty>0</RentalDuty><TotalInstallment>1324.58597157777</TotalInstallment><RentalPMT>1324.58597157777</RentalPMT><RentalInAdvanceLease>1324.59</RentalInAdvanceLease><TotalLeaseRental>1457.05</TotalLeaseRental><ResidualValueInclGST>33000.55</ResidualValueInclGST><LesseeRate>0.1017608642578125</LesseeRate><LCTLimit>75375</LCTLimit><CarLuxuryTaxValue>79701.92</CarLuxuryTaxValue><RentalInstallment>1457.05</RentalInstallment><GSTOnResidual>3000.05</GSTOnResidual><GST_HPEL>7363.636363636365</GST_HPEL><GSTRentalDuty>132.46</GSTRentalDuty><MaxITCOnLease>5224</MaxITCOnLease><CarCostExclGSTAndLCT>3933.5664335664333</CarCostExclGSTAndLCT><NumberInstallments>48</NumberInstallments><TotalAmountRepayments>93580.81999999999</TotalAmountRepayments><TotalAmountInterest>21080.82</TotalAmountInterest><MortgageDuty>261</MortgageDuty></CBACalculatorForm><CBACalculatorFacts><LCTLimit>75375</LCTLimit><LCTLimitFuelEfficient>75375</LCTLimitFuelEfficient><GSTPercentRate>0.1</GSTPercentRate><MortgageDutyBaseNSW>5</MortgageDutyBaseNSW><MortgageDutyLimitNSW>16000</MortgageDutyLimitNSW><MortgageDutyRateNSW>0.4</MortgageDutyRateNSW><MortgageDutyCeilFactorNSW>16000</MortgageDutyCeilFactorNSW><MortgageDutyBaseSA>0</MortgageDutyBaseSA><MortgageDutyLimitSA>0</MortgageDutyLimitSA><MortgageDutyRateSA>0</MortgageDutyRateSA><MortgageDutyCeilFactorSA>100</MortgageDutyCeilFactorSA></CBACalculatorFacts><CBACalculatorSchedule><CBACalculatorAddPayments/><Seasonal>null</Seasonal><ScheduledPaymentPerFreq>1324.58597157777</ScheduledPaymentPerFreq><Schedules><Schedule DDate="15/02/2011" LastInstallmentDate="15/01/2015" Payment="1324.58597157777" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="1324.58597157777" No_of_Payments="48" Payment_Frequency="Monthly"/><Schedule DDate="15/02/2015" LastInstallmentDate="15/02/2015" Payment="0" AutoAdditionalPayment="30000.5" AdditionalPayment="0" TotalPayment="30000.5" No_of_Payments="1" Payment_Frequency="Specific"/></Schedules></CBACalculatorSchedule></CBACalculatorTools>';
        
        insert quote;

        System.assertNotEquals(quote.ID, null);
        System.assertEquals(quote.XML_Calculation_Data__c, QuotesControllerExtension.getXMLData(quote.ID));
    }
}