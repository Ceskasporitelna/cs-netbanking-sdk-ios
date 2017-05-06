//
//  CSNetbankingCardTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingCardTests: CSNetbankingTest
{

    //--------------------------------------------------------------------------
    func testCardList()
    {
        self.judgeSession.setNextCase( caseId: "cards.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = CardsParameters(pagination: nil, sort: Sort( by:[(.id, .ascending),(.product, .descending)]))
        
        var cardsList : PaginatedListResponse<CardResponse>? = nil
        self.client.cards.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                cardsList = list
                XCTAssertTrue(cardsList?.items.count == 2, "Cards list items count must be 2.")
                
                var card = cardsList?.items [0]
                XCTAssertEqual(card?.id, "33A813886442D946122C78305EC4E482DE9F574D")
                XCTAssertEqual(card?.owner, "VOJTÍŠKOVÁ ANNA")
                XCTAssertEqual(card?.number, "451161XXXXXX1987")
                XCTAssertEqual(card?.sequenceNumber, "2")
                XCTAssertEqual(card?.productCode, "4511611")
                XCTAssertEqual(self.dateFormatter.date( from: "2018-03-31" ), card?.expiryDate)
                XCTAssertEqual(card?.state.value, "TEMPORARY_BLOCKED")
                XCTAssertEqual(card?.type.value, "BANK_CARD")
                XCTAssertEqual(card?.provider.value, CardProvider.ersteBank.value)
                XCTAssertEqual(self.dateFormatter.date(from:  "2015-04-01" ), card?.validFromDate)
                XCTAssertEqual(card?.characteristic?.value, "MAIN")
                
                var account = card?.mainAccount
                XCTAssertEqual(account?.id, "076E1DBCCCD38729A99D93AC8D3E8273237C7E36")
                XCTAssertEqual(account?.holderName, "Anna Vojtíšková")
                
                var accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2328489013")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                XCTAssertEqual(card?.cardDeliveryMode?.value, "HOME")
                
                var flags = card?.flags
                XCTAssertTrue(flags?.count == 4, "Cards [0] flags count must be 4.")
                XCTAssertEqual(flags?[0], "automaticReplacementOn")
                XCTAssertEqual(flags?[1], "secureOnlineShoppingEnabled")
                XCTAssertEqual(flags?[2], "activationAllowed")
                XCTAssertEqual(flags?[3], "contactlessEnabled")
                
                var features = card?.features
                XCTAssertTrue(features?.count == 3, "Cards [0] features count must be 3.")
                XCTAssertEqual(features?[0], "contactless")
                XCTAssertEqual(features?[1], "replacementCard")
                XCTAssertEqual(features?[2], "secureOnlineShopping")
                
                XCTAssertEqual(card?.lockReason?.value, "LOSS")
                XCTAssertEqual(card?.productI18N, "Visa Classic debetní - Partner")
                
                card = cardsList?.items [1]
                XCTAssertEqual(card?.id, "3FB37388FC58076DEAD3DE282E075592A299B596")
                XCTAssertEqual(card?.owner, "VOJTÍŠKOVÁ ANNA")
                XCTAssertEqual(card?.number, "451161XXXXXX1552")
                XCTAssertEqual(card?.sequenceNumber, "2")
                XCTAssertEqual(card?.productCode, "4511611")
                XCTAssertEqual(self.dateFormatter.date(from:  "2019-02-28" ), card?.expiryDate)
                XCTAssertEqual(card?.state.value, "INACTIVE")
                XCTAssertEqual(card?.type.value, "BANK_CARD")
                XCTAssertEqual(card?.provider.value, "ERSTE_BANK")
                XCTAssertEqual(self.dateFormatter.date(from:  "2016-02-01" ), card?.validFromDate)
                XCTAssertEqual(card?.characteristic?.value, "MAIN")
                
                account = card?.mainAccount
                XCTAssertEqual(account?.id, "076E1DBCCCD38729A99D93AC8D3E8273237C7E36")
                XCTAssertEqual(account?.holderName, "Anna Vojtíšková")
                
                accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2328489013")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                XCTAssertEqual(card?.cardDeliveryMode?.value, "OTHER_BRANCH")
                
                flags = card?.flags
                XCTAssertTrue(flags?.count == 4, "Cards [1] flags count must be 4.")
                XCTAssertEqual(flags?[0], "automaticReplacementOn")
                XCTAssertEqual(flags?[1], "secureOnlineShoppingEnabled")
                XCTAssertEqual(flags?[2], "activationAllowed")
                XCTAssertEqual(flags?[3], "contactlessEnabled")
                
                features = card?.features
                XCTAssertTrue(features?.count == 6, "Cards [1] features count must be 6.")
                XCTAssertEqual(features?[0], "reissuePin")
                XCTAssertEqual(features?[1], "contactless")
                XCTAssertEqual(features?[2], "onlineLocking")
                XCTAssertEqual(features?[3], "replacementCard")
                XCTAssertEqual(features?[4], "secureOnlineShopping")
                XCTAssertEqual(features?[5], "cardDelivery")
                
                XCTAssertEqual(card?.productI18N, "Visa Classic debetní - Partner")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testCardsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "cards.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = CardsParameters(pagination: Pagination(pageNumber: 0, pageSize: 1), sort: nil)
        
        var cardsList : PaginatedListResponse<CardResponse>? = nil
        self.client.cards.list(params){ result in
            switch ( result ) {
            case .success( let cards ):
                cardsList          = cards
                let paginationTest = self.checkPagination(pagination: cardsList!.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(cardsList?.items.count == 1, "Cards list items count must be 1.")
                
                let card = cardsList?.items [0]
                XCTAssertEqual(card?.id, "A705433CFCD205249F4B816F2C63D309AEEFF4C9")
                XCTAssertEqual(card?.owner, "VRBA ALEŠ")
                XCTAssertEqual(card?.number, "451161XXXXXX7982")
                XCTAssertEqual(card?.sequenceNumber, "3")
                XCTAssertEqual(card?.productCode, "4511611")
                XCTAssertEqual(self.dateFormatter.date(from:  "2017-11-30" ), card?.expiryDate)
                XCTAssertEqual(card?.state.value, "TEMPORARY_BLOCKED")
                XCTAssertEqual(card?.type.value, "BANK_CARD")
                XCTAssertEqual(card?.provider.value, "ERSTE_BANK")
                XCTAssertEqual(self.dateFormatter.date(from:  "2014-12-01" ), card?.validFromDate)
                XCTAssertEqual(card?.characteristic?.value, "MAIN")
                
                let account = card?.mainAccount
                XCTAssertEqual(account?.id, "4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE")
                XCTAssertEqual(account?.holderName, "Aleš Vrba")
                
                let accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2059930033")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                XCTAssertEqual(card?.cardDeliveryMode?.value, "HOME")
                
                let flags = card?.flags
                XCTAssertTrue(flags?.count == 3, "Cards [0] flags count must be 3.")
                XCTAssertEqual(flags?[0], "automaticReplacementOn")
                XCTAssertEqual(flags?[1], "activationAllowed")
                XCTAssertEqual(flags?[2], "contactlessEnabled")
                
                let features = card?.features
                XCTAssertTrue(features?.count == 3, "Cards [0] features count must be 3.")
                XCTAssertEqual(features?[0], "contactless")
                XCTAssertEqual(features?[1], "replacementCard")
                XCTAssertEqual(features?[2], "secureOnlineShopping")
                
                XCTAssertEqual(card?.lockReason?.value, "LOSS")

                XCTAssertEqual(card?.productI18N, "Visa Classic debetní - Partner")
                
                expectation.fulfill()

            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "cards.list.page1", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = CardsParameters(pagination: Pagination(pageNumber: 1, pageSize: 1), sort: nil)
        
        var cardsList : PaginatedListResponse<CardResponse>? = nil
        self.client.cards.list(params){ result in
            switch ( result ) {
            case .success( let cards ):
                cardsList          = cards
                let paginationTest = self.checkPagination(pagination: cardsList!.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(cardsList?.items.count == 1, "Cards list items count must be 1.")
                
                let card = cardsList?.items [0]
                XCTAssertEqual(card?.id, "FAFBFBDCAE6465F6DB8058746A828E195922CB15")
                XCTAssertEqual(card?.owner, "VRBA ALEŠ")
                XCTAssertEqual(card?.number, "451161XXXXXX6026")
                XCTAssertEqual(card?.sequenceNumber, "1")
                XCTAssertEqual(card?.productCode, "4511611")
                XCTAssertEqual(self.dateFormatter.date(from:  "2018-03-31" ), card?.expiryDate)
                XCTAssertEqual(card?.state.value, "ACTIVE")
                XCTAssertEqual(card?.type.value, "BANK_CARD")
                XCTAssertEqual(card?.provider.value, "ERSTE_BANK")
                XCTAssertEqual(self.dateFormatter.date(from:  "2015-04-01" ), card?.validFromDate)
                XCTAssertEqual(card?.characteristic?.value, "MAIN")
                
                let account = card?.mainAccount
                XCTAssertEqual(account?.id, "4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE")
                XCTAssertEqual(account?.holderName, "Aleš Vrba")
                
                let accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2059930033")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                XCTAssertEqual(card?.cardDeliveryMode?.value, "HOME")
                
                let flags = card?.flags
                XCTAssertTrue(flags?.count == 3, "Cards [0] flags count must be 3.")
                XCTAssertEqual(flags?[0], "automaticReplacementOn")
                XCTAssertEqual(flags?[1], "secureOnlineShoppingEnabled")
                XCTAssertEqual(flags?[2], "contactlessEnabled")
                
                let features = card?.features
                XCTAssertTrue(features?.count == 7, "Cards [0] features count must be 7.")
                XCTAssertEqual(features?[0], "limitChange")
                XCTAssertEqual(features?[1], "reissuePin")
                XCTAssertEqual(features?[2], "contactless")
                XCTAssertEqual(features?[3], "onlineLocking")
                XCTAssertEqual(features?[4], "secureOnlineShopping")
                XCTAssertEqual(features?[5], "temporaryLimitChange")
                XCTAssertEqual(features?[6], "cardDelivery")
                
                XCTAssertEqual(card?.productI18N, "Visa Classic debetní - Partner")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testCardsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.get", xcTestCase: self)
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").get { result in
            switch ( result ) {
            case .success( let card ):
                XCTAssertEqual(card.id, "33A813886442D946122C78305EC4E482DE9F574D")
                XCTAssertEqual(card.owner, "VOJTÍŠKOVÁ ANNA")
                XCTAssertEqual(card.number, "451161XXXXXX1987")
                XCTAssertEqual(card.sequenceNumber, "2")
                XCTAssertEqual(card.productCode, "4511611")
                XCTAssertEqual(self.dateFormatter.date(from:  "2018-03-31" ), card.expiryDate)
                XCTAssertEqual(card.state.value, "TEMPORARY_BLOCKED")
                XCTAssertEqual(card.type.value, "BANK_CARD")
                XCTAssertEqual(card.provider.value, "ERSTE_BANK")
                XCTAssertEqual(self.dateFormatter.date(from:  "2015-04-01" ), card.validFromDate)
                XCTAssertEqual(card.characteristic?.value, "MAIN")
                
                let account = card.mainAccount
                XCTAssertEqual(account?.id, "076E1DBCCCD38729A99D93AC8D3E8273237C7E36")
                XCTAssertEqual(account?.holderName, "Anna Vojtíšková")
                
                let accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2328489013")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                XCTAssertEqual(card.cardDeliveryMode?.value, "HOME")
                
                let flags = card.flags
                XCTAssertTrue(flags?.count == 4, "Cards [0] flags count must be 4.")
                XCTAssertEqual(flags?[0], "automaticReplacementOn")
                XCTAssertEqual(flags?[1], "secureOnlineShoppingEnabled")
                XCTAssertEqual(flags?[2], "activationAllowed")
                XCTAssertEqual(flags?[3], "contactlessEnabled")
                
                let features = card.features
                XCTAssertTrue(features?.count == 3, "Cards [0] features count must be 3.")
                XCTAssertEqual(features?[0], "contactless")
                XCTAssertEqual(features?[1], "replacementCard")
                XCTAssertEqual(features?[2], "secureOnlineShopping")
                
                XCTAssertEqual(card.productI18N, "Visa Classic debetní - Partner")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.update", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        let cardRequest                    = ChangeCardSettingsRequest()
        cardRequest.alias                  = "moje karta"
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").update(cardRequest) { result in
            switch ( result ) {
            case .success( let card ):
                XCTAssertEqual(card.id, "33A813886442D946122C78305EC4E482DE9F574D")
                XCTAssertEqual(card.owner, "VRBA ALEŠ")
                XCTAssertEqual(card.number, "451161XXXXXX7982")
                XCTAssertEqual(card.sequenceNumber, "3")
                XCTAssertEqual(card.productCode, "4511611")
                XCTAssertEqual(self.dateFormatter.date(from:  "2017-11-30" ), card.expiryDate)
                XCTAssertEqual(card.state.value, "TEMPORARY_BLOCKED")
                XCTAssertEqual(card.type.value, "BANK_CARD")
                XCTAssertEqual(card.provider.value, "ERSTE_BANK")
                XCTAssertEqual(self.dateFormatter.date(from:  "2014-12-01" ), card.validFromDate)
                XCTAssertEqual(card.characteristic?.value, "MAIN")
                
                let account = card.mainAccount
                XCTAssertEqual(account?.id, "4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE")
                XCTAssertEqual(account?.holderName, "Aleš Vrba")
                
                let accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2059930033")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                XCTAssertEqual(card.cardDeliveryMode?.value, "HOME")
                
                let flags = card.flags
                XCTAssertTrue(flags?.count == 3, "Cards [0] flags count must be 3.")
                XCTAssertEqual(flags?[0], "automaticReplacementOn")
                XCTAssertEqual(flags?[1], "activationAllowed")
                XCTAssertEqual(flags?[2], "contactlessEnabled")
                
                let features = card.features
                XCTAssertTrue(features?.count == 3, "Cards [0] features count must be 3.")
                XCTAssertEqual(features?[0], "contactless")
                XCTAssertEqual(features?[1], "replacementCard")
                XCTAssertEqual(features?[2], "secureOnlineShopping")
                
                XCTAssertEqual(card.productI18N, "Visa Classic debetní - Partner")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }


    //--------------------------------------------------------------------------
    func testCardWithIdDeliveryGet()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.delivery.get", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").delivery.get { result in
            switch ( result ) {
            case .success( let deliveryListing ):
                XCTAssertEqual(deliveryListing.cardDeliveryMode.value, "BRANCH")
                XCTAssertEqual(deliveryListing.branchId, "1075")
                
                let address = deliveryListing.address
                XCTAssertEqual(address?.street, "Antala Staška")
                XCTAssertEqual(address?.buildingApartment, "1292")
                XCTAssertEqual(address?.streetNumber, "32")
                XCTAssertEqual(address?.city, "Praha")
                XCTAssertEqual(address?.zipCode, "14000")
                XCTAssertEqual(address?.country, "CZ")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
//    func testCardWithIdDeliveryUpdate()
//    {
//        self.judgeSession.setNextCase( caseId: "cards.withId.delivery.update", xcTestCase: self)
//        
//        let expectation                                = self.expectation(description: "Response expectation")
//        let changeDeliverySettingsRequest              = ChangeDeliverySettingsRequest()
//        changeDeliverySettingsRequest.cardDeliveryMode = "BRANCH"
//        
//        let confirmation                               = Confirmation()
//        confirmation.email                             = "john.doe@test.com"
//        confirmation.language                          = "cs"
//        
//        changeDeliverySettingsRequest.confirmations    = [confirmation]
//        
//        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").delivery().update(changeDeliverySettingsRequest) { result in
//            switch ( result ) {
//            case .success( let changeDeliverySettingsResponse ):
//                XCTAssertEqual(changeDeliverySettingsResponse.cardDeliveryMode, "BRANCH")
//                XCTAssertEqual(changeDeliverySettingsResponse.branchId, "1075")
//                
//                XCTAssertEqual(changeDeliverySettingsResponse.address.street, "Antala Staška")
//                XCTAssertEqual(changeDeliverySettingsResponse.address.buildingApartment, "1292")
//                XCTAssertEqual(changeDeliverySettingsResponse.address.streetNumber, "32")
//                XCTAssertEqual(changeDeliverySettingsResponse.address.city, "Praha")
//                XCTAssertEqual(changeDeliverySettingsResponse.address.zipCode, "14000")
//                XCTAssertEqual(changeDeliverySettingsResponse.address.country, "CZ")
//                
//                if let confirmations = changeDeliverySettingsResponse.confirmations {
//                    XCTAssertTrue(confirmations.count == 1, "Confirmations count must be 1.")
//                    XCTAssertEqual(confirmations [0].email, "john.doe@test.com")
//                    XCTAssertEqual(confirmations [0].language, "cs")
//                }
//                else {
//                    XCTFail( "Confirmations must not be nil!" )
//                }
//                
//                XCTAssertEqual(changeDeliverySettingsResponse.signInfo?.state, "OPEN")
//                XCTAssertEqual(changeDeliverySettingsResponse.signInfo?.signId, "151112531008554")
//                
//                expectation.fulfill()
//                
//            case .failure(_):
//                XCTFail()
//            }
//        }
//        
//        self.waitForExpectations(timeout: 40.0, handler:nil)
//    }
    
    //--------------------------------------------------------------------------
    func testCardWithIdTransactionsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.transactions.withId.update", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let addNoteAndMarkTransactionRequest           = AddNoteAndMarkTransactionRequest()
        addNoteAndMarkTransactionRequest.note          = "note"
        addNoteAndMarkTransactionRequest.flags         = ["hasStar"]
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").transactions.withId("23498").update(addNoteAndMarkTransactionRequest) { result in
            switch ( result ) {
            case .success( let addNoteAndMarkTransactionResponse ):
                XCTAssertEqual(addNoteAndMarkTransactionResponse.cardTransaction.id, "23498")
                XCTAssertEqual(addNoteAndMarkTransactionResponse.cardTransaction.note, "note")
                
                XCTAssertTrue(addNoteAndMarkTransactionResponse.cardTransaction.flags!.count == 2, "Flags count must be 2.")
                XCTAssertEqual(addNoteAndMarkTransactionResponse.cardTransaction.flags! [0], "hasNote")
                XCTAssertEqual(addNoteAndMarkTransactionResponse.cardTransaction.flags! [1], "hasStar")
                
                XCTAssertEqual(addNoteAndMarkTransactionResponse.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardWithIdTransactionsExport()
    {
        let caseId                   = "cards.withId.transactions.export"
        self.judgeSession.setNextCase( caseId: caseId, xcTestCase: self)
        
        let expectation              = self.expectation(description: "Response expectation")
        
        let parametres               = ExportTransactionsParameters()
        
        parametres.dateFrom          = self.dateTimeFormatter.date(from: "1999-09-27T00:00:00+02:00")
        parametres.dateTo            = self.dateTimeFormatter.date(from: "2000-09-27T00:00:00+02:00")
        parametres.fields            = [.bookingDate, .partner, .amount, .currency]
        parametres.showAccountName   = true
        parametres.showAccountNumber = true
        parametres.showTimespan      = true
        parametres.showBalance       = true
        
        var verifyResult             = false
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").transactions.export(parametres) { result in
            switch ( result ) {
            case .success( let pdfFileName ):
                XCTAssertTrue( self.isValidPdfDocumentAtFilePath(pdfFileName: pdfFileName))
                expectation.fulfill()
                
            case .failure:
                verifyResult = true
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        if verifyResult {
            self.judgeSession.verifyLastTestCase(caseId: caseId, xcTestCase: self) { error in
                if let coreError = error as? CoreSDKError, let info = coreError.serverErrorInfo {
                    XCTAssertTrue( false, "Error: \(info)" )
                }
                else {
                    XCTAssertTrue( false, "Error: \(error)" );
                }
            }
        }
    }
    
    //--------------------------------------------------------------------------
    func testCardWithActionsCreate()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.actions.update", xcTestCase: self)
        let expectation                                  = self.expectation(description: "Response expectation")
        
        let cardActionRequest                            = CardActionRequest()
        cardActionRequest.action                         = .activateCard
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").actions.update(cardActionRequest) { result in
            switch ( result ) {
            case .success( let cardActionResponse ):
                XCTAssertEqual(cardActionResponse.signInfo!.state, "OPEN")
                XCTAssertEqual(cardActionResponse.signInfo!.signId, "1883293134")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testCardWithIdLimitsList()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.limits.list", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        
        var limitsList : ListResponse<CardLimitsResponse>? = nil
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").limits.list { result in
            switch ( result ) {
            case .success( let list ):
                limitsList = list
                XCTAssertTrue(limitsList?.items.count == 3, "Cards limits list count must be 3.")
                
                XCTAssertEqual(limitsList?.items [0].limitType.value, "ATM")
                XCTAssertEqual(limitsList?.items [0].limitPeriod.value, "1D")
                XCTAssertEqual(limitsList?.items [0].limit!.value, 200000)
                XCTAssertEqual(limitsList?.items [0].limit!.precision, 2)
                XCTAssertEqual(limitsList?.items [0].limit!.currency, "CZK")
                XCTAssertEqual(limitsList?.items [0].bankLimit!.value, 7000000)
                XCTAssertEqual(limitsList?.items [0].bankLimit!.precision, 2)
                XCTAssertEqual(limitsList?.items [0].bankLimit!.currency, "CZK")
                
                XCTAssertEqual(limitsList?.items [1].limitType.value, "POS")
                XCTAssertEqual(limitsList?.items [1].limitPeriod.value, "1D")
                XCTAssertEqual(limitsList?.items [1].limit!.value, 200000)
                XCTAssertEqual(limitsList?.items [1].limit!.precision, 2)
                XCTAssertEqual(limitsList?.items [1].limit!.currency, "CZK")
                XCTAssertEqual(limitsList?.items [1].bankLimit!.value, 50000000)
                XCTAssertEqual(limitsList?.items [1].bankLimit!.precision, 2)
                XCTAssertEqual(limitsList?.items [1].bankLimit!.currency, "CZK")
                
                XCTAssertEqual(limitsList?.items [2].limitType.value, "INTERNET")
                XCTAssertEqual(limitsList?.items [2].limitPeriod.value, "1D")
                XCTAssertEqual(limitsList?.items [2].limit!.value, 200000)
                XCTAssertEqual(limitsList?.items [2].limit!.precision, 2)
                XCTAssertEqual(limitsList?.items [2].limit!.currency, "CZK")
                XCTAssertEqual(limitsList?.items [2].bankLimit!.value, 50000000)
                XCTAssertEqual(limitsList?.items [2].bankLimit!.precision, 2)
                XCTAssertEqual(limitsList?.items [2].bankLimit!.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardsWithIdLimitsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.limits.update", xcTestCase: self)
        
        let expectation                                  = self.expectation(description: "Response expectation")
        let changeCardsLimitsRequest                     = ChangeCardsLimitsRequest()
        let cardsLimits                                  = CardLimitsRequest()
        cardsLimits.limitType                            = .atm
        cardsLimits.limitPeriod                          = .fiveD
        cardsLimits.limit                                = Amount()
        cardsLimits.limit!.value                         = 1100000
        cardsLimits.limit?.precision                     = 2
        cardsLimits.limit?.currency                      = "CZK"
        changeCardsLimitsRequest.limits                  = [cardsLimits]
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").limits.update(changeCardsLimitsRequest) { result in
            switch ( result ) {
            case .success( let changeCardsLimitsResponse ):
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.signId, "1480132234")
                
                XCTAssertTrue(changeCardsLimitsResponse.limits?.count == 3, "Cards limits list count must be 3.")

                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].limitType.value, "ATM")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].limit?.value, 1100000)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].bankLimit?.value, 7000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [0].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].limitType.value, "POS")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].limit?.value, 5000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [1].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].limitType.value, "INTERNET")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].limit?.value, 500000)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits! [2].bankLimit?.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
                
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardsWithIdSecure3DGet()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.secure3D.get", xcTestCase: self)
        
        let expectation                                  = self.expectation(description: "Response expectation")
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").secure3D.get { result in
            switch ( result ) {
            case .success( let secureSettings ):
                XCTAssertEqual(secureSettings.status?.value, "OK")
                XCTAssertEqual(secureSettings.phoneNumber, "+420739473460")
                XCTAssertEqual(secureSettings.language, "cs")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
                
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardsWithIdTransfersUpdate()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.transfers.update", xcTestCase: self)
        
        let expectation                                   = self.expectation(description: "Response expectation")
        
        let payUpCreditCardRequest                        = PayUpCreditCardRequest()
        payUpCreditCardRequest.type                       = .debtRepayment
        payUpCreditCardRequest.sender                     = Sender()
        payUpCreditCardRequest.sender?.accountno          = AccountNumber()
        payUpCreditCardRequest.sender?.accountno.number   = "2326573123"
        payUpCreditCardRequest.sender?.accountno.bankCode = "0800"
        payUpCreditCardRequest.amount                     = Amount()
        payUpCreditCardRequest.amount?.value              = 500000
        payUpCreditCardRequest.amount?.precision          = 2
        payUpCreditCardRequest.amount?.currency           = "CZK"
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").transfer.update(payUpCreditCardRequest) { result in
            switch ( result ) {
            case .success( let payUpCreditCardResponse ):
                XCTAssertEqual(payUpCreditCardResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(payUpCreditCardResponse.signInfo?.signId, "151112531008554")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }

        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardsWithIdAccountsWithIdStatementsList()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.accounts.withId.statements.list", xcTestCase: self)
        let expectation                    = self.expectation(description: "Response expectation")
        let params                         = StatementsParameters(pagination: nil, sort: Sort( by:[(.statementDate, .ascending)]))
        
        var statementsList: PaginatedListResponse<StatementResponse>? = nil
        self.client
            .cards
            .withId("33A813886442D946122C78305EC4E482DE9F574D")
            .accounts
            .withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36")
            .statements
            .list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList = list
                XCTAssertTrue(statementsList?.items.count == 1, "Cards statements list count must be 1.")
                
                XCTAssertEqual(statementsList?.items [0].id, "06029392819b0198")
                XCTAssertEqual(statementsList?.items [0].number, 2)
                XCTAssertEqual(statementsList?.items [0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statementsList?.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList?.items [0].language.value, "cs")
                XCTAssertEqual(statementsList?.items [0].statementDate, self.dateTimeFormatter.date( from: "2016-02-28T23:00:00+0000" ))
                XCTAssertEqual(statementsList?.items [0].czFileTotalNumber, 1)
                XCTAssertEqual(statementsList?.items [0].czFileOrderNumber, 0)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)

    }
    
    //--------------------------------------------------------------------------
    func testCardsWithIdAccountsWithIdStatementsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.accounts.withId.statements.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = StatementsParameters(pagination: Pagination(pageNumber: 0, pageSize: 1), sort: nil)
        
        var statementsList: PaginatedListResponse<StatementResponse>? = nil
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").statements.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList     = list
                let paginationTest = self.checkPagination(pagination: statementsList!.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(statementsList?.items.count == 1, "Cards statements list count must be 1.")
                
                XCTAssertEqual(statementsList?.items [0].id, "06029392819b0198")
                XCTAssertEqual(statementsList?.items [0].number, 2)
                XCTAssertEqual(statementsList?.items [0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statementsList?.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList?.items [0].language.value, "cs")
                XCTAssertEqual(statementsList?.items [0].statementDate, self.dateTimeFormatter.date( from: "2016-02-28T23:00:00+0000" ))
                XCTAssertEqual(statementsList?.items [0].czFileTotalNumber, 1)
                XCTAssertEqual(statementsList?.items [0].czFileOrderNumber, 0)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }

        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testCardsWithIdAccountsWithIdStatementsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "cards.withId.accounts.withId.statements.list.page1", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = StatementsParameters(pagination: Pagination(pageNumber: 1, pageSize: 1), sort: nil)
        
        var statementsList: PaginatedListResponse<StatementResponse>? = nil
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").statements.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList     = list
                let paginationTest = self.checkPagination(pagination: statementsList!.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(statementsList?.items.count == 1, "Cards statements list count must be 1.")
                
                XCTAssertEqual(statementsList?.items [0].id, "96029392819b0198")
                XCTAssertEqual(statementsList?.items [0].number, 8)
                XCTAssertEqual(statementsList?.items [0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statementsList?.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList?.items [0].language.value, "cs")
                XCTAssertEqual(statementsList?.items [0].statementDate, self.dateTimeFormatter.date( from: "2016-01-29T00:00:00+01:00" ))
                XCTAssertEqual(statementsList?.items [0].czFileTotalNumber, 1)
                XCTAssertEqual(statementsList?.items [0].czFileOrderNumber, 0)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCardsWithIdAccountsWithIdStatementsDownload()
    {
        let caseId       = "cards.withId.accounts.withId.statements.download"
        self.judgeSession.setNextCase( caseId: caseId, xcTestCase: self)
        
        let expectation  = self.expectation(description: "Response expectation")
        let parametres   = DownloadStatementsParameters( statementId: "06029392819b0198" )
        
        var verifyResult = false
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").statements.signedDownload(parametres) { result in
            switch ( result ) {
            case .success( let pdfFileName ):
                XCTAssertTrue( self.isValidPdfDocumentAtFilePath(pdfFileName: pdfFileName))
                expectation.fulfill()
                
            case .failure:
                verifyResult = true
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        if verifyResult {
            self.judgeSession.verifyLastTestCase(caseId: caseId, xcTestCase: self) { error in
                if let coreError = error as? CoreSDKError, let info = coreError.serverErrorInfo {
                    XCTAssertTrue( false, "Error: \(info)" )
                }
                else {
                    XCTAssertTrue( false, "Error: \(error)" );
                }
            }
        }
    }

}
