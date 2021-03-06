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
private class ApplicationRecalculationControllerTest {
    
    // There are three logical paths that can be taken in the constructor. The first is the instance
    // where the application object is created and has a reference in its App_Ext_ID__c field to
    // an application extention object. The second is an instnace where the appliction object
    // is created and its link with an application extension object exists in the Application_ID__c 
    // field on the application extension object. The finaal case is when the application object
    // does not have a link to an application extension object. These cases will each be tested.
    
    // This test tests the case where an applicaton object is created and has a referene to
    // a application extension object through its App_Ext_ID__c field
    static testMethod void constructorTestA() {
        // create application and application extension and link them through
        // the application App_Ext_ID__c field
        Application__c app = createApplication();
        Application_Extension_Object__c app_ext = createApplicationExtension();
        
        // link them
        app.App_Ext_ID__c = app_ext.ID;
        upsert app;
        
        // assign a controller for the application object
        ApexPages.StandardController controller = new ApexPages.StandardController(app);
        ApplicationRecalculateController appRecalc = new ApplicationRecalculateController(controller);
        System.assertNotEquals(appRecalc, null);
    }
    
    // This test tests the case where the application object is created and the linking
    // exists through the Application_ID__c field on the application extension object
    // that points to the application object
    static testMethod void constructorTestB() {
        // create application and application extension and link them through
        // the application Application_ID__c field on the application extension object
        Application__c app = createApplication();
        Application_Extension_Object__c app_ext = createApplicationExtension();
        
        // link them
        app_ext.Application_ID__c = app.ID;
        upsert app_ext;
        
        // assign a controller for the application object
        ApexPages.StandardController controller = new ApexPages.StandardController(app);
        ApplicationRecalculateController appRecalc = new ApplicationRecalculateController(controller);
        System.assertNotEquals(appRecalc, null);
    }
    
     // This method also tests the instance where an application and application extension
     // object do not have a link together
    static testMethod void constructorTestC() {
        // create application and application extension and do not link them
        Application__c app = createApplication();
        Application_Extension_Object__c app_ext = createApplicationExtension();
        
        // assign a controller for the application object
        ApexPages.StandardController controller = new ApexPages.StandardController(app);
        ApplicationRecalculateController appRecalc = new ApplicationRecalculateController(controller);
        System.assertNotEquals(appRecalc, null);
    }
    
    // test for the customsave method (this tets the customsave up until (if !isValid) and returns null.
    static testMethod void customSaveTestA(){
         // perform class setup for testing
        ApplicationRecalculateController appRecalc = setup();
        appRecalc.xmlData = '<CBACalculatorTools><CBACalculatorForm><CalcTypeName>Equipment Loan</CalcTypeName><CalcType>3</CalcType><InAdvanced>true</InAdvanced><Frequency>Monthly</Frequency><State /><DDate>03/05/2016</DDate><AssetType>All Other Assets</AssetType><EquipmentCost>1256000</EquipmentCost><TradeIn>123</TradeIn><MVRegoCost>0</MVRegoCost><Options>34</Options><SupplierDelivery>0</SupplierDelivery><SupplierDiscount>440</SupplierDiscount><FeesAndChargesFinanced>0</FeesAndChargesFinanced><LessorRate>0.07</LessorRate><TermInMonths>48</TermInMonths><BrokageAmount>12554.710000000001</BrokageAmount><BrokagePercent>0.01</BrokagePercent><ResidualAmount>12554.71</ResidualAmount><ResidualPercent>0.01</ResidualPercent><BalloonAmount>12554.71</BalloonAmount><BalloonPercent>0.01</BalloonPercent><DelayedPayment>0</DelayedPayment><BalloonAmountExclGST>12554.71</BalloonAmountExclGST><FrequencyPerPeriod>1</FrequencyPerPeriod><AmountFinanced>1255471</AmountFinanced><TotalAmountFinanced>1268025.71</TotalAmountFinanced><FrequencyPerYear>0</FrequencyPerYear><EquipmentCostExclRego>1255594</EquipmentCostExclRego><TotalEquipmentCost>1255594</TotalEquipmentCost><TermInMonthsInstallment>48</TermInMonthsInstallment><TotalGST>114144.91</TotalGST><GST>114144.91</GST><LCT>0</LCT><ITC>0</ITC><BrokeragePercentHPEL>0.01</BrokeragePercentHPEL><AssetFinancedLease>1250369.82</AssetFinancedLease><AmountFinancedHirePurchaseEquipmentLoan>1255471</AmountFinancedHirePurchaseEquipmentLoan><ITCLease>5224.18</ITCLease><ITC_HPEL>114144.90909090909</ITC_HPEL><HPEL_Installment>29962.271623133624</HPEL_Installment><RentalDuty>0</RentalDuty><TotalInstallment>29954.20010772044</TotalInstallment><RentalPMT>29962.271623133624</RentalPMT><RentalInAdvanceLease>29954.20010772044</RentalInAdvanceLease><TotalLeaseRental>32949.62010772044</TotalLeaseRental><ResidualValueInclGST>12554.71</ResidualValueInclGST><LesseeRate>0.07533091306686401</LesseeRate><LCTLimit>75375</LCTLimit><CarLuxuryTaxValue>983235.77</CarLuxuryTaxValue><RentalInstallment>32949.62010772044</RentalInstallment><GSTOnResidual>1255.47</GSTOnResidual><GST_HPEL>114144.90909090909</GST_HPEL><GSTRentalDuty>2995.42</GSTRentalDuty><MaxITCOnLease>5224.18</MaxITCOnLease><CarCostExclGSTAndLCT>825327.972027972</CarCostExclGSTAndLCT><NumberInstallments>48</NumberInstallments><TotalAmountRepayments>1450701.3099999987</TotalAmountRepayments><TotalAmountInterest>195230.26000000007</TotalAmountInterest><MortgageDuty>0</MortgageDuty><VERSION>v2.00</VERSION></CBACalculatorForm><CBACalculatorFacts><LCTLimit>75375</LCTLimit><LCTLimitFuelEfficient>75375</LCTLimitFuelEfficient><GSTPercentRate>0.1</GSTPercentRate><MortgageDutyBaseNSW>5</MortgageDutyBaseNSW><MortgageDutyLimitNSW>16000</MortgageDutyLimitNSW><MortgageDutyRateNSW>0.4</MortgageDutyRateNSW><MortgageDutyCeilFactorNSW>1000</MortgageDutyCeilFactorNSW><MortgageDutyBaseSA>0</MortgageDutyBaseSA><MortgageDutyLimitSA>0</MortgageDutyLimitSA><MortgageDutyRateSA>0</MortgageDutyRateSA><MortgageDutyCeilFactorSA>100</MortgageDutyCeilFactorSA><LCTRate>0.33</LCTRate><LCTLuxuryThreshold>61884</LCTLuxuryThreshold><LCTCarLimit>57466</LCTCarLimit></CBACalculatorFacts><CBACalculatorSchedule><CBACalculatorAddPayments><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>345</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment><AdditionalPayment>0</AdditionalPayment></CBACalculatorAddPayments><Seasonal /><ScheduledPaymentPerFreq>29954.20010772044</ScheduledPaymentPerFreq><Schedules><Schedule DDate="03/05/2016" LastInstallmentDate="03/07/2016" Payment="29954.2" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="29954.2" No_of_Payments="4" Payment_Frequency="Monthly" /><Schedule DDate="03/08/2016" LastInstallmentDate="03/08/2016" Payment="29954.2" AutoAdditionalPayment="0" AdditionalPayment="345" TotalPayment="30299.2" No_of_Payments="1" Payment_Frequency="Monthly" /><Schedule DDate="03/09/2016" LastInstallmentDate="03/04/2020" Payment="29954.2" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="29954.2" No_of_Payments="44" Payment_Frequency="Monthly" /><Schedule DDate="03/05/2020" LastInstallmentDate="03/05/2020" Payment="0" AutoAdditionalPayment="12554.71" AdditionalPayment="0" TotalPayment="12554.71" No_of_Payments="1" Payment_Frequency="Monthly" /></Schedules></CBACalculatorSchedule></CBACalculatorTools>';
        System.debug('HERE');
        appRecalc.customSave();
    }
    
    // This method forces the catch block to be fired.
    static testMethod void customSaveTestB(){
         // perform class setup for testing
        ApplicationRecalculateController appRecalc = setup();
        appRecalc.customSave();
    }
    
    // test for the getDebug method
    static testMethod void getDebug() {
        Application__c app = createApplication();
        ApexPages.StandardController controller = new ApexPages.StandardController(app);
        ApexPages.currentPage().getParameters().put('debug','true');
        ApplicationRecalculateController appRecalc = new ApplicationRecalculateController(controller);
        System.assertNotEquals(appRecalc, null);
        
        // call the getDebug method
        appRecalc.getDebug();
    }
    
    // test for cancel method
    static testMethod void cancelTest() {
        // perform class setup for testing
        ApplicationRecalculateController appRecalc = setup();
        
        // call the cancel method on it
        PageReference p = appRecalc.cancel();
        System.assertNotEquals(p, null);
    }
    
    // -----------------------------------------------------------------------------------------------
    // The following methods are methods that are used by the test class. They initialise variables
    // and instantiate the constructor to setup the object properly for testing.
    // -----------------------------------------------------------------------------------------------
    // This method provides the basic setup required to create the required objects. For some
    // tests that require a reference to the ApplicationRecalculateController
    private static ApplicationRecalculateController setup() {
        // create application and application extension and link them
        Application__c app = createApplication();


    
        // assign a controller for the application object
        ApexPages.StandardController controller = new ApexPages.StandardController(app);
        ApplicationRecalculateController appRecalc = new ApplicationRecalculateController(controller);
        System.assertNotEquals(appRecalc, null);
        return appRecalc;
    }
    
    private static Application__c createApplication() {
        Application__c app = new Application__c();
        insert app;
        
        // make sure it has been constructed properly
        System.assertNotEquals(app, null);        
        return app;
    }
    
    private static Application_Extension_Object__c createApplicationExtension() {
        Application_Extension_Object__c app_ext = new Application_Extension_Object__c();
        app_ext.XML_calculation_data__c = '<CBACalculatorTools><CBACalculatorForm><CalcTypeName>Hire Purchase</CalcTypeName><CalcType>2</CalcType><InAdvanced>true</InAdvanced><Frequency>Monthly</Frequency><State>NSW</State><DDate>15/02/2011</DDate><AssetType>All Other Assets</AssetType><EquipmentCost>80000</EquipmentCost><TradeIn>15000</TradeIn><MVRegoCost>1500</MVRegoCost><Options>1000</Options><SupplierDelivery>2000</SupplierDelivery><SupplierDiscount>2000</SupplierDiscount><FeesAndChargesFinanced>5000</FeesAndChargesFinanced><LessorRate>0.1</LessorRate><TermInMonths>48</TermInMonths><BrokageAmount>304.5</BrokageAmount><BrokagePercent>0.0042</BrokagePercent><ResidualAmount>30000.5</ResidualAmount><ResidualPercent>0.4138</ResidualPercent><BalloonAmount>30000.5</BalloonAmount><BalloonPercent>0.4138</BalloonPercent><FrequencyPerPeriod>1</FrequencyPerPeriod><AmountFinanced>72500</AmountFinanced><TotalAmountFinanced>72500</TotalAmountFinanced><FrequencyPerYear>12</FrequencyPerYear><EquipmentCostExclRego>81000</EquipmentCostExclRego><TotalEquipmentCost>82500</TotalEquipmentCost><TermInMonthsInstallment>48</TermInMonthsInstallment><DelayedPayment>0</DelayedPayment><GST>7363.636363636365</GST><LCT>0</LCT><ITC>7363.636363636365</ITC><BrokeragePercentHPEL>0.0042</BrokeragePercentHPEL><AssetFinancedLease>80136.36363636363</AssetFinancedLease><AmountFinancedHirePurchaseEquipmentLoan>72500</AmountFinancedHirePurchaseEquipmentLoan><ITCLease>5224</ITCLease><ITC_HPEL>7363.636363636365</ITC_HPEL><HPEL_Installment>1324.58597157777</HPEL_Installment><RentalDuty>0</RentalDuty><TotalInstallment>1324.58597157777</TotalInstallment><RentalPMT>1324.58597157777</RentalPMT><RentalInAdvanceLease>1324.59</RentalInAdvanceLease><TotalLeaseRental>1457.05</TotalLeaseRental><ResidualValueInclGST>33000.55</ResidualValueInclGST><LesseeRate>0.1017608642578125</LesseeRate><LCTLimit>75375</LCTLimit><CarLuxuryTaxValue>79701.92</CarLuxuryTaxValue><RentalInstallment>1457.05</RentalInstallment><GSTOnResidual>3000.05</GSTOnResidual><GST_HPEL>7363.636363636365</GST_HPEL><GSTRentalDuty>132.46</GSTRentalDuty><MaxITCOnLease>5224</MaxITCOnLease><CarCostExclGSTAndLCT>3933.5664335664333</CarCostExclGSTAndLCT><NumberInstallments>48</NumberInstallments><TotalAmountRepayments>93580.81999999999</TotalAmountRepayments><TotalAmountInterest>21080.82</TotalAmountInterest><MortgageDuty>261</MortgageDuty></CBACalculatorForm><CBACalculatorFacts><LCTLimit>75375</LCTLimit><LCTLimitFuelEfficient>75375</LCTLimitFuelEfficient><GSTPercentRate>0.1</GSTPercentRate><MortgageDutyBaseNSW>5</MortgageDutyBaseNSW><MortgageDutyLimitNSW>16000</MortgageDutyLimitNSW><MortgageDutyRateNSW>0.4</MortgageDutyRateNSW><MortgageDutyCeilFactorNSW>16000</MortgageDutyCeilFactorNSW><MortgageDutyBaseSA>0</MortgageDutyBaseSA><MortgageDutyLimitSA>0</MortgageDutyLimitSA><MortgageDutyRateSA>0</MortgageDutyRateSA><MortgageDutyCeilFactorSA>100</MortgageDutyCeilFactorSA></CBACalculatorFacts><CBACalculatorSchedule><CBACalculatorAddPayments/><Seasonal>null</Seasonal><ScheduledPaymentPerFreq>1324.58597157777</ScheduledPaymentPerFreq><Schedules><Schedule DDate="15/02/2011" LastInstallmentDate="15/01/2015" Payment="1324.58597157777" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="1324.58597157777" No_of_Payments="48" Payment_Frequency="Monthly"/><Schedule DDate="15/02/2015" LastInstallmentDate="15/02/2015" Payment="0" AutoAdditionalPayment="30000.5" AdditionalPayment="0" TotalPayment="30000.5" No_of_Payments="1" Payment_Frequency="Specific"/></Schedules></CBACalculatorSchedule></CBACalculatorTools>';
        insert app_ext;
        
        // make sure it has been constructed properly
        System.assertNotEquals(app_ext, null);
        return app_ext;
    }

    public static testMethod void getXMLDataTest()
    {
        Application__c app = new Application__c();
        insert app;

        Application_Extension_Object__c app_ext = new Application_Extension_Object__c();
        app_ext.XML_calculation_data__c = '<CBACalculatorTools><CBACalculatorForm><CalcTypeName>Hire Purchase</CalcTypeName><CalcType>2</CalcType><InAdvanced>true</InAdvanced><Frequency>Monthly</Frequency><State>NSW</State><DDate>15/02/2011</DDate><AssetType>All Other Assets</AssetType><EquipmentCost>80000</EquipmentCost><TradeIn>15000</TradeIn><MVRegoCost>1500</MVRegoCost><Options>1000</Options><SupplierDelivery>2000</SupplierDelivery><SupplierDiscount>2000</SupplierDiscount><FeesAndChargesFinanced>5000</FeesAndChargesFinanced><LessorRate>0.1</LessorRate><TermInMonths>48</TermInMonths><BrokageAmount>304.5</BrokageAmount><BrokagePercent>0.0042</BrokagePercent><ResidualAmount>30000.5</ResidualAmount><ResidualPercent>0.4138</ResidualPercent><BalloonAmount>30000.5</BalloonAmount><BalloonPercent>0.4138</BalloonPercent><FrequencyPerPeriod>1</FrequencyPerPeriod><AmountFinanced>72500</AmountFinanced><TotalAmountFinanced>72500</TotalAmountFinanced><FrequencyPerYear>12</FrequencyPerYear><EquipmentCostExclRego>81000</EquipmentCostExclRego><TotalEquipmentCost>82500</TotalEquipmentCost><TermInMonthsInstallment>48</TermInMonthsInstallment><DelayedPayment>0</DelayedPayment><GST>7363.636363636365</GST><LCT>0</LCT><ITC>7363.636363636365</ITC><BrokeragePercentHPEL>0.0042</BrokeragePercentHPEL><AssetFinancedLease>80136.36363636363</AssetFinancedLease><AmountFinancedHirePurchaseEquipmentLoan>72500</AmountFinancedHirePurchaseEquipmentLoan><ITCLease>5224</ITCLease><ITC_HPEL>7363.636363636365</ITC_HPEL><HPEL_Installment>1324.58597157777</HPEL_Installment><RentalDuty>0</RentalDuty><TotalInstallment>1324.58597157777</TotalInstallment><RentalPMT>1324.58597157777</RentalPMT><RentalInAdvanceLease>1324.59</RentalInAdvanceLease><TotalLeaseRental>1457.05</TotalLeaseRental><ResidualValueInclGST>33000.55</ResidualValueInclGST><LesseeRate>0.1017608642578125</LesseeRate><LCTLimit>75375</LCTLimit><CarLuxuryTaxValue>79701.92</CarLuxuryTaxValue><RentalInstallment>1457.05</RentalInstallment><GSTOnResidual>3000.05</GSTOnResidual><GST_HPEL>7363.636363636365</GST_HPEL><GSTRentalDuty>132.46</GSTRentalDuty><MaxITCOnLease>5224</MaxITCOnLease><CarCostExclGSTAndLCT>3933.5664335664333</CarCostExclGSTAndLCT><NumberInstallments>48</NumberInstallments><TotalAmountRepayments>93580.81999999999</TotalAmountRepayments><TotalAmountInterest>21080.82</TotalAmountInterest><MortgageDuty>261</MortgageDuty></CBACalculatorForm><CBACalculatorFacts><LCTLimit>75375</LCTLimit><LCTLimitFuelEfficient>75375</LCTLimitFuelEfficient><GSTPercentRate>0.1</GSTPercentRate><MortgageDutyBaseNSW>5</MortgageDutyBaseNSW><MortgageDutyLimitNSW>16000</MortgageDutyLimitNSW><MortgageDutyRateNSW>0.4</MortgageDutyRateNSW><MortgageDutyCeilFactorNSW>16000</MortgageDutyCeilFactorNSW><MortgageDutyBaseSA>0</MortgageDutyBaseSA><MortgageDutyLimitSA>0</MortgageDutyLimitSA><MortgageDutyRateSA>0</MortgageDutyRateSA><MortgageDutyCeilFactorSA>100</MortgageDutyCeilFactorSA></CBACalculatorFacts><CBACalculatorSchedule><CBACalculatorAddPayments/><Seasonal>null</Seasonal><ScheduledPaymentPerFreq>1324.58597157777</ScheduledPaymentPerFreq><Schedules><Schedule DDate="15/02/2011" LastInstallmentDate="15/01/2015" Payment="1324.58597157777" AutoAdditionalPayment="0" AdditionalPayment="0" TotalPayment="1324.58597157777" No_of_Payments="48" Payment_Frequency="Monthly"/><Schedule DDate="15/02/2015" LastInstallmentDate="15/02/2015" Payment="0" AutoAdditionalPayment="30000.5" AdditionalPayment="0" TotalPayment="30000.5" No_of_Payments="1" Payment_Frequency="Specific"/></Schedules></CBACalculatorSchedule></CBACalculatorTools>';
        app_ext.Application_ID__c = app.ID;
        insert app_ext;

        System.assertNotEquals(app.ID, null);
        System.assertNotEquals(app_ext.ID, null);
        System.assertEquals(app_ext.XML_calculation_data__c, ApplicationRecalculateController.getXMLData(app.ID));
    }
}