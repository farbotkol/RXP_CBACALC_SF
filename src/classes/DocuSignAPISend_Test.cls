/**
 * @description Test Class for DocuSignAPISend
 * @author Mat Isidro
 * @date 02.AUG.2013
 
   20.June.2015 Ian Huang Added additional unit test methods
 */
@isTest
private class DocuSignAPISend_Test {
    static testMethod void DocuSignAPISendTest() {
        test.startTest();
        
        new DocuSignAPISend.PublishConnectFailures_element();
        new DocuSignAPISend.VoidEnvelope_element();
        new DocuSignAPISend.Reminders();
        new DocuSignAPISend.BrandRequestItem();
        new DocuSignAPISend.RecipientEsignList();
        new DocuSignAPISend.BrandResults();
        new DocuSignAPISend.UpdateAddressBookItems_element();
        new DocuSignAPISend.CreateEnvelopeFromTemplatesAndForms_element();
        new DocuSignAPISend.DeleteEnvelopesResponse_element();
        new DocuSignAPISend.SendEnvelope_element();
        new DocuSignAPISend.RequestDocumentPDFsEx_element();
        new DocuSignAPISend.AuthoritativeCopyExportDocuments();
        new DocuSignAPISend.AuthoritativeCopyExportStatus();
        new DocuSignAPISend.ArrayOfFolderItem();
        new DocuSignAPISend.GetRecipientEsignList_element();
        new DocuSignAPISend.CreateEnvelopeResponse_element();
        new DocuSignAPISend.RecipientCorrectionStatus(); 
        new DocuSignAPISend.Expirations();
        new DocuSignAPISend.RequestRecipientFaxPDF_element();
        new DocuSignAPISend.RequestPDFNoWaterMark_element();
        new DocuSignAPISend.RequestDocumentPDFsRecipientsViewResponse_element();
        new DocuSignAPISend.FolderItem(); 
        new DocuSignAPISend.RequestPDFsWithOptions_element();
        new DocuSignAPISend.RequestDocumentPDFsRecipientsView_element();                 
        new DocuSignAPISend.GetFolderList_element();
        new DocuSignAPISend.CreateAccountBrands_element();
        new DocuSignAPISend.CreateAccountBrandsResponse_element();
        new DocuSignAPISend.ArrayOfConnectFailure(); 
        new DocuSignAPISend.CreateAndSendEnvelope_element();
        new DocuSignAPISend.ArrayOfMatchBox(); 
        new DocuSignAPISend.RequestEnvelopeHistoryTokenArg(); 
        new DocuSignAPISend.RequestRecipientToken_element();
        new DocuSignAPISend.TransferEnvelopeStatus(); 
        new DocuSignAPISend.RecipientList(); 
        new DocuSignAPISend.RequestTemplateList_element();
        new DocuSignAPISend.RequestStatusCodes_element();
        new DocuSignAPISend.RemoveAddressBookItems_element();
        new DocuSignAPISend.PDFOptions(); 
        new DocuSignAPISend.RequestTemplateListResponse_element();
        new DocuSignAPISend.GetFolderItems_element();
        new DocuSignAPISend.FilteredEnvelopeStatusChanges(); 
        new DocuSignAPISend.RequestEnvelopeHistoryToken_element();
        new DocuSignAPISend.AddressBookPhoneNumber(); 
        new DocuSignAPISend.MoveEnvelopesArg(); 
        new DocuSignAPISend.ArrayOfFolder(); 
        new DocuSignAPISend.MatchBox(); 
        new DocuSignAPISend.RecipientSignatureInfo(); 
        new DocuSignAPISend.ArrayOfTemplateReferenceFieldDataDataValue(); 
        new DocuSignAPISend.AvailableFolders(); 
        new DocuSignAPISend.TemplateReference(); 
        new DocuSignAPISend.CreateEnvelopeFromTemplates_element();
        new DocuSignAPISend.GetRecipientListResponse_element();
        new DocuSignAPISend.DeleteEnvelopes_element();
        new DocuSignAPISend.GetRecipientList_element();
        new DocuSignAPISend.MoveEnvelopesResponse_element();
        new DocuSignAPISend.BrandDefinitions(); 
        new DocuSignAPISend.CreateEnvelopeFromTemplatesAndFormsResponse_element(); 
        new DocuSignAPISend.UploadTemplateResponse_element(); 
        new DocuSignAPISend.PublishConnectFailuresResult(); 
        new DocuSignAPISend.DeleteAccountBrandsResponse_element();
        new DocuSignAPISend.EnvelopeStatusChangeFilter(); 
        new DocuSignAPISend.SaveTemplateResponse_element();
        new DocuSignAPISend.ArrayOfTemplateReferenceRoleAssignment(); 
        new DocuSignAPISend.ArrayOfBrandRequestItem(); 
        new DocuSignAPISend.TransferEnvelope_element();
        new DocuSignAPISend.PurgeDocuments_element();
        new DocuSignAPISend.RequestTemplates_element();
        new DocuSignAPISend.GetAddressBookItemsResponse_element();
        new DocuSignAPISend.AccountSetting(); 
        new DocuSignAPISend.AddressInformationInput(); 
        new DocuSignAPISend.TemplateReferenceRoleAssignment(); 
        new DocuSignAPISend.AccountMembershipFeaturesList(); 
        new DocuSignAPISend.ArrayOfEnvelopeEvent(); 
        new DocuSignAPISend.AccountSettingsList(); 
        new DocuSignAPISend.PublishConnectFailuresFilter(); 
        new DocuSignAPISend.TransferEnvelopeResponse_element(); 
        new DocuSignAPISend.SendEnvelopeResponse_element();
        new DocuSignAPISend.SSN4InformationInput(); 
        new DocuSignAPISend.RequestTemplateResponse_element();
        new DocuSignAPISend.UploadTemplate_element();
        new DocuSignAPISend.ConnectFailuresFilter(); 
        new DocuSignAPISend.RequestDocumentPDFsResponse_element();
        new DocuSignAPISend.EnvelopePDF(); 
        new DocuSignAPISend.RequestPDFNoWaterMarkResponse_element();
        new DocuSignAPISend.RequestPDF_element();
        new DocuSignAPISend.ArrayOfAddressBookItem1(); 
        new DocuSignAPISend.FoldersFilter(); 
        new DocuSignAPISend.RequestCertificate_element(); 
        new DocuSignAPISend.EnvelopeEvent(); 
        new DocuSignAPISend.SaveTemplateResult(); 
        new DocuSignAPISend.PDFMetaDataTemplate(); 
        new DocuSignAPISend.RequestPDFResponse_element();
        new DocuSignAPISend.FolderFilter(); 
        new DocuSignAPISend.CreateAndSendEnvelopeResponse_element();
        new DocuSignAPISend.RecipientEvent(); 
        new DocuSignAPISend.GetAccountMembershipFeaturesList_element();
        new DocuSignAPISend.GetAddressBookItems_element();
        new DocuSignAPISend.ArrayOfPositiveInteger(); 
        new DocuSignAPISend.RequestStatusCodesResponse_element();
        new DocuSignAPISend.ArrayOfTemplateReference(); 
        new DocuSignAPISend.RequestPDFWithCert_element();
        new DocuSignAPISend.UpdateAddressBookResult(); 
        new DocuSignAPISend.SSN9InformationInput(); 
        new DocuSignAPISend.RequestEnvelopeResponse_element();
        new DocuSignAPISend.TemplateReferenceFieldDataDataValue(); 
        new DocuSignAPISend.AddressBookRemoveItem(); 
        new DocuSignAPISend.MoveEnvelopes_element();
        new DocuSignAPISend.RequestEnvelope_element();
        new DocuSignAPISend.AddressBookItem(); 
        new DocuSignAPISend.ArrayOfRecipientEvent(); 
        new DocuSignAPISend.SaveTemplate_element();
        new DocuSignAPISend.GetConnectFailuresResponse_element();
        new DocuSignAPISend.FolderResults(); 
        new DocuSignAPISend.PurgeDocumentsResponse_element();
        new DocuSignAPISend.DOBInformationInput(); 
        new DocuSignAPISend.RequestDocumentPDFs_element();
        new DocuSignAPISend.RequestDocumentPDFsExResponse_element();
        new DocuSignAPISend.ArrayOfEnvelopeTemplate(); 
        new DocuSignAPISend.DocumentPDFs(); 
        new DocuSignAPISend.TemplateReferenceFieldData(); 
        new DocuSignAPISend.AcknowledgeAuthoritativeCopyExport_element();
        new DocuSignAPISend.RequestCorrectTokenResponse_element();
        new DocuSignAPISend.RequestEnvelopeHistoryTokenResponse_element();
        new DocuSignAPISend.AcknowledgeAuthoritativeCopyExportResponse_element();
        new DocuSignAPISend.RequestRecipientTokenAuthenticationAssertion(); 
        new DocuSignAPISend.RequestPDFsWithOptionsResponse_element();
        new DocuSignAPISend.CorrectAndResendEnvelopeResponse_element();
        new DocuSignAPISend.PDFsOptions(); 
        new DocuSignAPISend.GetAccountBrandsResponse_element();
        new DocuSignAPISend.GetAccountSettingsListResponse_element();
        new DocuSignAPISend.RecipientCaptiveInfo(); 
        new DocuSignAPISend.ArrayOfAddressBookRemoveItem(); 
        new DocuSignAPISend.ArrayOfBrandResultItem(); 
        new DocuSignAPISend.RequestPDFWithCertResponse_element();
        new DocuSignAPISend.RequestRecipientTokenClientURLs(); 
        new DocuSignAPISend.GetRecipientEsignListResponse_element();
        new DocuSignAPISend.RequestStatusChanges_element();
        new DocuSignAPISend.RequestSenderTokenResponse_element();
        new DocuSignAPISend.RequestRecipientFaxTokenResponse_element(); 
        new DocuSignAPISend.RequestPDFWithOptionsResponse_element();
        new DocuSignAPISend.ArrayOfEnvelopeStatusChange(); 
        new DocuSignAPISend.RecipientEsign(); 
        new DocuSignAPISend.EnvelopeTemplates(); 
        new DocuSignAPISend.VaultingOptions(); 
        new DocuSignAPISend.RemoveAddressBookItemsResponse_element();
        new DocuSignAPISend.CreateEnvelope_element();
        new DocuSignAPISend.GetAuthenticationTokenResponse_element();
        new DocuSignAPISend.RequestRecipientTokenResponse_element();
        new DocuSignAPISend.RequestPDFWithOptions_element();
        new DocuSignAPISend.ArrayOfAddressBookItem(); 
        new DocuSignAPISend.GetRecipientAuthenticationStatusEx_element(); 
        new DocuSignAPISend.ConnectFailure(); 
        new DocuSignAPISend.RequestCertificateResponse_element();
        new DocuSignAPISend.DeleteEnvelopesArg(); 
        new DocuSignAPISend.ErrorDetails(); 
        new DocuSignAPISend.BrandResultItem(); 
        new DocuSignAPISend.EnvelopeTemplate(); 
        new DocuSignAPISend.RequestRecipientFaxPDFResponse_element(); 
        new DocuSignAPISend.PublishConnectFailuresResponse_element();
        new DocuSignAPISend.ArrayOfRecipient1(); 
        new DocuSignAPISend.RequestTemplatesResponse_element();
        new DocuSignAPISend.ArrayOfRecipientEsign(); 
        new DocuSignAPISend.UpdateAddressBookItemsResponse_element();
        new DocuSignAPISend.ExportAuthoritativeCopy_element();
        new DocuSignAPISend.RequestRecipientFaxToken_element(); 
        new DocuSignAPISend.ArrayOfString(); 
        new DocuSignAPISend.RequestTemplate_element();
        new DocuSignAPISend.PurgeDocumentStatus(); 
        new DocuSignAPISend.EnvelopeTemplateDefinition(); 
        new DocuSignAPISend.RequestSenderToken_element(); 
        new DocuSignAPISend.CreateEnvelopeFromTemplatesResponse_element();
        new DocuSignAPISend.BrandDeleteRequest(); 
        new DocuSignAPISend.ArrayOfString3(); 
        new DocuSignAPISend.ArrayOfString4(); 
        new DocuSignAPISend.GetRecipientAuthenticationStatusExArg(); 
        new DocuSignAPISend.RequestCorrectToken_element();
        new DocuSignAPISend.ArrayOfString5(); 
        new DocuSignAPISend.DeleteAccountBrands_element();
        new DocuSignAPISend.GetConnectFailures_element();
        new DocuSignAPISend.GetAccountBrands_element();
        new DocuSignAPISend.GetRecipientAuthenticationStatusExResponse_element();
        new DocuSignAPISend.RequestStatusChangesResponse_element();
        new DocuSignAPISend.EventNotification(); 
        new DocuSignAPISend.Folder(); 
        new DocuSignAPISend.FolderTypeInfo(); 
        new DocuSignAPISend.EnvelopeStatusChange(); 
        new DocuSignAPISend.ArrayOfPublishConnectFailuresResult(); 
        new DocuSignAPISend.GetAccountMembershipFeaturesListResponse_element();
        new DocuSignAPISend.CorrectAndResendEnvelope_element();
        new DocuSignAPISend.GetAuthenticationToken_element();
        new DocuSignAPISend.GetFolderItemsResponse_element();
        new DocuSignAPISend.ArrayOfCustomField();
        new DocuSignAPISend.SSN9Information();
        new DocuSignAPISend.Attachment();
        new DocuSignAPISend.ArrayOfEnvelopeStatus();
        new DocuSignAPISend.FormDataXfdfField();    
        new DocuSignAPISend.ArrayOfAttachment();
        new DocuSignAPISend.DocumentStatus();
        new DocuSignAPISend.ArrayOfDocumentPDF();
        new DocuSignAPISend.EnvelopeAuditEventsResult_element();
        new DocuSignAPISend.SynchEnvelopeResponse_element();
        new DocuSignAPISend.RecipientStatusEsignAgreementInformation();
        new DocuSignAPISend.EnvelopeStatus();
        new DocuSignAPISend.EventResult();
        new DocuSignAPISend.ArrayOfFormDataXfdfField();
        new DocuSignAPISend.SSN4Information();
        new DocuSignAPISend.RequestStatusesEx_element();
        new DocuSignAPISend.CustomField();
        new DocuSignAPISend.DocumentPDF();
        new DocuSignAPISend.DocuSignEnvelopeInformation();
        new DocuSignAPISend.SynchEnvelope_element();
        new DocuSignAPISend.EnvelopeAuditEvents_element();
        new DocuSignAPISend.EnvelopeStatusFilter();
        new DocuSignAPISend.ArrayOfTabStatus();
        new DocuSignAPISend.FormDataXfdf();
        new DocuSignAPISend.VoidEnvelopeResponse_element();
        new DocuSignAPISend.RequestStatusesResponse_element();
        new DocuSignAPISend.GetStatusInDocuSignConnectFormatResponse_element();
        new DocuSignAPISend.RequestStatusExResponse_element();  
        new DocuSignAPISend.DOBInformation();
        new DocuSignAPISend.GetStatusInDocuSignConnectFormat_element();
        new DocuSignAPISend.ArrayOfString1();
        new DocuSignAPISend.ArrayOfString2();
        new DocuSignAPISend.ArrayOfDocumentStatus();
        new DocuSignAPISend.AuthenticationStatus();
        new DocuSignAPISend.ArrayOfEnvelopeStatusCode();
        new DocuSignAPISend.SynchEnvelopeStatus();
        new DocuSignAPISend.Ping_element();
        new DocuSignAPISend.RequestStatusEx_element();
        new DocuSignAPISend.IDCheckInformation();
        new DocuSignAPISend.RecipientStatus();
        new DocuSignAPISend.RequestStatus_element();
        new DocuSignAPISend.RequestStatusResponse_element();
        new DocuSignAPISend.RequestStatusesExResponse_element();
        new DocuSignAPISend.FormData();
        new DocuSignAPISend.PingResponse_element();
        new DocuSignAPISend.EnvelopeStatusFilterBeginDateTime();
        new DocuSignAPISend.RequestStatuses_element();
        new DocuSignAPISend.FilteredEnvelopeStatuses();
        new DocuSignAPISend.TabStatus();
        new DocuSignAPISend.ArrayOfRecipientStatus();
        new DocuSignAPISend.EnvelopeAuditEventsResponse_element();
        new DocuSignAPISend.AddressInformation();
        new DocuSignAPISend.VaultingDetails();
        new DocuSignAPISend.UserInfo();
        new DocuSignAPISend.VoidEnvelopeStatus();
        new DocuSignAPISend.APIServiceSoap(); 
        new DocuSignAPISend.ServerTemplate();
        new DocuSignAPISend.ArrayOfServerTemplate();
        new DocuSignAPISend.RecipientPhoneAuthentication();
        new DocuSignAPISend.IDCheckInformationInput();
        new DocuSignAPISend.RecipientCorrectionCorrectedCaptiveInfo();
        new DocuSignAPISend.ArrayOfInlineTemplate();
        new DocuSignAPISend.ArrayOfRecipient();
        new DocuSignAPISend.InlineTemplate();
        new DocuSignAPISend.CompositeTemplate();
        new DocuSignAPISend.EnvelopeSettings();
        new DocuSignAPISend.Notification();
        new DocuSignAPISend.RecipientCorrection();
        new DocuSignAPISend.ArrayOfTab();
        new DocuSignAPISend.AnchorTab();
        new DocuSignAPISend.RecipientEmailNotification();
        new DocuSignAPISend.Tab();
        new DocuSignAPISend.Recipient();
        new DocuSignAPISend.CorrectionStatus();
        new DocuSignAPISend.ArrayOfDocument();
        new DocuSignAPISend.Document();
        new DocuSignAPISend.ArrayOfRecipientCorrection();
        new DocuSignAPISend.GetFolderListResponse_element();
        new DocuSignAPISend.ExportAuthoritativeCopyResponse_element();
        new DocuSignAPISend.ArrayOfRecipientCorrectionStatus();


        test.stopTest();        
    }
    
   
    static testMethod void testCallout1() {
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetAccountSettingsList('');}catch(Exception ex){}
    }   
     
    static testMethod void testCallout2() {
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();    
        try{ binding.RequestStatusEx('');}catch(Exception ex){}
    }    
    static testMethod void testCallout3() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetAddressBookItems(''); }catch(Exception ex){}
    }    
    static testMethod void testCallout4() {
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.PublishConnectFailures(new DocuSignAPISend.PublishConnectFailuresFilter());}catch(Exception ex){}
    }    
    
    
    static testMethod void testCallout5() {
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetStatusInDocuSignConnectFormat('');}catch(Exception ex){}
    }   
    
    static testMethod void testCallout6() { 
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.PurgeDocuments('');}catch(Exception ex){}
    }
    
    static testMethod void testCallout7() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestPDF('');}catch(Exception ex){}
    }
    
    static testMethod void testCallout8() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestPDFWithCert('', false);}catch(Exception ex){}
    }
    
    static testMethod void testCallout8_1() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.VoidEnvelope('', '');}catch(Exception ex){}
    }
    
    static testMethod void testCallout9() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestStatusesEx(new DocuSignAPISend.EnvelopeStatusFilter());}catch(Exception ex){}
    }
    
    static testMethod void testCallout10() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.TransferEnvelope('', '', '');}catch(Exception ex){}
    }

    static testMethod void testCallout11() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.ExportAuthoritativeCopy('');}catch(Exception ex){}
    }

    static testMethod void testCallout12() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.CreateEnvelopeFromTemplatesAndForms(new DocuSignAPISend.EnvelopeInformation(), new DocuSignAPISend.ArrayOfCompositeTemplate(), false);}catch(Exception ex){}
    }

    static testMethod void testCallout13() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestTemplateList(new DocuSignAPISend.ArrayOfString5(), false);}catch(Exception ex){}
    }

    static testMethod void testCallout14() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetRecipientEsignList('', '', '', '');}catch(Exception ex){}
    }
    
    static testMethod void testCallout15() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.CreateEnvelope(new DocuSignAPISend.Envelope());       }catch(Exception ex){}                 
    }    
    
    static testMethod void testCallout16() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestTemplates('', false);}catch(Exception ex){}
    }
    
    static testMethod void testCallout17() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.SynchEnvelope('', '', false);}catch(Exception ex){}
    }    
    
    static testMethod void testCallout18() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestStatus('');}catch(Exception ex){}
    }    
    
    static testMethod void testCallout19() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestSenderToken('', '', '');}catch(Exception ex){}
    }    
    
    static testMethod void testCallout20() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.AcknowledgeAuthoritativeCopyExport('', '', '');}catch(Exception ex){}
    }    
    
    static testMethod void testCallout21() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetConnectFailures(new DocuSignAPISend.ConnectFailuresFilter());}catch(Exception ex){}
    }    
    
    static testMethod void testCallout22() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RemoveAddressBookItems(new DocuSignAPISend.ArrayOfAddressBookRemoveItem(), false);}catch(Exception ex){}
    }

    static testMethod void testCallout23() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestStatuses(new DocuSignAPISend.EnvelopeStatusFilter());}catch(Exception ex){}
    }
    
    static testMethod void testCallout24() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.Ping();}catch(Exception ex){}
    }    

    static testMethod void testCallout25() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.DeleteAccountBrands('', new DocuSignAPISend.BrandDeleteRequest());}catch(Exception ex){}
    }
    
    static testMethod void testCallout26() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
    
        try{ binding.RequestDocumentPDFs('');}catch(Exception ex){}
    }
    
    static testMethod void testCallout27() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestEnvelopeHistoryToken(new DocuSignAPISend.RequestEnvelopeHistoryTokenArg());}catch(Exception ex){}
    }
    
    static testMethod void testCallout28() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.CreateAccountBrands('', new DocuSignAPISend.BrandDefinitions());}catch(Exception ex){}
    } 

    static testMethod void testCallout29() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetRecipientList('', '');}catch(Exception ex){}
    }
    
    static testMethod void testCallout30() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestStatusChanges(new DocuSignAPISend.EnvelopeStatusChangeFilter());}catch(Exception ex){}
    }

    static testMethod void testCallout31() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestRecipientFaxPDF('', '', '', '', new DocuSignAPISend.RequestRecipientTokenAuthenticationAssertion());}catch(Exception ex){}
    }  

    static testMethod void testCallout32() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.DeleteEnvelopes(new DocuSignAPISend.DeleteEnvelopesArg());}catch(Exception ex){}
    } 

    static testMethod void testCallout33() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetAuthenticationToken('');}catch(Exception ex){}
    }
    
    static testMethod void testCallout34() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestPDFNoWaterMark('');}catch(Exception ex){}
    }
    
    static testMethod void testCallout35() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestRecipientToken('', '', '', '', new DocuSignAPISend.RequestRecipientTokenAuthenticationAssertion(), new DocuSignAPISend.RequestRecipientTokenClientURLs());}catch(Exception ex){}
    }

    static testMethod void testCallout36() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.UpdateAddressBookItems(new DocuSignAPISend.ArrayOfAddressBookItem(), false);}catch(Exception ex){}
    } 

    static testMethod void testCallout37() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.EnvelopeAuditEvents('');}catch(Exception ex){}
    }
 
    static testMethod void testCallout38() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.SaveTemplate(new DocuSignAPISend.EnvelopeTemplate());}catch(Exception ex){}
    }    
    static testMethod void testCallout39() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.CreateAndSendEnvelope(new DocuSignAPISend.Envelope());}catch(Exception ex){}
    }
    static testMethod void testCallout40() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestDocumentPDFsEx('');}catch(Exception ex){}
    }
    static testMethod void testCallout41() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestPDFWithOptions('', new DocuSignAPISend.PDFOptions());}catch(Exception ex){}
    }
    
    static testMethod void testCallout42() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.UploadTemplate('', '', false);}catch(Exception ex){}
    }   
    
    static testMethod void testCallout50() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.MoveEnvelopes(new DocuSignAPISend.MoveEnvelopesArg());}catch(Exception ex){}
    }
    
    static testMethod void testCallout51() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestPDFsWithOptions('', new DocuSignAPISend.PDFsOptions());}catch(Exception ex){}
    }
    
    static testMethod void testCallout52() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetAccountBrands('');}catch(Exception ex){}
    }    
    
    static testMethod void testCallout53() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestCertificate('');}catch(Exception ex){}
    }    

    static testMethod void testCallout60() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestCorrectToken('', false, '');}catch(Exception ex){}
    }
    static testMethod void testCallout61() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetRecipientAuthenticationStatusEx(new DocuSignAPISend.GetRecipientAuthenticationStatusExArg());}catch(Exception ex){}
    }
    static testMethod void testCallout62() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestEnvelope('', false);}catch(Exception ex){}
    }
    static testMethod void testCallout63() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestStatusCodes(new DocuSignAPISend.EnvelopeStatusFilter());}catch(Exception ex){}
    }
    static testMethod void testCallout64() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetAccountMembershipFeaturesList('');}catch(Exception ex){}
    }
    static testMethod void testCallout65() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetFolderList(new DocuSignAPISend.FoldersFilter()); }catch(Exception ex){}
    }
    static testMethod void testCallout66() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        
        try{ binding.RequestRecipientFaxToken('', '', '', '', new DocuSignAPISend.RequestRecipientTokenAuthenticationAssertion(), new DocuSignAPISend.RequestRecipientTokenClientURLs());}catch(Exception ex){}
    }
    static testMethod void testCallout71() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.CreateEnvelopeFromTemplates(new DocuSignAPISend.ArrayOfTemplateReference(), new DocuSignAPISend.ArrayOfRecipient1(), new DocuSignAPISend.EnvelopeInformation(), false);}catch(Exception ex){}
    }
    static testMethod void testCallout81() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.CorrectAndResendEnvelope(new DocuSignAPISend.Correction());}catch(Exception ex){}
    }
    static testMethod void testCallout91() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.SendEnvelope('', '');}catch(Exception ex){}
    }
    static testMethod void testCallout112() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.GetFolderItems(new DocuSignAPISend.FolderFilter());}catch(Exception ex){}
    }
    static testMethod void testCallout113() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestTemplate('', false);}catch(Exception ex){}
    } 
    static testMethod void testCallout114() {    
        DocuSignAPISend.APIServiceSoap binding = new DocuSignAPISend.APIServiceSoap();
        try{ binding.RequestDocumentPDFsRecipientsView('', '', '');}catch(Exception ex){}        
     }

}