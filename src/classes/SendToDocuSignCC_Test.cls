/**
@description: Test coverage for SendToDocuSignCC
@author: Anterey Custodio
@date: August 8, 2013
*/
@isTest

public class SendToDocuSignCC_Test{

static testMethod void test2(){
    
    RecordType rType = [SELECT Id,Name FROM RecordType WHERE SobjectType =: 'Application__c' LIMIT 1];
        
    APXT_CMTR__Conga_Merge_Template__c cMergeTemp = new APXT_CMTR__Conga_Merge_Template__c();
    cMergeTemp.APXT_CMTR__Name__c = 'test';
    insert cMergeTemp;
    
    APXT_CMTR__Conga_Merge_Template__c cMergeTemp2 = new APXT_CMTR__Conga_Merge_Template__c();
    cMergeTemp2.APXT_CMTR__Name__c = 'test';
    insert cMergeTemp2;
    
    DocuSign_Conga_Template_IDs__c CtempId = new DocuSign_Conga_Template_IDs__c();
    CtempId.Name = 'TemplateIds';
    CtempId.Out_of_Scope_Id_List__c = cMergeTemp.Id + ',' + cMergeTemp2.Id;
    CtempId.AML_Form_Company_Borrower_1__c = 'testName';
    CtempId.AML_Form_Company_Borrower_2__c = 'testName';
    CtempId.ATF_Funding_Instructions_Broker__c =  cMergeTemp.Id + ',' + cMergeTemp2.Id;
    insert CtempId;
        
    Opportunity opp = new Opportunity();
    opp.Name = 'testName';
    opp.CloseDate = date.today();
    opp.StageName = '1. Enquiry';
    opp.Description_of_Goods__c = 'test';
    //opp.Bin_contact__c = con.Id;
    opp.Amount_Approved__c = 50000;
    opp.Online_Car_Application__c = 'Yes';
    opp.Documented_Amount_Financed__c = 10;
    opp.Broker_Type_AF_del__c = 'Vendor / Agency';
    
    insert opp;
    
    DocuSign_Tempate_Ids__c templateIDs = new DocuSign_Tempate_Ids__c();
    templateIDs.X2nd_Template_Ids__c = cMergeTemp.Id;
    templateIDs.RecordType__c = rType.Name;
    templateIDs.Template_Ids__c = cMergeTemp.Id;
    templateIDs.Name = 'Finance Lease';
    insert templateIDs;
    
    DocuSign_Tempate_Ids__c templateIDs2 = new DocuSign_Tempate_Ids__c();
    templateIDs2.X2nd_Template_Ids__c = cMergeTemp.Id;
    templateIDs2.RecordType__c = rType.Name;
    templateIDs2.Template_Ids__c = cMergeTemp.Id;
    templateIDs2.Name = 'Equipment Loan';
    insert templateIDs2;
    
    Application__c app = new Application__c();
    app.Name = 'testName';
    app.Opportunity__c = opp.Id;
    app.Guarantor_Type__c = 'Individual';
    app.Drawdown_under_a_Master_Agreement__c = 'No';
    app.No_of_Individual_Guarantors__c = '1';
    app.No_of_Company_Borrowers__c = '1';
    app.No_of_Individual_Borrowers__c = '1';
    app.X3_Guarantor_Name_IG_Contact_Number_C__c = '0123456789';
    app.X4_Guarantor_Name_IG_Contact_Numbe_C__c = '0123456789';
    app.X21_Company_Name_Borrower_Contact_Num_C__c ='0123456789';
    app.X1_Guarantor_Name_IG_Contact_Number_C__c ='0123456789';
    app.X22_Company_Name_Borrower_Contact_Numb_C__c = '0123456789';
    app.X2_Guarantor_Name_IG_Contact_Number_C__c = '0123456789';
    app.X12_Company_Name_Borrower_Contact_Numb_C__c = '0123456789';
    app.X1_Company_Name_Borrower_Contact_Num_C__c = '0123456789';
    app.X4_Borrower_Name_Contact_Number_IB_C__c = '0123456789';
    app.X1_Borrower_Name_Contact_Number_IB_C__c = '0123456789';
    app.X3_Borrower_Name_Contact_Number_IB_C__c = '0123456789';
    app.X2_Borrower_Name_Contact_Number_IB_C__c = '0123456789';
    app.RecordTypeId = rType.Id;
    app.X1_Borrower_Name_Email_Address_IB_C__c = 'test@gmail.com';
    app.X2_Borrower_Name_Email_Address_IB_C__c = 'test@gmail.com';
    app.X3_Borrower_Name_Email_Address_IB_C__c = 'test@gmail.com';
    app.X4_Borrower_Name_Email_Address_IB_C__c = 'test@gmail.com';
    app.X1_Borrower_Name_IB__c = 'test';
    app.X2_Borrower_Name_IB__c = 'test';
    app.X3_Borrower_Name_IB__c = 'test';
    app.X4_Borrower_Name_IB__c = 'test';
    app.X1_Company_Name_Borrower_Email_Address_C__c = 'test@gmail.com';
    app.X12_Company_Name_Borrower_Email_Addre_C__c = 'test@gmail.com';
    app.X21_Company_Name_Borrower_Email_Addres_C__c = 'test@gmail.com';
    app.X22_Company_Name_Borrower_Email_Addre_C__c = 'test@gmail.com';
    app.X1_Guarantor_Name_IG_Email_Address_C__c = 'test@gmail.com';
    app.X2_Guarantor_Name_IG_Email_Address_C__c = 'test@gmail.com';
    app.X3_Guarantor_Name_IG_Email_Address_C__c = 'test@gmail.com';
    app.X4_Guarantor_Name_IG_Email_Address_C__c = 'test@testuser.com';
    app.text__c =  cMergeTemp.Id + ',' + cMergeTemp2.Id;
    app.text_DS__c =  cMergeTemp.Id + ',' + cMergeTemp2.Id;
    app.X1_Company_Name_Borrower__c = 'test';
    app.X2_Company_Name_CB__c = 'test';
    app.X1_Guarantor_Name_IG__c = 'test';
    app.X2_Guarantor_Name_IG__c = 'test';
    app.X3_Guarantor_Name_IG__c = 'test';
    app.X4_Guarantor_Name_IG__c = 'test';
    app.Is_this_a_Novated_Lease__c = 'No';
    app.Is_this_a_ProtectedLease__c = 'No';
    app.Employer_s_Full_Name_Individual__c = 'test';
    app.Employee_Email_Address_c__c = 'test@testuser.com';
    app.X1_Director_1_Full_Name__c = 'test';
    app.X1_Director_2_Full_Name__c = 'test';
    app.X2_Director_1_Full_Name__c = 'test';
    app.X2_Director_2_Full_Name__c = 'test';
    app.Employer_Name__c = 'test';
    app.Employor_Contact_Number_c__c = '0123456789';
    app.Employer_Address__c = 'test';
    app.Employer_A_B_N_A_C_N__c = 'test';
    app.Confirmation_TickBox_1__c = 'Yes';
    app.Check_1__c = 'Yes';
    app.Check_2__c = 'Yes';
    app.Check_3__c = 'Yes';
    app.Check_4__c = 'Yes';
    app.Check_5__c = 'Yes';
    app.Check_6__c = 'Yes';
    app.Check_7__c = 'Yes';
    app.Check_8__c = 'Yes';
    
    insert app;
    
    ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(app);   

    PageReference pageRef = Page.SendToDocuSign;    
    pageRef.getParameters().put('id',app.id);
    Test.setCurrentPageReference(pageRef);

    SendToDocuSignCC controller = new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
    controller.runValidations();
    
    Account accInd = new account(name='individual');
    insert accInd ;
    Contact contact = new Contact(LastName = 'hello',FirstName = 'World',Email = 'a@dolby.com',AccountId =  accInd.Id);
    insert contact;
    Profile p = [select id from profile where name = '~CBA PRM User - Gold'];
    User u = new User(alias = 'standt',
    email='a@dolby.com',
    emailencodingkey='UTF-8',
    FirstName = 'hello',
    lastname='Testing',
    languagelocalekey='en_US',
    localesidkey='en_US',
    // IsPortalSelfRegistered = true,
    profileid = p.Id,
    ContactId = contact.id,
    timezonesidkey='America/Los_Angeles',
    CommunityNickname = 'Tom',
    isActive = true,
    username='a@dolby.com');
    insert u;
    system.runAs(u) {
            test.startTest();
            User usr = [SELECT profileid FROM USER WHERE Id =: UserInfo.getUserId()];
            Profile p2 = [select id from profile where name =: '~CBA PRM User - Gold'];
            usr.profileid = p2.Id;
            update usr;
            
            RecordType rType2 = [SELECT Id,Name FROM RecordType WHERE SobjectType =: 'Application__c' LIMIT 1];
            
            APXT_CMTR__Conga_Merge_Template__c cMergeTemp3 = new APXT_CMTR__Conga_Merge_Template__c();
            cMergeTemp3.APXT_CMTR__Name__c = 'test';
            insert cMergeTemp3;
            
            APXT_CMTR__Conga_Merge_Template__c cMergeTemp4 = new APXT_CMTR__Conga_Merge_Template__c();
            cMergeTemp4.APXT_CMTR__Name__c = 'test';
            insert cMergeTemp4;
            
            DocuSign_Conga_Template_IDs__c CtempId2 = new DocuSign_Conga_Template_IDs__c();
            CtempId2.Name = 'TemplateIds';
            CtempId2.Out_of_Scope_Id_List__c = cMergeTemp.Id + ',' + cMergeTemp2.Id;
            CtempId2.AML_Form_Company_Borrower_1__c = 'testName';
            CtempId2.AML_Form_Company_Borrower_2__c = 'testName';
            CtempId2.ATF_Funding_Instructions_Broker__c =  cMergeTemp.Id + ',' + cMergeTemp2.Id;
            insert CtempId2;
                
            Opportunity opp2 = new Opportunity();
            opp2.Name = 'testName';
            opp2.CloseDate = date.today();
            opp2.StageName = '1. Enquiry';
            opp2.Description_of_Goods__c = 'test';
            //opp2.Bin_contact__c = con.Id;
            opp2.Amount_Approved__c = 50000;
            opp2.Online_Car_Application__c = 'Yes';
            opp2.Documented_Amount_Financed__c = 10;
            opp2.Broker_Type_AF_del__c = 'Vendor / Agency';
            
            insert opp2;
            
            DocuSign_Tempate_Ids__c templateIDs3 = new DocuSign_Tempate_Ids__c();
            templateIDs3.X2nd_Template_Ids__c = cMergeTemp.Id;
            templateIDs3.RecordType__c = rType2.Name;
            templateIDs3.Template_Ids__c = cMergeTemp.Id;
            templateIDs3.Name = 'Finance Lease';
            insert templateIDs3;
            
            DocuSign_Tempate_Ids__c templateIDs4 = new DocuSign_Tempate_Ids__c();
            templateIDs4.X2nd_Template_Ids__c = cMergeTemp.Id;
            templateIDs4.RecordType__c = rType2.Name;
            templateIDs4.Template_Ids__c = cMergeTemp.Id;
            templateIDs4.Name = 'Equipment Loan';
            insert templateIDs4;

            system.debug('@@@HELLO BEFORE@@@');
            system.debug('@@@RUNAS@@@');
            ApexPages.Standardcontroller standardCon2 = new ApexPages.Standardcontroller(app);   

            PageReference pageRef2 = Page.SendToDocuSign;    
            pageRef2.getParameters().put('id',app.id);
            Test.setCurrentPageReference(pageRef2);

            SendToDocuSignCC controller2= new SendToDocuSignCC(standardCon2);    //instantiate Controller Extension
            controller2.runValidations();

            test.stopTest();
        }
    }
}