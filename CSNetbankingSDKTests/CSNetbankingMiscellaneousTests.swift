//
//  CSNetbankingMiscellaneousTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingMiscellaneousTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testServicesList()
    {
        self.judgeSession.setNextCase( caseId: "services.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.services.list(params) { result in
            switch (result) {
            case .success(let servicesList):
                let paginationTest = self.checkPagination(pagination: servicesList.pagination, pageNumber: 0, pageCount: 1, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let services: [ServiceResponse] = servicesList.items
                
                XCTAssertEqual(services.count, 1)
                XCTAssertEqual(services[0].id, "EB8816A9C0E29A47F564E0BC2F30F8BB5A2FDB84")
                XCTAssertEqual(services[0].nameI18N, "SERVIS 24")
                XCTAssertEqual(services[0].iconGroup, "S24")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSettingsGet()
    {
        self.judgeSession.setNextCase( caseId: "settings.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.settings.get() { result in
            switch (result) {
            case .success(let settings):
                XCTAssertEqual(settings.language.value, Language.cs.value)
                
                XCTAssertEqual(settings.flags?.count, 4)
                XCTAssertEqual(settings.flags?[0], "displayInsurances")
                XCTAssertEqual(settings.flags?[1], "displayBuildings")
                XCTAssertEqual(settings.flags?[2], "displayCreditCards")
                XCTAssertEqual(settings.flags?[3], "displayInvestments")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSettingsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "settings.update", xcTestCase: self)
        
        let expectation      = self.expectation(description: "Response expectation")
        let request          = SettingsRequest()
        request.language     = .cs
        request.flags        = ["displayInsurances", "displayBuildings"]
        
        self.client.settings.update(request) { result in
            switch (result) {
            case .success(let signableSettings):
                XCTAssertEqual(signableSettings.settings.language.value, Language.cs.value)
                
                XCTAssertEqual(signableSettings.settings.flags?.count, 4)
                XCTAssertEqual(signableSettings.settings.flags?[0], "displayInsurances")
                XCTAssertEqual(signableSettings.settings.flags?[1], "displayBuildings")
                XCTAssertEqual(signableSettings.settings.flags?[2], "displayCreditCards")
                XCTAssertEqual(signableSettings.settings.flags?[3], "displayInvestments")
                
                XCTAssertEqual(signableSettings.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContactsList()
    {
        self.judgeSession.setNextCase( caseId: "contacts.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contacts.list() { result in
            switch (result) {
            case .success(let contactList):
                let contacts: [ContactResponse] = contactList.items
                
                XCTAssertEqual(contacts.count, 2)
                
                XCTAssertEqual(contacts[0].id, "postaladdresspermanent")
                XCTAssertEqual(contacts[0].type.value,ContactType.address.value)
                
                XCTAssertEqual(contacts[0].flags?.count, 1)
                XCTAssertEqual(contacts[0].flags?[0], "mainContact")
                
                XCTAssertEqual(contacts[0].address?.type.value, ContactAddressType.permanentResidence.value)
                XCTAssertEqual(contacts[0].address?.typeI18N, "Trvalá adresa")
                XCTAssertEqual(contacts[0].address?.country, "CZ")
                XCTAssertEqual(contacts[0].address?.city, "Rakovník")
                XCTAssertEqual(contacts[0].address?.street, "Pod Václavem")
                XCTAssertEqual(contacts[0].address?.buildingApartment, "2092")
                XCTAssertEqual(contacts[0].address?.zipCode, "26901")
                
                XCTAssertEqual(contacts[1].id, "phonenumberprimary")
                XCTAssertEqual(contacts[1].type.value, ContactType.phone.value)
                
                XCTAssertEqual(contacts[1].flags?.count, 1)
                XCTAssertEqual(contacts[1].flags?[0], "mainContact")
                
                XCTAssertEqual(contacts[1].phone?.type.value, ContactPhoneType.privatePhone.value)
                XCTAssertEqual(contacts[1].phone?.typeI18N, "Telefonní číslo")
                XCTAssertEqual(contacts[1].phone?.countryCallingCode, "+420")
                XCTAssertEqual(contacts[1].phone?.phoneNumber, "722736507")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContactsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "contacts.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contacts.withId("postaladdresspermanent").get() { result in
            switch (result) {
            case .success(let contact):
                XCTAssertEqual(contact.id, "postaladdresspermanent")
                XCTAssertEqual(contact.type.value, ContactType.address.value)
                
                XCTAssertEqual(contact.flags?.count, 1)
                XCTAssertEqual(contact.flags?[0], "mainContact")
                
                XCTAssertEqual(contact.address?.type.value, ContactAddressType.permanentResidence.value)
                XCTAssertEqual(contact.address?.typeI18N, "Trvalá adresa")
                XCTAssertEqual(contact.address?.country, "CZ")
                XCTAssertEqual(contact.address?.city, "Rakovník")
                XCTAssertEqual(contact.address?.street, "Pod Václavem")
                XCTAssertEqual(contact.address?.buildingApartment, "2092")
                XCTAssertEqual(contact.address?.zipCode, "26901")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testPromotionsList()
    {
        self.judgeSession.setNextCase( caseId: "promotions.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.promotions.list() { result in
            switch (result) {
            case .success(let promotionsList):
                let promotions: [PromotionResponse] = promotionsList.items
                
                XCTAssertEqual(promotions.count, 1)
                XCTAssertEqual(promotions[0].promotionId, "218")
                
                XCTAssertEqual(promotions[0].displayType.titleText, "Plugin Mobilní Platby")
                XCTAssertEqual(promotions[0].displayType.sublineText, "Aktivace pluginu zdarma")
                XCTAssertEqual(promotions[0].displayType.displayType.value, DisplayTypeKind.overviewCard.value)
                XCTAssertEqual(promotions[0].displayType.cardDesign.value, CardDesign.pluginPromotion.value)
                XCTAssertEqual(promotions[0].displayType.backgroundImage, "banner_ie_680x180_3020.xml")
                XCTAssertEqual(promotions[0].displayType.mainImage, "banner_ie_222x137_26.xml")
                XCTAssertEqual(promotions[0].displayType.position, 1)
                XCTAssertEqual(promotions[0].displayType.column, 4)
                XCTAssertEqual(promotions[0].displayType.btnText, "Aktivovat")
                XCTAssertEqual(promotions[0].displayType.btnDesign?.value, ButtonDesign.primaryType.value)
                
                XCTAssertEqual(promotions[0].actions.count, 2)
                
                XCTAssertEqual(promotions[0].actions[0].actionId, "SHOWURL")
                XCTAssertEqual(promotions[0].actions[0].actionType.value, ActionType.showUrl.value)
                XCTAssertEqual(promotions[0].actions[0].target, "_self")
                XCTAssertEqual(promotions[0].actions[0].url, "#shop/plugins/PI-MOBILEPAYMENTS")
                XCTAssertEqual(promotions[0].actions[0].productCode?.value, ProductCode.piMobilePayments.value)
                
                XCTAssertEqual(promotions[0].actions[1].actionId, "HIDE")
                XCTAssertEqual(promotions[0].actions[1].actionType.value, ActionType.hide.value)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testPromotionsCreate()
    {
        self.judgeSession.setNextCase( caseId: "promotions.create", xcTestCase: self)
        
        let expectation                                   = self.expectation(description: "Response expectation")
        
        let createPromotionRequest                        = CreatePromotionRequest()
        createPromotionRequest.promotionId                = "218"
        createPromotionRequest.executedAction             = PromotionExecutedAction()
        createPromotionRequest.executedAction!.actionId   = "HIDE"
        createPromotionRequest.executedAction!.actionType = .hide
        
        self.client.promotions.create(createPromotionRequest) { result in
            switch (result) {
            case .success(let createPromotionResponse):
                XCTAssertEqual(createPromotionResponse.infoItems?.count, 1)
                XCTAssertEqual(createPromotionResponse.infoItems?[0].infoName, "RETURN_MESSAGE")
                XCTAssertEqual(createPromotionResponse.infoItems?[0].infoValue, "successfully executed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAuthorizationLimitsList()
    {
        self.judgeSession.setNextCase( caseId: "authorizationLimits.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = AuthorizationLimitsParameters(channel: "George")
        
        self.client.authorizationLimits.list(params) { result in
            switch (result) {
            case .success(let authorizationLimitsList):
                let authorizationLimits: [AuthorizationLimitResponse] = authorizationLimitsList.items
                
                XCTAssertEqual(authorizationLimits.count, 2)
                
                XCTAssertEqual(authorizationLimits[0].id, "934872973982")
                XCTAssertEqual(authorizationLimits[0].authorizationType.value, AuthorizationType.TAC.rawValue)
                XCTAssertEqual(authorizationLimits[0].channelId.value, ChannelId.netBanking.value )
                XCTAssertEqual(authorizationLimits[0].applicationId.value, ApplicationId.george.value)
                
                XCTAssertEqual(authorizationLimits[0].dailyLimit?.value, 400000)
                XCTAssertEqual(authorizationLimits[0].dailyLimit?.precision, 2)
                XCTAssertEqual(authorizationLimits[0].dailyLimit?.currency, "EUR")
                
                XCTAssertEqual(authorizationLimits[0].transactionLimit?.value, 100000)
                XCTAssertEqual(authorizationLimits[0].transactionLimit?.precision, 2)
                XCTAssertEqual(authorizationLimits[0].transactionLimit?.currency, "EUR")
                
                XCTAssertEqual(authorizationLimits[0].maxBankLimit?.value, 1700000)
                XCTAssertEqual(authorizationLimits[0].maxBankLimit?.precision, 2)
                XCTAssertEqual(authorizationLimits[0].maxBankLimit?.currency, "EUR")
                
                XCTAssertEqual(authorizationLimits[1].id, "934872973987")
                XCTAssertEqual(authorizationLimits[1].authorizationType.value, AuthorizationType.TAC.rawValue)
                XCTAssertEqual(authorizationLimits[1].channelId.value, ChannelId.netBanking.value )
                XCTAssertEqual(authorizationLimits[1].applicationId.value, ApplicationId.internetBanking.value)
                
                XCTAssertEqual(authorizationLimits[1].dailyLimit?.value, 150000)
                XCTAssertEqual(authorizationLimits[1].dailyLimit?.precision, 2)
                XCTAssertEqual(authorizationLimits[1].dailyLimit?.currency, "EUR")
                
                XCTAssertEqual(authorizationLimits[1].transactionLimit?.value, 90000)
                XCTAssertEqual(authorizationLimits[1].transactionLimit?.precision, 2)
                XCTAssertEqual(authorizationLimits[1].transactionLimit?.currency, "EUR")
                
                XCTAssertEqual(authorizationLimits[1].maxBankLimit?.value, 900000)
                XCTAssertEqual(authorizationLimits[1].maxBankLimit?.precision, 2)
                XCTAssertEqual(authorizationLimits[1].maxBankLimit?.currency, "EUR")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAuthorizationLimitsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "authorizationLimits.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.authorizationLimits.withId("934872973982").get() { result in
            switch (result) {
            case .success(let authorizationLimit):
                XCTAssertEqual(authorizationLimit.id, "934872973982")
                XCTAssertEqual(authorizationLimit.authorizationType.value, AuthorizationType.TAC.rawValue)
                XCTAssertEqual(authorizationLimit.channelId.value, ChannelId.netBanking.value)
                XCTAssertEqual(authorizationLimit.applicationId.value, ApplicationId.george.value)
                
                XCTAssertEqual(authorizationLimit.dailyLimit?.value, 400000)
                XCTAssertEqual(authorizationLimit.dailyLimit?.precision, 2)
                XCTAssertEqual(authorizationLimit.dailyLimit?.currency, "CZK")
                
                XCTAssertEqual(authorizationLimit.transactionLimit?.value, 100000)
                XCTAssertEqual(authorizationLimit.transactionLimit?.precision, 2)
                XCTAssertEqual(authorizationLimit.transactionLimit?.currency, "CZK")
                
                XCTAssertEqual(authorizationLimit.maxBankLimit?.value, 1700000)
                XCTAssertEqual(authorizationLimit.maxBankLimit?.precision, 2)
                XCTAssertEqual(authorizationLimit.maxBankLimit?.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAuthorizationTokenDelete()
    {
        self.judgeSession.setNextCase( caseId: "authorizationToken.delete", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.authorizationToken.delete() { result in
            switch (result) {
            case .success(_):
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }


}
