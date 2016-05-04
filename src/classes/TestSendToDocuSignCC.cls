/*------------------------------------------------------------
Author:        Sairah Hadjinoor
Company:       Cloud Sherpas
Description:   Test Class for SendToDocuSignCC
History
27/11/2012      Sairah Hadjinoor     Created
------------------------------------------------------------*/
@isTest(seeAllData=true)
private class TestSendToDocuSignCC {
    static testMethod void CreateApplication() {
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        
        appList[0].Opportunity__c = oppList[0].Id;
        update appList;
        
        test.startTest();
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC con= new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        con.runValidations();
        test.stopTest();
    }


    static testMethod void CreateApplication1a() {
        
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        
        appList[0].Opportunity__c = oppList[0].Id;
        update appList;
        
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC cont = new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        cont.runValidations();
        
        Account acct = new Account(Name='Account',Phone='8888');
        insert acct;
        
        Contact con = new Contact(LastName='Contact', AccountId=acct.id, Platinum_Broker__c=true);
        insert con;
       
        Profile p = [Select Name from Profile where Name='~CBA PRM User - Gold' limit 1];       
        
        User user = new User(alias = 'Alias', email='monitor@testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', profileid=p.Id, ContactId=con.id,
        localesidkey='en_US', timezonesidkey='Australia/Sydney', username='monitor@testorg.com', delegatedApproverId=System.Userinfo.getUserId());
        insert user;            
        
        system.runAs(user) {        
            test.startTest();
            //List<Contact> conList = TestClassHelper.createContacts(1);
            List<Application__c> appList2 = TestClassHelper.createApplication(1);
            List<Opportunity> oppList2 = TestClassHelper.createOpportunity(1);
            
            appList2[0].Opportunity__c = oppList2[0].Id;
            update appList2;
            

            system.debug('@@@HELLO BEFORE@@@');
            system.debug('@@@RUNAS@@@');
            ApexPages.Standardcontroller standardCon2 = new ApexPages.Standardcontroller(appList2[0]);   
    
            PageReference pageRef2 = Page.SendToDocuSign;    
            pageRef2.getParameters().put('id',appList2[0].id);
            Test.setCurrentPageReference(pageRef2);
    
            SendToDocuSignCC con2= new SendToDocuSignCC(standardCon2);    //instantiate Controller Extension
            con2.runValidations();

            test.stopTest();
        }
    }   
    
  
    static testMethod void CreateApplication2() {
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        
        appList[0].Opportunity__c = oppList[0].Id;
        update appList;
        
        oppList[0].Amount_Approved__c = 155555.00;
        oppList[0].Online_Car_Application__c = 'Yes';
        update oppList[0];
        
        test.startTest();
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC con= new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        con.runValidations();
        oppList[0].Amount_Approved__c = 255555.00;
        update oppList[0];
        con.runValidations();
        test.stopTest();
    }

       
    static testMethod void CreateApplication3() {
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        List<Attachment> attList = TestClassHelper.createAttachment(1, appList[0].Id);
        
        appList[0].Opportunity__c = oppList[0].Id;
        appList[0].Text__c +=',a0F20000001DpBb';
        appList[0].X1_Company_Name_Borrower__c  = 'Test Name';
        appList[0].X1_Company_Name_Borrower_Contact_Num_C__c = '34567890';
        appList[0].X1_Company_Name_Borrower_Email_Address_C__c='test@test.com';
        appList[0].No_of_Individual_Borrowers__c = '1';
        update appList;
        
        test.startTest();
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    //ensure that page being tested is sendtodocusign
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC con= new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        con.runValidations();
        test.stopTest();
    }

       
    static testMethod void CreateApplication4() {
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        List<Attachment> attList = TestClassHelper.createAttachment(1, appList[0].Id);
        
        appList[0].Opportunity__c = oppList[0].Id;
        appList[0].Text__c +=',a0F20000001DpBb';
        appList[0].X1_Company_Name_Borrower__c  = 'Test Name';
        appList[0].X1_Company_Name_Borrower_Contact_Num_C__c = '34567890';
        appList[0].X1_Company_Name_Borrower_Email_Address_C__c='test@test.com';
        appList[0].X2_Borrower_Name_IB__c  = 'Test Name';
        appList[0].X2_Borrower_Name_Contact_Number_IB_C__c = '34567890';
        appList[0].X2_Borrower_Name_Email_Address_IB_C__c='test@test.com';
        appList[0].No_of_Individual_Borrowers__c = '1';
        appList[0].Drawdown_under_a_Master_Agreement__c = 'Yes';
        update appList;
        
        test.startTest();
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    //ensure that page being tested is sendtodocusign
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC con= new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        con.runValidations();
        test.stopTest();
    }

       
    static testMethod void CreateApplication5() {
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        List<Attachment> attList = TestClassHelper.createAttachment(1, appList[0].Id);
        
        appList[0].Opportunity__c = oppList[0].Id;
        appList[0].Text__c +=',a0F20000001DpBb';
        appList[0].X1_Company_Name_Borrower__c  = 'Test Name';
        appList[0].X1_Company_Name_Borrower_Contact_Num_C__c = '34567890';
        appList[0].X1_Company_Name_Borrower_Email_Address_C__c='test@test.com';
        appList[0].X2_Borrower_Name_IB__c  = 'Test2';
        appList[0].X2_Borrower_Name_Contact_Number_IB_C__c = null;
        appList[0].X2_Borrower_Name_Email_Address_IB_C__c=null;
        appList[0].No_of_Individual_Borrowers__c = '2';
        appList[0].Drawdown_under_a_Master_Agreement__c = 'Yes';
        update appList;
        
        test.startTest();
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    //ensure that page being tested is sendtodocusign
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC con= new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        con.runValidations();
        test.stopTest();
    }

       
    static testMethod void CreateApplication6() {
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        List<Attachment> attList = TestClassHelper.createAttachment(1, appList[0].Id);
        
        appList[0].Opportunity__c = oppList[0].Id;
        appList[0].Text__c +=',a0F20000001DpBb';
        appList[0].X1_Company_Name_Borrower__c  = 'Test Name';
        appList[0].X1_Company_Name_Borrower_Contact_Num_C__c = '34567890';
        appList[0].X1_Company_Name_Borrower_Email_Address_C__c='test@test.com';
        appList[0].X2_Borrower_Name_IB__c  = 'Test2';
        appList[0].X2_Borrower_Name_Contact_Number_IB_C__c = null;
        appList[0].X2_Borrower_Name_Email_Address_IB_C__c=null;
        appList[0].No_of_Individual_Borrowers__c = '2';
        update appList;
        
        test.startTest();
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    //ensure that page being tested is sendtodocusign
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC con= new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        con.runValidations();
        test.stopTest();
    }

       
    static testMethod void CreateApplication7() {
        List<Application__c> appList = TestClassHelper.createApplication(1);
        List<Opportunity> oppList = TestClassHelper.createOpportunity(1);
        List<Attachment> attList = TestClassHelper.createAttachment(1, appList[0].Id);
        
        appList[0].Opportunity__c = oppList[0].Id;
        update appList;
        
        oppList[0].Amount_Approved__c = 2500000.00;
        oppList[0].Online_Car_Application__c = 'Yes';
        update oppList[0];
        
        
        test.startTest();
        ApexPages.Standardcontroller standardCon = new ApexPages.Standardcontroller(appList[0]);   

        PageReference pageRef = Page.SendToDocuSign;    //ensure that page being tested is sendtodocusign
        pageRef.getParameters().put('id',appList[0].id);
        Test.setCurrentPageReference(pageRef);

        SendToDocuSignCC con= new SendToDocuSignCC(standardCon);    //instantiate Controller Extension
        con.runValidations();
        test.stopTest();
    }
}