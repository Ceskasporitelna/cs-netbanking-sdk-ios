//
//  CSNetbankingSigningOrdersCaseMobileTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 17/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingSigningOrdersCaseMobileTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func signingCaseMobileCardLimitsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "signing.caseMobile.card.limits.update", xcTestCase: self)
        //TODO: Not implemented, CASE_MOBILE signing not working yet.
        
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
        
        self.client.cards.withId("33A813886442D946122C78305EC4E482DE9F574D").limits.update(changeCardLimitsRequest) { changeCardsLimitsResult in
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
                XCTAssertEqual(changeCardsLimitsResponse.signInfo?.signId, "1445623889")
                
                guard let signing = changeCardsLimitsResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "1445623889")
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
                                        XCTAssertEqual(signResult.signId,     "1445623889")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(changeCardsLimitsResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.isDone,      true)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(changeCardsLimitsResponse.signing!.signId,     "1445623889")
                                        
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
    func signingCaseMobilePaymentsDomesticCreate()
    {
        self.judgeSession.setNextCase( caseId: "signing.caseMobile.payments.domestic.create", xcTestCase: self)
        //TODO: Not implemented, CASE_MOBILE signing not working yet.
        
        let expectation                                = self.expectation(description: "Response expectation")
        
        let domesticPaymentCreateRequest               = DomesticPaymentCreateRequest()
        domesticPaymentCreateRequest.senderName        = "Vrba"
        
        domesticPaymentCreateRequest.sender            = DomesticPaymentAccount()
        domesticPaymentCreateRequest.sender.number     = "2328489013"
        domesticPaymentCreateRequest.sender.bankCode   = "0800"
        
        domesticPaymentCreateRequest.receiverName      = "Vojtíšková"
        domesticPaymentCreateRequest.receiver          = DomesticPaymentAccount()
        domesticPaymentCreateRequest.receiver.number   = "2059930033"
        domesticPaymentCreateRequest.receiver.bankCode = "0800"
        
        domesticPaymentCreateRequest.amount            = Amount()
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
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date(from:  "2016-04-14T15:39:48+02:00" ))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date(from:  "2016-04-14T00:00:00+02:00" ))
                
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "18917bfb2990b3982662e09eb2ae7545eeb99104ca5505ca9281f16a275b1968")
                
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2)
                XCTAssertEqual(domesticPaymentResponse.flags?[0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags?[1], "deletable")
                
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date(from:  "2016-04-14T15:39:48+02:00" ))
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
                
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date(from:  "2016-04-14" ))
                
                guard let signing = domesticPaymentResponse.signing else {
                    XCTFail("Missing signing object.")
                    return
                }
                
                signing.getInfo() { signingInfoResult in
                    switch ( signingInfoResult ) {
                    case .success(let signingInfo):
                        XCTAssertEqual(signingInfo.signId,     "148f1fa5ede3f50428288c253b8fb28488562a4ea9ebeea7178496e4ac5d1e72")
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
                                        XCTAssertEqual(signResult.signId,     "148f1fa5ede3f50428288c253b8fb28488562a4ea9ebeea7178496e4ac5d1e72")
                                        
                                        //Verify that the signing on the entity is updated aswell
                                        XCTAssertFalse(domesticPaymentResponse.signing is FilledSigningObject)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isOpen,      false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isDone,      true)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.isCancelled, false)
                                        XCTAssertEqual(domesticPaymentResponse.signing!.signId,     "148f1fa5ede3f50428288c253b8fb28488562a4ea9ebeea7178496e4ac5d1e72")
                                        
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
