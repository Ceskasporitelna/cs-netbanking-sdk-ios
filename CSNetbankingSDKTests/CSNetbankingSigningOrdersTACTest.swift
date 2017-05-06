//
//  CSNetbankingOrdersTACTest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 14/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingSigningOrdersTACTest: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testSigningTacAccountsTransferUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.accounts.transfer.update", xcTestCase: self)
        
        let expectation                   = self.expectation(description: "Response expectation")
        
        let transferRequest               = AccountTransferRequest()
        transferRequest.type              = .revolvingLoanDisbursement
        transferRequest.amount            = Amount()
        transferRequest.amount?.value     = 1000000
        transferRequest.amount?.precision = 2
        transferRequest.amount?.currency  = "CZK"
        transferRequest.transferDate      = self.dateFormatter.date( from: "2015-02-28" )
        transferRequest.recipientNote     = "moje prve cerpanie z penize na klik"
        
        self.client.accounts.withId("3FB37388FC58076DEAD3DE282E075592A299B596").transfer.update(transferRequest){ result in
            switch ( result ) {
            case .success(let transferResponse):
                XCTAssertEqual(transferResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(transferResponse.signInfo?.signId, "1603478324")
                
                guard let signing = transferResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "1603478324")
                        XCTAssertEqual(signingInfo.isOpen,     true)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "1603478324")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(transferResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(transferResponse.signing!.isOpen,     false)
                                        XCTAssertEqual(transferResponse.signing!.isDone,     true)
                                        XCTAssertEqual(transferResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(transferResponse.signing!.signId,     "1603478324")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacCardsActionsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.cards.actions.update", xcTestCase: self)
        
        let expectation                  = self.expectation(description: "Response expectation")
        let cardActionRequest            = CardActionRequest()
        cardActionRequest.action         = .activateCard
        
        self.client.cards.withId("3FB37388FC58076DEAD3DE282E075592A299B596").actions.update(cardActionRequest) { cardActionResult in
            switch (cardActionResult) {
            case .success(let cardActionResponse):
                XCTAssertEqual(cardActionResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(cardActionResponse.signInfo?.signId, "1607878324")
                
                guard let signing = cardActionResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                XCTAssertTrue(signing.isOpen)
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "1607878324")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "1607878324")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(cardActionResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(cardActionResponse.signing!.isOpen,     false)
                                        XCTAssertEqual(cardActionResponse.signing!.isDone,     true)
                                        XCTAssertEqual(cardActionResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(cardActionResponse.signing!.signId,     "1607878324")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 30.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacCardsLimitsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.cards.limits.update", xcTestCase: self)
        
        let expectation                  = self.expectation(description: "Response expectation")
        
        let cardsLimits                  = CardLimitsRequest()
        cardsLimits.limitType            = .atm
        cardsLimits.limitPeriod          = .fiveD
        cardsLimits.limit                = Amount()
        cardsLimits.limit?.value         = 1100000
        cardsLimits.limit?.precision     = 2
        cardsLimits.limit?.currency      = "CZK"
        
        let changeCardLimitsRequest      = ChangeCardsLimitsRequest()
        changeCardLimitsRequest.limits   = [cardsLimits]
        
        self.client.cards.withId("3FB37388FC58076DEAD3DE282E075592A299B596").limits.update(changeCardLimitsRequest) { changeCardsLimitsResult in
            switch (changeCardsLimitsResult) {
            case .success(let changeCardsLimitsResponse):
                XCTAssertEqual(changeCardsLimitsResponse.limits?.count, 3)
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limitType.value, "ATM")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.value, 1100000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.value, 7000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limitType.value, "POS")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.value, 5000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limitType.value, "INTERNET")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.value, 500000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.signId, "160429968745872")
                
                guard let signing = changeCardsLimitsResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "160429968745872")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "160429968745872")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(changeCardsLimitsResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.isDone,      true)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.signId,     "160429968745872")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 30.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacCardsTransferUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.cards.transfer.update", xcTestCase: self)
        
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
        
        
        self.client.cards.withId("3FB37388FC58076DEAD3DE282E075592A299B596").transfer.update(payUpCreditCardRequest) { payUpCreditCardResult in
            switch (payUpCreditCardResult) {
            case .success(let payUpCreditCardResponse):
                XCTAssertEqual(payUpCreditCardResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(payUpCreditCardResponse.signInfo?.signId, "160429968745812")
                
                guard let signing = payUpCreditCardResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "160429968745812")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "160429968745812")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(payUpCreditCardResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(payUpCreditCardResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(payUpCreditCardResponse.signing!.isDone,      true)
                                        XCTAssertEqual(payUpCreditCardResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(payUpCreditCardResponse.signing!.signId,     "160429968745812")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 30.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacOrdersPaymentsMobileCreate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.orders.payments.mobile.create", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        let mobilePaymentsRequest                      = MobilePaymentsRequest()
        
        mobilePaymentsRequest.paymentType              = .vodafonePayment
        mobilePaymentsRequest.phoneNumber              = "777952341"
        
        mobilePaymentsRequest.sender                   = MobilePaymentSender()
        mobilePaymentsRequest.sender?.iban             = "CZ1208000000002059930033"
        mobilePaymentsRequest.sender?.bic              = "GIBACZPX"
        mobilePaymentsRequest.sender?.number           = "2059930033"
        mobilePaymentsRequest.sender?.bankCode         = "0800"
        mobilePaymentsRequest.sender?.countryCode      = "CZ"
        
        mobilePaymentsRequest.amount                   = Amount()
        mobilePaymentsRequest.amount?.value            = 3000
        mobilePaymentsRequest.amount?.precision        = 0
        mobilePaymentsRequest.amount?.currency         = "CZK"
        
        mobilePaymentsRequest.confirmationPhoneNumber  = "777952341"
        
        self.client.orders.payments.mobile.create(mobilePaymentsRequest) { mobilePaymentsResult in
            switch (mobilePaymentsResult) {
            case .success(let mobilePaymentsResponse):
                XCTAssertEqual(mobilePaymentsResponse.paymentType?.value, MobilePaymentType.vodafonePayment.value)
                XCTAssertEqual(mobilePaymentsResponse.phoneNumber, "777952341")
                
                XCTAssertEqual(mobilePaymentsResponse.sender?.iban, "CZ1208000000002059930033")
                XCTAssertEqual(mobilePaymentsResponse.sender?.bic, "GIBACZPX")
                XCTAssertEqual(mobilePaymentsResponse.sender?.number, "2059930033")
                XCTAssertEqual(mobilePaymentsResponse.sender?.bankCode, "0800")
                XCTAssertEqual(mobilePaymentsResponse.sender?.countryCode, "CZ")
                
                XCTAssertEqual(mobilePaymentsResponse.amount?.value, 300000)
                XCTAssertEqual(mobilePaymentsResponse.amount?.precision, 2)
                XCTAssertEqual(mobilePaymentsResponse.amount?.currency, "CZK")
                
                XCTAssertEqual(mobilePaymentsResponse.confirmationPhoneNumber, "777952341")
                
                XCTAssertEqual(mobilePaymentsResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(mobilePaymentsResponse.signInfo?.signId, "1671744209")
                
                guard let signing = mobilePaymentsResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "1671744209")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "1671744209")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(mobilePaymentsResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(mobilePaymentsResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(mobilePaymentsResponse.signing!.isDone,      true)
                                        XCTAssertEqual(mobilePaymentsResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(mobilePaymentsResponse.signing!.signId,     "1671744209")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 30.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func signingTacCardsLimitsUpdateAuthorizationTypeInvalid()
    {
        //TODO: Test not realized ATM, because we don't support CASE_MOBILE signing yet.
        self.judgeSession.setNextCase( caseId: "signing.tac.cards.limits.update.authorizationType.invalid", xcTestCase: self)
        
        let expectation                               = self.expectation(description: "Response expectation")
        
        let cardLimits                                = CardLimitsRequest()
        cardLimits.limitType                          = .atm
        cardLimits.limitPeriod                        = .fiveD
        cardLimits.limit                              = Amount()
        cardLimits.limit?.value                       = 1100000
        cardLimits.limit?.precision                   = 2
        cardLimits.limit?.currency                    = "CZK"
        
        let changeCardsLimitsRequest                  = ChangeCardsLimitsRequest()
        changeCardsLimitsRequest.limits               = [cardLimits]
        
        self.client.cards.withId("3FB37388FC58076DEAD3DE282E075592A299B596").limits.update(changeCardsLimitsRequest) { changeCardLimitsResult in
            switch (changeCardLimitsResult) {
            case .success(let changeCardLimitsResponse):
                XCTAssertEqual(changeCardLimitsResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(changeCardLimitsResponse.signInfo?.signId, "1445623886")
                
                guard let signing = changeCardLimitsResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "1445623886")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "1445623886")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(changeCardLimitsResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(changeCardLimitsResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(changeCardLimitsResponse.signing!.isDone,      true)
                                        XCTAssertEqual(changeCardLimitsResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(changeCardLimitsResponse.signing!.signId,     "1445623886")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacCardsLimitsUpdateOTPinvalid()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.cards.limits.update.OTP.invalid", xcTestCase: self)
        
        let expectation                               = self.expectation(description: "Response expectation")
        
        let cardLimits                                = CardLimitsRequest()
        cardLimits.limitType                          = .atm
        cardLimits.limitPeriod                        = .fiveD
        
        cardLimits.limit                              = Amount()
        cardLimits.limit?.value                       = 1100000
        cardLimits.limit?.precision                   = 2
        cardLimits.limit?.currency                    = "CZK"
        
        let changeCardsLimitsRequest                  = ChangeCardsLimitsRequest()
        changeCardsLimitsRequest.limits               = [cardLimits]
        
        self.client.cards.withId("3FB37388FC58076DEAD3DE282E075592A299B596").limits.update(changeCardsLimitsRequest) { changeCardLimitsResult in
            switch (changeCardLimitsResult) {
            case .success(let changeCardsLimitsResponse):
                XCTAssertEqual(changeCardsLimitsResponse.limits?.count, 3)
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limitType.value, "ATM")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.value, 1100000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.value, 7000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limitType.value, "POS")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.value, 5000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limitType.value, "INTERNET")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.value, 500000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.signId, "1445623881")
                
                guard let signing = changeCardsLimitsResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "1445623881")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "12345678") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(_):
                                        XCTFail("Error: should fail here!")
                                        
                                    case .failure(let error):
                                        XCTAssert(( error is SigningError ) && (error as! SigningError).kind == .otpInvalid)
                                        expectation.fulfill()
                                    }
                                }
                                
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testSigningTacCardsLimitsUpdateIdNotFound()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.cards.limits.update.id.notFound", xcTestCase: self)
        
        let expectation                               = self.expectation(description: "Response expectation")
        
        let cardLimits                                = CardLimitsRequest()
        cardLimits.limitType                          = .atm
        cardLimits.limitPeriod                        = .fiveD
        
        cardLimits.limit                              = Amount()
        cardLimits.limit?.value                       = 1100000
        cardLimits.limit?.precision                   = 2
        cardLimits.limit?.currency                    = "CZK"
        
        let changeCardsLimitsRequest                  = ChangeCardsLimitsRequest()
        changeCardsLimitsRequest.limits               = [cardLimits]
        
        self.client.cards.withId("3FB37388FC58076DEAD3DE282E075592A299B596").limits.update(changeCardsLimitsRequest) { changeCardLimitsResult in
            switch (changeCardLimitsResult) {
            case .success(let changeCardsLimitsResponse):
                XCTAssertEqual(changeCardsLimitsResponse.limits?.count, 3)
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limitType.value, "ATM")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.value, 1100000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.value, 7000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [0].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limitType.value, "POS")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.value, 5000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [1].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limitType.value, "INTERNET")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limitPeriod.value, "1D")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.value, 500000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].limit?.currency, "CZK")
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.value, 50000000)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.precision, 2)
                XCTAssertEqual(changeCardsLimitsResponse.limits? [2].bankLimit?.currency, "CZK")
                
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.signId, "160419934641602")
                
                guard let signing = changeCardsLimitsResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(_):
                        XCTFail("Error: should fail here!")
                        
                    case .failure(let error):
                        XCTAssert(( error is SigningError ) && (error as! SigningError).kind == .idNotFound)
                        expectation.fulfill()
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 30.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testSigningTacPaymentsDomesticCreate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.payments.domestic.create", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let domesticPaymentCreateRequest               = DomesticPaymentCreateRequest()
        domesticPaymentCreateRequest.senderName        = "Vrba"
        
        domesticPaymentCreateRequest.sender.number     = "2328489013"
        domesticPaymentCreateRequest.sender.bankCode   = "0800"
        
        domesticPaymentCreateRequest.receiverName      = "Vojtíšková"
        domesticPaymentCreateRequest.receiver.number   = "2059930033"
        domesticPaymentCreateRequest.receiver.bankCode = "0800"
        
        domesticPaymentCreateRequest.amount.value      = 110
        domesticPaymentCreateRequest.amount.precision  = 2
        domesticPaymentCreateRequest.amount.currency   = "CZK"
        
        self.client.orders.payments.domestic.create(domesticPaymentCreateRequest) { domesticPaymentResult in
            switch (domesticPaymentResult) {
            case .success(let domesticPaymentResponse):
                XCTAssertEqual(domesticPaymentResponse.id, "1247657808")
                
                XCTAssertEqual(domesticPaymentResponse.amount.value, 110)
                XCTAssertEqual(domesticPaymentResponse.amount.precision, 2)
                XCTAssertEqual(domesticPaymentResponse.amount.currency, "CZK")
                
                XCTAssertEqual(domesticPaymentResponse.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(domesticPaymentResponse.channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date( from: "2016-04-14T15:39:48+02:00" ))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date( from: "2016-04-14T00:00:00+02:00" ))
                
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "18917bfb2990b3982662e09eb2ae7545eeb99104ca5505ca9281f16a275b1968")
                
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2)
                XCTAssertEqual(domesticPaymentResponse.flags?[0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags?[1], "deletable")
                
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date( from: "2016-04-14T15:39:48+02:00" ))
                XCTAssertEqual(domesticPaymentResponse.orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(domesticPaymentResponse.orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.receiver.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková")
                XCTAssertEqual(domesticPaymentResponse.referenceId, "R155VFUG")
                
                XCTAssertEqual(domesticPaymentResponse.sender.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.sender.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.sender.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.senderName, "Vrba")
                XCTAssertEqual(domesticPaymentResponse.state.value, PaymentState.open.value)
                XCTAssertEqual(domesticPaymentResponse.stateDetail.value, PaymentStateDetail.opn.value)
                XCTAssertEqual(domesticPaymentResponse.stateOk, true)
                
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date( from: "2016-04-14" ))
                
                guard let signing = domesticPaymentResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "18917bfb2990b3982662e09eb2ae7545eeb99104ca5505ca9281f16a275b1968")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "18917bfb2990b3982662e09eb2ae7545eeb99104ca5505ca9281f16a275b1968")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(domesticPaymentResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isDone,      true)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.signId,     "18917bfb2990b3982662e09eb2ae7545eeb99104ca5505ca9281f16a275b1968")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testSigningTacPaymentsDomesticWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.payments.domestic.withId.update", xcTestCase: self)
        
        let expectation                                         = self.expectation(description: "Response expectation")
        
        let domesticPaymentUpdateRequest                        = FullDomesticPaymentUpdateRequest()
        
        domesticPaymentUpdateRequest.id                         = "160429968927553"
        domesticPaymentUpdateRequest.senderName                 = "Vrba"
        
        domesticPaymentUpdateRequest.sender.number              = "2059930033"
        domesticPaymentUpdateRequest.sender.bankCode            = "0800"
        
        domesticPaymentUpdateRequest.receiverName               = "Vojtíšková Alena"
        
        domesticPaymentUpdateRequest.receiver.number            = "2328489013"
        domesticPaymentUpdateRequest.receiver.bankCode          = "0800"
        
        domesticPaymentUpdateRequest.amount.value               = 110
        domesticPaymentUpdateRequest.amount.precision           = 2
        domesticPaymentUpdateRequest.amount.currency            = "CZK"
        
        self.client.orders.payments.domestic.withId("160429968927553").update(domesticPaymentUpdateRequest) { domesticPaymentResult in
            switch (domesticPaymentResult) {
            case .success(let domesticPaymentResponse):
                XCTAssertEqual(domesticPaymentResponse.id, "160429968927553")
                
                XCTAssertEqual(domesticPaymentResponse.amount.value, 110)
                XCTAssertEqual(domesticPaymentResponse.amount.precision, 2)
                XCTAssertEqual(domesticPaymentResponse.amount.currency, "CZK")
                
                XCTAssertEqual(domesticPaymentResponse.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(domesticPaymentResponse.channelId?.value, ChannelId.netBanking.value)
                
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date(from: "2016-04-14T00:00:00+02:00"))
                
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2 )
                XCTAssertEqual(domesticPaymentResponse.flags? [0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags? [1], "deletable")
                
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(domesticPaymentResponse.orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.receiver.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková")
                XCTAssertEqual(domesticPaymentResponse.referenceId, "R155VFUG")
                
                XCTAssertEqual(domesticPaymentResponse.sender.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.sender.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.sender.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.senderName, "Vrba")
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date(from: "2016-04-14"))
                
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "ba739d14b5371c959346c4607d37ad99ae05c607576e5d803f052224575e9e6c")
                
                guard let signing = domesticPaymentResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "ba739d14b5371c959346c4607d37ad99ae05c607576e5d803f052224575e9e6c")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "ba739d14b5371c959346c4607d37ad99ae05c607576e5d803f052224575e9e6c")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(domesticPaymentResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isDone,      true)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.signId,     "ba739d14b5371c959346c4607d37ad99ae05c607576e5d803f052224575e9e6c")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func signingTacPaymentsDomesticCreateAuthorizationTypeInvalid()
    {
        //TODO: Test not realized ATM, because we don't support CASE_MOBILE signing yet.
        self.judgeSession.setNextCase( caseId: "signing.tac.payments.domestic.create.authorizationType.invalid", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let domesticPaymentCreateRequest               = DomesticPaymentCreateRequest()
        domesticPaymentCreateRequest.senderName        = "Vrba"
        
        domesticPaymentCreateRequest.sender.number     = "2328489013"
        domesticPaymentCreateRequest.sender.bankCode   = "0800"
        
        domesticPaymentCreateRequest.receiverName      = "Vojtíšková"
        domesticPaymentCreateRequest.receiver.number   = "2059930033"
        domesticPaymentCreateRequest.receiver.bankCode = "0800"
        
        domesticPaymentCreateRequest.amount.value      = 110
        domesticPaymentCreateRequest.amount.precision  = 2
        domesticPaymentCreateRequest.amount.currency   = "CZK"
        
        self.client.orders.payments.domestic.create(domesticPaymentCreateRequest) { domesticPaymentResult in
            switch (domesticPaymentResult) {
            case .success(let domesticPaymentResponse):
                XCTAssertEqual(domesticPaymentResponse.id, "160418930050071")
                
                XCTAssertEqual(domesticPaymentResponse.amount.value, 110)
                XCTAssertEqual(domesticPaymentResponse.amount.precision, 2)
                XCTAssertEqual(domesticPaymentResponse.amount.currency, "CZK")
                
                XCTAssertEqual(domesticPaymentResponse.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(domesticPaymentResponse.channelId?.value, ChannelId.netBanking.value)
                
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date(from: "2016-04-14T00:00:00+02:00"))
                
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2 )
                XCTAssertEqual(domesticPaymentResponse.flags? [0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags? [1], "deletable")
                
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(domesticPaymentResponse.orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.receiver.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková")
                XCTAssertEqual(domesticPaymentResponse.referenceId, "R155VFUG")
                
                XCTAssertEqual(domesticPaymentResponse.sender.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.sender.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.sender.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.senderName, "Vrba")
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date(from: "2016-04-14"))
                
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "50da529ae64891cf37add6f9e5aa2a83353efcd77ac756973cff30234a1e3e6a")
                
                guard let signing = domesticPaymentResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "50da529ae64891cf37add6f9e5aa2a83353efcd77ac756973cff30234a1e3e6a")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "50da529ae64891cf37add6f9e5aa2a83353efcd77ac756973cff30234a1e3e6a")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(domesticPaymentResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isDone,      true)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.signId,     "50da529ae64891cf37add6f9e5aa2a83353efcd77ac756973cff30234a1e3e6a")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testSigningTacPaymentsDomesticCreateOTPinvalid()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.payments.domestic.create.OTP.invalid", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let domesticPaymentCreateRequest               = DomesticPaymentCreateRequest()
        domesticPaymentCreateRequest.senderName        = "Vrba"
        
        domesticPaymentCreateRequest.sender.number     = "2328489013"
        domesticPaymentCreateRequest.sender.bankCode   = "0800"
        
        domesticPaymentCreateRequest.receiverName      = "Vojtíšková"
        domesticPaymentCreateRequest.receiver.number   = "2059930033"
        domesticPaymentCreateRequest.receiver.bankCode = "0800"
        
        domesticPaymentCreateRequest.amount.value      = 110
        domesticPaymentCreateRequest.amount.precision  = 2
        domesticPaymentCreateRequest.amount.currency   = "CZK"
        
        self.client.orders.payments.domestic.create(domesticPaymentCreateRequest) { domesticPaymentResult in
            switch (domesticPaymentResult) {
            case .success(let domesticPaymentResponse):
                XCTAssertEqual(domesticPaymentResponse.id, "160418930050871")
                
                XCTAssertEqual(domesticPaymentResponse.amount.value, 110)
                XCTAssertEqual(domesticPaymentResponse.amount.precision, 2)
                XCTAssertEqual(domesticPaymentResponse.amount.currency, "CZK")
                
                XCTAssertEqual(domesticPaymentResponse.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(domesticPaymentResponse.channelId?.value, ChannelId.netBanking.value)
                
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date(from: "2016-04-14T00:00:00+02:00"))
                
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2 )
                XCTAssertEqual(domesticPaymentResponse.flags? [0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags? [1], "deletable")
                
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(domesticPaymentResponse.orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.receiver.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková")
                XCTAssertEqual(domesticPaymentResponse.referenceId, "R155VFUG")
                
                XCTAssertEqual(domesticPaymentResponse.sender.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.sender.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.sender.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.senderName, "Vrba")
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date(from: "2016-04-14"))
                
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "50da529ae64891cf37add6f9e5aa2a83353efcd77ac756973cff30234a1e3e6b")
                
                guard let signing = domesticPaymentResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "50da529ae64891cf37add6f9e5aa2a83353efcd77ac756973cff30234a1e3e6b")
                        XCTAssertTrue(signingInfo.isOpen)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "123456") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(_):
                                        XCTFail("Error: should fail here!")
                                        
                                    case .failure(let error):
                                        XCTAssert(( error is SigningError ) && (error as! SigningError).kind == .otpInvalid)
                                        expectation.fulfill()
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testSigningTacPaymentsDomesticCreateIdNotFound()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.payments.domestic.create.id.notFound", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let domesticPaymentCreateRequest               = DomesticPaymentCreateRequest()
        domesticPaymentCreateRequest.senderName        = "Vrba"
        
        domesticPaymentCreateRequest.sender.number     = "2328489013"
        domesticPaymentCreateRequest.sender.bankCode   = "0800"
        
        domesticPaymentCreateRequest.receiverName      = "Vojtíšková"
        domesticPaymentCreateRequest.receiver.number   = "2059930033"
        domesticPaymentCreateRequest.receiver.bankCode = "0800"
        
        domesticPaymentCreateRequest.amount.value      = 110
        domesticPaymentCreateRequest.amount.precision  = 2
        domesticPaymentCreateRequest.amount.currency   = "CZK"
        
        self.client.orders.payments.domestic.create(domesticPaymentCreateRequest) { domesticPaymentResult in
            switch (domesticPaymentResult) {
            case .success(let domesticPaymentResponse):
                XCTAssertEqual(domesticPaymentResponse.id, "160418930050871")
                
                XCTAssertEqual(domesticPaymentResponse.amount.value, 110)
                XCTAssertEqual(domesticPaymentResponse.amount.precision, 2)
                XCTAssertEqual(domesticPaymentResponse.amount.currency, "CZK")
                
                XCTAssertEqual(domesticPaymentResponse.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(domesticPaymentResponse.channelId?.value, ChannelId.netBanking.value)
                
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date(from: "2016-04-14T00:00:00+02:00"))
                
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2 )
                XCTAssertEqual(domesticPaymentResponse.flags? [0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags? [1], "deletable")
                
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date(from: "2016-04-14T15:39:48+02:00"))
                XCTAssertEqual(domesticPaymentResponse.orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(domesticPaymentResponse.orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.receiver.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(domesticPaymentResponse.receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková")
                XCTAssertEqual(domesticPaymentResponse.referenceId, "R155VFUG")
                
                XCTAssertEqual(domesticPaymentResponse.sender.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.sender.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.sender.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(domesticPaymentResponse.sender.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.senderName, "Vrba")
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date(from: "2016-04-14"))
                
                
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "50da529ae64891cf37add6f9e5aa2a83353efcd77ac756973cff30234a1e3e6b")
                
                guard let signing = domesticPaymentResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(_):
                        XCTFail("Error: should fail here!")
                        
                    case .failure(let error):
                        XCTAssert(( error is SigningError ) && (error as! SigningError).kind == .idNotFound)
                        expectation.fulfill()
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacContractsInsurancesWithIdFundsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.contracts.insurances.withId.funds.update", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let updateFundRequest                          = UpdateFundRequest()
        updateFundRequest.funds                        = [FundInfo]()
        var fundInfo                                   = FundInfo()
        fundInfo.code                                  = "31"
        fundInfo.allocation                            = 35
        updateFundRequest.funds?.append(fundInfo)
        
        fundInfo                                       = FundInfo()
        fundInfo.code                                  = "32"
        fundInfo.allocation                            = 65
        updateFundRequest.funds?.append(fundInfo)
        
        updateFundRequest.investmentProgram            = "INVESTMENT_MANAGEMENT"
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").funds.update(updateFundRequest) { result in
            switch (result) {
            case .success(let updateFundResponse):
                XCTAssertEqual(updateFundResponse.funds.count, 2)
                
                XCTAssertEqual(updateFundResponse.funds[0].code, "31")
                XCTAssertEqual(updateFundResponse.funds[0].allocation, 35)
                
                XCTAssertEqual(updateFundResponse.funds[1].code, "32")
                XCTAssertEqual(updateFundResponse.funds[1].allocation, 65)
                
                XCTAssertEqual(updateFundResponse.investmentProgram, "INVESTMENT_MANAGEMENT")
                
                XCTAssertEqual(updateFundResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(updateFundResponse.signInfo?.signId, "151112531008724")
                
                guard let signing = updateFundResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "151112531008724")
                        XCTAssertEqual(signingInfo.isOpen,     true)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "151112531008724")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(updateFundResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(updateFundResponse.signing!.isOpen,     false)
                                        XCTAssertEqual(updateFundResponse.signing!.isDone,     true)
                                        XCTAssertEqual(updateFundResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(updateFundResponse.signing!.signId,     "151112531008724")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacAccountsWithIdStandingOrdersWithIdDelete()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.accounts.withId.standingOrders.withId.delete", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let updateFundRequest                          = UpdateFundRequest()
        updateFundRequest.funds                        = [FundInfo]()
        var fundInfo                                   = FundInfo()
        fundInfo.code                                  = "31"
        fundInfo.allocation                            = 35
        updateFundRequest.funds?.append(fundInfo)
        
        fundInfo                                       = FundInfo()
        fundInfo.code                                  = "32"
        fundInfo.allocation                            = 65
        updateFundRequest.funds?.append(fundInfo)
        
        updateFundRequest.investmentProgram            = "INVESTMENT_MANAGEMENT"
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").standingOrders.withId("1").delete() { result in
            switch (result) {
            case .success(let standingOrderResponse):
                XCTAssertEqual(standingOrderResponse.number, "1")
                XCTAssertEqual(standingOrderResponse.type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrderResponse.status, "OK")
                XCTAssertEqual(standingOrderResponse.alias, "nájemné")
                
                XCTAssertEqual(standingOrderResponse.receiver.number, "174748262")
                XCTAssertEqual(standingOrderResponse.receiver.bankCode, "0300")
                XCTAssertEqual(standingOrderResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(standingOrderResponse.receiver.czIBAN, "CZ6703000000000174748262")
                
                XCTAssertEqual(standingOrderResponse.amount.value, 235000)
                XCTAssertEqual(standingOrderResponse.amount.precision, 2)
                XCTAssertEqual(standingOrderResponse.amount.currency, "CZK")
                
                XCTAssertEqual(standingOrderResponse.startDate, self.dateTimeFormatter.date(from: "2013-01-09T00:00:00+01:00"))
                XCTAssertEqual(standingOrderResponse.nextExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                XCTAssertEqual(standingOrderResponse.realExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                
                XCTAssertEqual(standingOrderResponse.executionDueMode.value, "DUE_DAY_OF_MONTH")
                XCTAssertEqual(standingOrderResponse.executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrderResponse.executionInterval.value, "MONTHLY")
                XCTAssertEqual(standingOrderResponse.intervalDueDay, 17)
                
                XCTAssertEqual(standingOrderResponse.symbols?.variableSymbol, "8840709604")
                XCTAssertEqual(standingOrderResponse.symbols?.specificSymbol, "311013")
                
                XCTAssertEqual(standingOrderResponse.flags?.count, 1)
                XCTAssertEqual(standingOrderResponse.flags?[0], "deletable")
                
                XCTAssertEqual(standingOrderResponse.scheduledExecutionDates?.count, 1)
                XCTAssertEqual(standingOrderResponse.scheduledExecutionDates?[0], self.dateFormatter.date(from: "2016-06-17"))
                
                XCTAssertEqual(standingOrderResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(standingOrderResponse.signInfo?.signId, "1105594162")
                
                guard let signing = standingOrderResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "1105594162")
                        XCTAssertEqual(signingInfo.isOpen,     true)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "1105594162")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(standingOrderResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(standingOrderResponse.signing!.isOpen,     false)
                                        XCTAssertEqual(standingOrderResponse.signing!.isDone,     true)
                                        XCTAssertEqual(standingOrderResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(standingOrderResponse.signing!.signId,     "1105594162")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testSigningTacAccountsWithIdDirectDebitsCreate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.accounts.withId.directDebits.create", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let directDebit                                = DirectDebitRequest()
        directDebit.type                               = .directDebit
        directDebit.receiver                           = AccountNumber()
        directDebit.receiver?.number                   = "428602109"
        directDebit.receiver?.bankCode                 = "0800"
        
        directDebit.alias                              = "moje inkaso"
        directDebit.periodicity                        = 1
        directDebit.periodCycle                        = .monthly
        
        directDebit.limit                              = Amount()
        directDebit.limit?.value                       = 100000
        directDebit.limit?.precision                   = 2
        directDebit.limit?.currency                    = "CZK"
        
        directDebit.limitSum                           = Amount()
        directDebit.limitSum?.value                    = 300000
        directDebit.limitSum?.precision                = 2
        directDebit.limitSum?.currency                 = "CZK"
        
        directDebit.numberLimit                        = 5
        
        directDebit.startDate                          = self.dateFormatter.date(from: "2017-07-14")
        directDebit.endDate                            = self.dateFormatter.date(from: "2018-07-14")
        
        directDebit.symbols                            = Symbols()
        directDebit.symbols?.variableSymbol            = "4567"
        directDebit.symbols?.specificSymbol            = "800"
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").directDebits.create(directDebit) { result in
            switch (result) {
            case .success(let signableDirectDebit):
                XCTAssertEqual(signableDirectDebit.receiver.number, "428602109")
                XCTAssertEqual(signableDirectDebit.receiver.bankCode, "0800")
                
                XCTAssertEqual(signableDirectDebit.type.value, DirectDebitType.directDebit.value)
                XCTAssertEqual(signableDirectDebit.alias, "moje inkaso")
                
                XCTAssertEqual(signableDirectDebit.periodicity, 1)
                XCTAssertEqual(signableDirectDebit.periodCycle.value, "MONTHLY")
                
                XCTAssertEqual(signableDirectDebit.limit?.value, 100000)
                XCTAssertEqual(signableDirectDebit.limit?.precision, 2)
                XCTAssertEqual(signableDirectDebit.limit?.currency, "CZK")
                
                XCTAssertEqual(signableDirectDebit.limitSum?.value, 300000)
                XCTAssertEqual(signableDirectDebit.limitSum?.precision, 2)
                XCTAssertEqual(signableDirectDebit.limitSum?.currency, "CZK")

                XCTAssertEqual(signableDirectDebit.startDate, self.dateFormatter.date(from: "2017-07-14"))
                XCTAssertEqual(signableDirectDebit.endDate, self.dateFormatter.date(from: "2018-07-14"))
                
                XCTAssertEqual(signableDirectDebit.symbols?.variableSymbol, "4567")
                XCTAssertEqual(signableDirectDebit.symbols?.specificSymbol, "800")
                
                XCTAssertEqual(signableDirectDebit.signInfo?.state, "OPEN")
                XCTAssertEqual(signableDirectDebit.signInfo?.signId, "160530104689642")
                
                guard let signing = signableDirectDebit.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "160530104689642")
                        XCTAssertEqual(signingInfo.isOpen,     true)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "160530104689642")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(signableDirectDebit.signing is FilledSigningObject)
                                        XCTAssertEqual(signableDirectDebit.signing!.isOpen,     false)
                                        XCTAssertEqual(signableDirectDebit.signing!.isDone,     true)
                                        XCTAssertEqual(signableDirectDebit.signing!.isCancelled, false)
                                        XCTAssertEqual(signableDirectDebit.signing!.signId,     "160530104689642")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacAccountsWithIdDirectDebitsWithIdDelete()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.accounts.withId.directDebits.withId.delete", xcTestCase: self)
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").directDebits.withId("4").delete() { result in
            switch (result) {
            case .success(let signableDirectDebit):
                XCTAssertEqual(signableDirectDebit.number, "4")
                
                XCTAssertEqual(signableDirectDebit.receiver.number, "101082201")
                XCTAssertEqual(signableDirectDebit.receiver.bankCode, "0800")
                XCTAssertEqual(signableDirectDebit.receiver.countryCode, "CZ")
                
                XCTAssertEqual(signableDirectDebit.type.value, "SIPO")
                XCTAssertEqual(signableDirectDebit.periodicity, 1)
                XCTAssertEqual(signableDirectDebit.periodCycle.value, "MONTHLY")
                
                XCTAssertEqual(signableDirectDebit.limitSum?.value, 99999999900)
                XCTAssertEqual(signableDirectDebit.limitSum?.precision, 2)
                XCTAssertEqual(signableDirectDebit.limitSum?.currency, "CZK")
                
                XCTAssertEqual(signableDirectDebit.startDate, self.dateFormatter.date(from: "2013-01-08"))
                
                XCTAssertEqual(signableDirectDebit.symbols?.variableSymbol, "8009710218")
                XCTAssertEqual(signableDirectDebit.symbols?.specificSymbol, "0")
                
                XCTAssertEqual(signableDirectDebit.signInfo?.state, "OPEN")
                XCTAssertEqual(signableDirectDebit.signInfo?.signId, "160530104690104")
                
                XCTAssertEqual(signableDirectDebit.versionId, 1)
                XCTAssertEqual(signableDirectDebit.versionValidityDate, self.dateFormatter.date(from: "2013-01-08"))
                
                guard let signing = signableDirectDebit.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "160530104690104")
                        XCTAssertEqual(signingInfo.isOpen,     true)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "160530104690104")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(signableDirectDebit.signing is FilledSigningObject)
                                        XCTAssertEqual(signableDirectDebit.signing!.isOpen,     false)
                                        XCTAssertEqual(signableDirectDebit.signing!.isDone,     true)
                                        XCTAssertEqual(signableDirectDebit.signing!.isCancelled, false)
                                        XCTAssertEqual(signableDirectDebit.signing!.signId,     "160530104690104")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSigningTacContractsInsurancesWithIdTransferUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.tac.contracts.insurances.withId.transfer.update", xcTestCase: self)
        
        let expectation                                 = self.expectation(description: "Response expectation")
        
        let updateContractTrasferRequest                = UpdateContractTrasferRequest()
        updateContractTrasferRequest.type               = .payPremium
        
        updateContractTrasferRequest.amount             = Amount()
        updateContractTrasferRequest.amount?.value      = 1500
        updateContractTrasferRequest.amount?.precision  = 2
        updateContractTrasferRequest.amount?.currency   = "CZK"
        
        updateContractTrasferRequest.sender             = AccountNumber()
        updateContractTrasferRequest.sender?.number     = "2723000003"
        updateContractTrasferRequest.sender?.bankCode   = "0800"
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").transfer.update(updateContractTrasferRequest) { result in
            switch (result) {
            case .success(let updateContractTrasferResponse):
                
                
                XCTAssertEqual(updateContractTrasferResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(updateContractTrasferResponse.signInfo?.signId, "160902146456332")
                
                guard let signing = updateContractTrasferResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "160902146456332")
                        XCTAssertEqual(signingInfo.isOpen,     true)
                        
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.TAC), true)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.MobileCase), false)
                        XCTAssertEqual(signingInfo.canBeSignedWith(AuthorizationType.NoAuthorization), false)
                        
                        signingInfo.startSigningWithTac() { startSigningResult in
                            switch (startSigningResult) {
                            case .success(let signingProcess):
                                signingProcess.finishSigning(withOneTimePassword: "00000000") { signingProcessResult in
                                    switch ( signingProcessResult ) {
                                    case .success(let signResult):
                                        XCTAssertEqual(signResult.isOpen,     false)
                                        XCTAssertEqual(signResult.isDone,     true)
                                        XCTAssertEqual(signResult.isCancelled, false)
                                        XCTAssertEqual(signResult.signId,     "160902146456332")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(updateContractTrasferResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(updateContractTrasferResponse.signing!.isOpen,     false)
                                        XCTAssertEqual(updateContractTrasferResponse.signing!.isDone,     true)
                                        XCTAssertEqual(updateContractTrasferResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(updateContractTrasferResponse.signing!.signId,     "160902146456332")
                                        
                                        expectation.fulfill()
                                        
                                    case .failure(let error):
                                        XCTFail("Error: \(error.localizedDescription)")
                                    }
                                }
                            case .failure(let error):
                                XCTFail("Error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Error: \(error.localizedDescription)")
                    }
                }
                
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 20.0, handler:nil)
    }


}
