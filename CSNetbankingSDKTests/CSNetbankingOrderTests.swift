//
//  CSNetbankingOrderTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingOrderTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testPaymentsList()
    {
        self.judgeSession.setNextCase( caseId: "payments.list", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        let params                         = PaymentsParameters(pagination: nil, sort: Sort( by:[(.transferDate, .ascending)]))
        
        var paymentsList: PaginatedListResponse<PaymentResponse>? = nil
        self.client.orders.payments.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                paymentsList = list
                XCTAssertTrue(paymentsList?.items.count == 2, "Payments list count must be 2.")
                
                XCTAssertEqual(paymentsList?.items [0].id, "1023464260")
                XCTAssertNil(paymentsList?.items [0].additionalInfo?.text4x35, "AdditionalInfo should be nil." )
                
                XCTAssertEqual(paymentsList?.items [0].amount.value, 200000)
                XCTAssertEqual(paymentsList?.items [0].amount.precision, 2)
                XCTAssertEqual(paymentsList?.items [0].amount.currency, "CZK")
                
                XCTAssertEqual(paymentsList?.items [0].applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(paymentsList?.items [0].channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(paymentsList?.items [0].czOrderingDate, self.dateTimeFormatter.date(from:  "2016-03-20T00:00:00+01:00" ))
                XCTAssertEqual(paymentsList?.items [0].executionDate, self.dateTimeFormatter.date(from:  "2016-03-20T00:00:00+01:00" ))
                
                XCTAssertTrue(paymentsList?.items [0].flags?.count == 4, "Flags count must be 4.")
                XCTAssertEqual(paymentsList?.items [0].flags! [0], "editable")
                XCTAssertEqual(paymentsList?.items [0].flags! [1], "deletable")
                XCTAssertEqual(paymentsList?.items [0].flags! [2], "signable")
                XCTAssertEqual(paymentsList?.items [0].flags! [3], "own_transfer")
                
                XCTAssertEqual(paymentsList?.items [0].modificationDate, self.dateTimeFormatter.date(from:  "2016-03-20T18:16:04+01:00" ))
                XCTAssertEqual(paymentsList?.items [0].orderCategory.value, PaymentCategory.ownTransfer.value)
                XCTAssertEqual(paymentsList?.items [0].orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(paymentsList?.items [0].receiver.number, "428602109")
                XCTAssertEqual(paymentsList?.items [0].receiver.bankCode, "0800")
                XCTAssertEqual(paymentsList?.items [0].receiver.countryCode, "CZ")
                XCTAssertEqual(paymentsList?.items [0].receiver.czIBAN, "CZ6408000000000428602109")
                XCTAssertEqual(paymentsList?.items [0].receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(paymentsList?.items [0].senderName, "Aleš Vrba")
                
                XCTAssertEqual(paymentsList?.items [0].signInfo!.state, "OPEN")
                XCTAssertEqual(paymentsList?.items [0].signInfo!.signId, "1b20fd5dd9e41f0b0c08a3ebcafedcd1e2fe64ae937e0dc8a1e7f946b3d6b0f")
                
                XCTAssertEqual(paymentsList?.items [0].state.value, PaymentState.open.value)
                XCTAssertEqual(paymentsList?.items [0].stateDetail.value, PaymentStateDetail.opn.value)
                XCTAssertEqual(paymentsList?.items [0].stateOk, true)
                XCTAssertEqual(paymentsList?.items [0].transferDate, self.dateFormatter.date(from:  "2016-03-21" ))
                XCTAssertEqual(paymentsList?.items [0].receiverName, "Vrba Aleš")
                
                
                XCTAssertEqual(paymentsList?.items [1].id, "1719856390")
                XCTAssertTrue(paymentsList?.items [1].additionalInfo?.text4x35?.count == 1, "additionalInfo count must be 1.")
                XCTAssertEqual(paymentsList?.items [1].additionalInfo?.text4x35? [0], "Vlastní převod" )
                
                XCTAssertEqual(paymentsList?.items [1].amount.value, 12000)
                XCTAssertEqual(paymentsList?.items [1].amount.precision, 2)
                XCTAssertEqual(paymentsList?.items [1].amount.currency, "CZK")
                
                XCTAssertEqual(paymentsList?.items [1].applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(paymentsList?.items [1].channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(paymentsList?.items [1].czOrderingDate, self.dateTimeFormatter.date(from:  "2016-03-20T00:00:00+01:00" ))
                XCTAssertNil(paymentsList?.items [1].executionDate)
                
                XCTAssertTrue(paymentsList?.items [1].flags?.count == 4, "Flags count must be 4.")
                XCTAssertEqual(paymentsList?.items [1].flags! [0], "editable")
                XCTAssertEqual(paymentsList?.items [1].flags! [1], "deletable")
                XCTAssertEqual(paymentsList?.items [1].flags! [2], "signable")
                XCTAssertEqual(paymentsList?.items [1].flags! [3], "own_transfer")
                
                XCTAssertEqual(paymentsList?.items [1].modificationDate, self.dateTimeFormatter.date(from:  "2016-03-20T18:13:40+01:00" ))
                XCTAssertEqual(paymentsList?.items [1].orderCategory.value, PaymentCategory.ownTransfer.value)
                XCTAssertEqual(paymentsList?.items [1].orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(paymentsList?.items [1].receiver.number, "2059930033")
                XCTAssertEqual(paymentsList?.items [1].receiver.bankCode, "0800")
                XCTAssertEqual(paymentsList?.items [1].receiver.countryCode, "CZ")
                XCTAssertEqual(paymentsList?.items [1].receiver.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(paymentsList?.items [1].receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(paymentsList?.items [1].senderName, "Spořicí účet k Osobnímu kontu")
                
                XCTAssertEqual(paymentsList?.items [1].signInfo!.state, "OPEN")
                XCTAssertEqual(paymentsList?.items [1].signInfo!.signId, "ff7d933db8049afd048712d445429218d485b63e5320acac31bd4289f2c8bbba")
                
                XCTAssertEqual(paymentsList?.items [1].state.value, PaymentState.open.value)
                XCTAssertEqual(paymentsList?.items [1].stateDetail.value, PaymentStateDetail.opn.value)
                XCTAssertEqual(paymentsList?.items [1].stateOk, true)
                XCTAssertEqual(paymentsList?.items [1].transferDate, self.dateFormatter.date(from:  "2016-03-21" ))
                XCTAssertEqual(paymentsList?.items [1].receiverName, "Aleš Vrba")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPaymentsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "payments.list.page0", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        let params                         = PaymentsParameters(pagination: Pagination(pageNumber: 0, pageSize: 1), sort: nil)
        
        var paymentsList: PaginatedListResponse<PaymentResponse>? = nil
        self.client.orders.payments.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                let paginationTest = self.checkPagination(pagination: list.pagination, pageNumber: 0, pageCount: 7, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                paymentsList = list
                XCTAssertTrue(paymentsList?.items.count == 1, "Payments list count must be 1.")
                
                XCTAssertEqual(paymentsList?.items [0].id, "1154226597")
                XCTAssertNil(paymentsList?.items [0].additionalInfo?.text4x35, "AdditionalInfo should be nil." )
                
                XCTAssertEqual(paymentsList?.items [0].amount.value, 110)
                XCTAssertEqual(paymentsList?.items [0].amount.precision, 2)
                XCTAssertEqual(paymentsList?.items [0].amount.currency, "CZK")
                
                XCTAssertEqual(paymentsList?.items [0].applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(paymentsList?.items [0].channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(paymentsList?.items [0].czOrderingDate, self.dateTimeFormatter.date(from:  "2016-03-21T00:00:00+01:00" ))
                XCTAssertEqual(paymentsList?.items [0].executionDate, self.dateTimeFormatter.date(from:  "2016-03-21T00:00:00+01:00" ))
                
                XCTAssertTrue(paymentsList?.items [0].flags?.count == 4, "Flags count must be 4.")
                XCTAssertEqual(paymentsList?.items [0].flags! [0], "editable")
                XCTAssertEqual(paymentsList?.items [0].flags! [1], "deletable")
                XCTAssertEqual(paymentsList?.items [0].flags! [2], "signable")
                XCTAssertEqual(paymentsList?.items [0].flags! [3], "domestic")
                
                XCTAssertEqual(paymentsList?.items [0].modificationDate, self.dateTimeFormatter.date(from:  "2016-03-21T10:33:41+01:00" ))
                XCTAssertEqual(paymentsList?.items [0].orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(paymentsList?.items [0].orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(paymentsList?.items [0].receiver.number, "2328489013")
                XCTAssertEqual(paymentsList?.items [0].receiver.bankCode, "0800")
                XCTAssertEqual(paymentsList?.items [0].receiver.countryCode, "CZ")
                XCTAssertEqual(paymentsList?.items [0].receiver.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(paymentsList?.items [0].receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(paymentsList?.items [0].senderName, "Vrba")
                
                XCTAssertEqual(paymentsList?.items [0].signInfo!.state, "OPEN")
                XCTAssertEqual(paymentsList?.items [0].signInfo!.signId, "853eec470df3a40cb58f3504b956285cf59c3ca9c835d277c6706e7cd2b15e35")
                
                XCTAssertEqual(paymentsList?.items [0].state.value, PaymentState.open.value)
                XCTAssertEqual(paymentsList?.items [0].stateDetail.value, PaymentStateDetail.opn.value)
                XCTAssertEqual(paymentsList?.items [0].stateOk, true)
                XCTAssertEqual(paymentsList?.items [0].transferDate, self.dateFormatter.date(from:  "2016-03-23" ))
                XCTAssertEqual(paymentsList?.items [0].receiverName, "Vojtíšková Alena")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
    }
    
    //--------------------------------------------------------------------------
    func testPaymentsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "payments.list.page1", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        let params                         = PaymentsParameters(pagination: Pagination(pageNumber: 1, pageSize: 1), sort: nil)
        
        var paymentsList: PaginatedListResponse<PaymentResponse>? = nil
        self.client.orders.payments.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                let paginationTest = self.checkPagination(pagination: list.pagination, pageNumber: 1, pageCount: 7, pageSize: 1, nextPageNumber: 2)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                paymentsList = list
                
                XCTAssertTrue(paymentsList?.items.count == 1, "Payments list count must be 1.")
                
                XCTAssertEqual(paymentsList?.items [0].id, "T4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE_1XZ1XZO5o0VZB")
                XCTAssertNil(paymentsList?.items [0].additionalInfo?.text4x35, "AdditionalInfo should be nil." )
                
                XCTAssertEqual(paymentsList?.items [0].amount.value, 100000)
                XCTAssertEqual(paymentsList?.items [0].amount.precision, 2)
                XCTAssertEqual(paymentsList?.items [0].amount.currency, "CZK")
                
                XCTAssertEqual(paymentsList?.items [0].applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(paymentsList?.items [0].channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(paymentsList?.items [0].czOrderingDate, self.dateTimeFormatter.date(from:  "2016-03-22T00:00:00+01:00" ))
                XCTAssertEqual(paymentsList?.items [0].executionDate, self.dateTimeFormatter.date(from:  "2016-03-22T00:00:00+01:00" ))
                
                XCTAssertTrue(paymentsList?.items [0].flags?.count == 2, "Flags count must be 2.")
                XCTAssertEqual(paymentsList?.items [0].flags! [0], "redoable")
                XCTAssertEqual(paymentsList?.items [0].flags! [1], "own_transfer")
                
                XCTAssertNil(paymentsList?.items [0].modificationDate )
                XCTAssertEqual(paymentsList?.items [0].orderCategory.value, PaymentCategory.ownTransfer.value)
                XCTAssertEqual(paymentsList?.items [0].orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(paymentsList?.items [0].receiver.number, "428602109")
                XCTAssertEqual(paymentsList?.items [0].receiver.bankCode, "0800")
                XCTAssertEqual(paymentsList?.items [0].receiver.countryCode, "CZ")
                XCTAssertEqual(paymentsList?.items [0].receiver.czIBAN, "CZ6408000000000428602109")
                XCTAssertEqual(paymentsList?.items [0].receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(paymentsList?.items [0].referenceId, "R1EZG2CY")
                
                XCTAssertEqual(paymentsList?.items [0].signInfo!.state, "NONE")
                
                XCTAssertEqual(paymentsList?.items [0].state.value, PaymentState.closed.value)
                XCTAssertEqual(paymentsList?.items [0].stateDetail.value, PaymentStateDetail.fin.value)
                XCTAssertEqual(paymentsList?.items [0].stateOk, true)
                XCTAssertEqual(paymentsList?.items [0].transferDate, self.dateFormatter.date(from:  "2016-03-22" ))
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testPaymentsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "payments.withId.get", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        
        self.client.orders.payments.withId("1023464260").get { result in
            switch ( result ) {
            case .success( let payment ):
                XCTAssertEqual(payment.id, "1023464260")
                XCTAssertNil(payment.additionalInfo?.text4x35, "AdditionalInfo should be nil." )
                
                XCTAssertEqual(payment.amount.value, 200000)
                XCTAssertEqual(payment.amount.precision, 2)
                XCTAssertEqual(payment.amount.currency, "CZK")
                
                XCTAssertEqual(payment.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(payment.channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(payment.czOrderingDate, self.dateTimeFormatter.date(from:  "2016-03-20T00:00:00+01:00" ))
                XCTAssertEqual(payment.executionDate, self.dateTimeFormatter.date(from:  "2016-03-20T00:00:00+01:00" ))
                
                XCTAssertTrue(payment.flags?.count == 4, "Flags count must be 4.")
                XCTAssertEqual(payment.flags! [0], "editable")
                XCTAssertEqual(payment.flags! [1], "deletable")
                XCTAssertEqual(payment.flags! [2], "signable")
                XCTAssertEqual(payment.flags! [3], "own_transfer")
                
                XCTAssertEqual(payment.orderCategory.value, PaymentCategory.ownTransfer.value)
                XCTAssertEqual(payment.orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(payment.receiver.number, "428602109")
                XCTAssertEqual(payment.receiver.bankCode, "0800")
                XCTAssertEqual(payment.receiver.countryCode, "CZ")
                XCTAssertEqual(payment.receiver.czIBAN, "CZ6408000000000428602109")
                XCTAssertEqual(payment.receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(payment.signInfo!.state, "OPEN")
                XCTAssertEqual(payment.signInfo!.signId, "1b20fd5dd9e41f0b0c08a3ebcafedcd1e2fe64ae937e0dc8a1e7f946b3d6b0f")
                
                XCTAssertEqual(payment.state.value, PaymentState.open.value)
                XCTAssertEqual(payment.stateDetail.value, PaymentStateDetail.opn.value)
                XCTAssertEqual(payment.stateOk, true)
                XCTAssertEqual(payment.transferDate, self.dateFormatter.date(from:  "2016-03-21" ))
                XCTAssertEqual(payment.receiverName, "Vrba Aleš")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func PaymentsWithIdDelete()
    {
        self.judgeSession.setNextCase( caseId: "payments.withId.delete", xcTestCase: self)
        //TODO: Don't implement. Will be delivered.
        
    }

    //--------------------------------------------------------------------------
    func testPaymentsBookingDateUpdate()
    {
        self.judgeSession.setNextCase( caseId: "payments.bookingDate.update", xcTestCase: self)
        
        let expectation                                 = self.expectation(description: "Response expectation")
        
        let paymentBookingDateRequest                   = PaymentBookingDateRequest()
        
        paymentBookingDateRequest.accountId             = "4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE"
        paymentBookingDateRequest.receiver              = AccountNumber()
        paymentBookingDateRequest.receiver?.number      = "123-123"
        paymentBookingDateRequest.receiver?.bankCode    = "0100"
        paymentBookingDateRequest.receiver?.countryCode = "CZ"
        paymentBookingDateRequest.priority              = .standard
        
        self.client.orders.payments.bookingDate.update(paymentBookingDateRequest) { result in
            switch ( result ) {
            case .success( let paymentBookingDateResponse ):
                XCTAssertEqual(paymentBookingDateResponse.bookingDate, self.dateTimeFormatter.date(from:  "2016-03-21T00:00:00+01:00" ))
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPaymentsDomesticCreate()
    {
        self.judgeSession.setNextCase( caseId: "payments.domestic.create", xcTestCase: self)
        
        let expectation                                 = self.expectation(description: "Response expectation")
        let domesticPaymentCreateRequest                = DomesticPaymentCreateRequest()
        
        domesticPaymentCreateRequest.senderName         = "Vrba"
        domesticPaymentCreateRequest.sender             = DomesticPaymentAccount()
        domesticPaymentCreateRequest.sender.number      = "2059930033"
        domesticPaymentCreateRequest.sender.bankCode    = "0800"
        domesticPaymentCreateRequest.receiverName       = "Vojtíšková"
        domesticPaymentCreateRequest.receiver           = DomesticPaymentAccount()
        domesticPaymentCreateRequest.receiver.number    = "2328489013"
        domesticPaymentCreateRequest.receiver.bankCode  = "0800"
        domesticPaymentCreateRequest.amount             = Amount()
        domesticPaymentCreateRequest.amount.value       = 110
        domesticPaymentCreateRequest.amount.precision   = 2
        domesticPaymentCreateRequest.amount.currency    = "CZK"
        
        
        self.client.orders.payments.domestic.create(domesticPaymentCreateRequest) {  result in
            switch ( result ) {
            case .success( let domesticPaymentResponse ):
                XCTAssertEqual(domesticPaymentResponse.id, "1154226597")
                XCTAssertEqual(domesticPaymentResponse.amount.value, 110 )
                XCTAssertEqual(domesticPaymentResponse.amount.precision, 2)
                XCTAssertEqual(domesticPaymentResponse.amount.currency, "CZK")
                XCTAssertEqual(domesticPaymentResponse.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(domesticPaymentResponse.channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date(from:  "2016-03-21T10:30:54+01:00" ))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date(from:  "2016-03-21T00:00:00+01:00" ))
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2)
                XCTAssertEqual(domesticPaymentResponse.flags! [0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags! [1], "deletable")
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date(from:  "2016-03-21T10:30:54+01:00" ))
                XCTAssertEqual(domesticPaymentResponse.orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(domesticPaymentResponse.orderType.value, PaymentOrderType.paymentOut.value)
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.receiver.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(domesticPaymentResponse.receiver.czBIC, "GIBACZPX")
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková")
                XCTAssertEqual(domesticPaymentResponse.sender.number, "2059930033")
                XCTAssertEqual(domesticPaymentResponse.sender.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.sender.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.sender.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(domesticPaymentResponse.sender.czBIC, "GIBACZPX")
                XCTAssertEqual(domesticPaymentResponse.senderName, "Vrba")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "8d0e89d424dd2176f94e7ba15bb97ff3362bd74ecc1f58b1119ab75f4bf96f61")
                XCTAssertEqual(domesticPaymentResponse.state.value, PaymentState.open.value)
                XCTAssertEqual(domesticPaymentResponse.stateDetail.value, PaymentStateDetail.opn.value)
                XCTAssertEqual(domesticPaymentResponse.stateOk, true)
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date(from:  "2016-03-21" ))
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }

        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPaymentsDomesticUpdate()
    {
        self.judgeSession.setNextCase( caseId: "payments.domestic.update", xcTestCase: self)
        
        let expectation                                     = self.expectation(description: "Response expectation")
        let fullDomesticPaymentUpdateRequest                = FullDomesticPaymentUpdateRequest()
        
        fullDomesticPaymentUpdateRequest.id                 = "1154226597"
        fullDomesticPaymentUpdateRequest.senderName         = "Vrba"
        fullDomesticPaymentUpdateRequest.sender             = DomesticPaymentAccount()
        fullDomesticPaymentUpdateRequest.sender.number      = "2059930033"
        fullDomesticPaymentUpdateRequest.sender.bankCode    = "0800"
        fullDomesticPaymentUpdateRequest.receiverName       = "Vojtíšková Alena"
        fullDomesticPaymentUpdateRequest.receiver           = DomesticPaymentAccount()
        fullDomesticPaymentUpdateRequest.receiver.number    = "2328489013"
        fullDomesticPaymentUpdateRequest.receiver.bankCode  = "0800"
        fullDomesticPaymentUpdateRequest.amount             = Amount()
        fullDomesticPaymentUpdateRequest.amount.value       = 110
        fullDomesticPaymentUpdateRequest.amount.precision   = 2
        fullDomesticPaymentUpdateRequest.amount.currency    = "CZK"
        
        self.client.orders.payments.domestic.withId("1154226597").update(fullDomesticPaymentUpdateRequest) { result in
            switch ( result ) {
            case .success( let domesticPaymentResponse ):
                XCTAssertEqual(domesticPaymentResponse.id, "1154226597")
                
                XCTAssertEqual(domesticPaymentResponse.senderName, "Vrba")
                XCTAssertEqual(domesticPaymentResponse.sender.number, "2059930033")
                XCTAssertEqual(domesticPaymentResponse.sender.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.sender.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.sender.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(domesticPaymentResponse.sender.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková Alena")
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                
                XCTAssertEqual(domesticPaymentResponse.amount.value, 110)
                XCTAssertEqual(domesticPaymentResponse.amount.precision, 2)
                XCTAssertEqual(domesticPaymentResponse.amount.currency, "CZK")
                
                XCTAssertEqual(domesticPaymentResponse.applicationId?.value, ApplicationId.george.value)
                XCTAssertEqual(domesticPaymentResponse.channelId?.value, ChannelId.netBanking.value)
                XCTAssertEqual(domesticPaymentResponse.czOrderingDate, self.dateTimeFormatter.date(from:  "2016-03-21T10:33:41+01:00" ))
                XCTAssertEqual(domesticPaymentResponse.executionDate, self.dateTimeFormatter.date(from:  "2016-03-21T00:00:00+01:00" ))
                
                XCTAssertEqual(domesticPaymentResponse.flags?.count, 2 )
                XCTAssertEqual(domesticPaymentResponse.flags? [0], "editable")
                XCTAssertEqual(domesticPaymentResponse.flags? [1], "deletable")
                
                XCTAssertEqual(domesticPaymentResponse.modificationDate, self.dateTimeFormatter.date(from:  "2016-03-21T10:33:41+01:00" ))
                XCTAssertEqual(domesticPaymentResponse.orderCategory.value, PaymentCategory.domestic.value)
                XCTAssertEqual(domesticPaymentResponse.orderType.value, PaymentOrderType.paymentOut.value)
                
                XCTAssertEqual(domesticPaymentResponse.receiver.number, "2328489013")
                XCTAssertEqual(domesticPaymentResponse.receiver.bankCode, "0800")
                XCTAssertEqual(domesticPaymentResponse.receiver.countryCode, "CZ")
                XCTAssertEqual(domesticPaymentResponse.receiver.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(domesticPaymentResponse.receiver.czBIC, "GIBACZPX")
                
                XCTAssertEqual(domesticPaymentResponse.receiverName, "Vojtíšková Alena")
                
                XCTAssertEqual(domesticPaymentResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(domesticPaymentResponse.signInfo?.signId, "8e6b2185f13bf2fcd3dc6e864d2fd1142813f3198d3633501aa7244a481d5458")
                
                XCTAssertEqual(domesticPaymentResponse.state.value, PaymentState.open.value)
                XCTAssertEqual(domesticPaymentResponse.stateDetail.value, PaymentStateDetail.opn.value)
                XCTAssertEqual(domesticPaymentResponse.stateOk, true)
                
                XCTAssertEqual(domesticPaymentResponse.transferDate, self.dateFormatter.date(from:  "2016-03-21" ))
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    
    //--------------------------------------------------------------------------
    func testPaymentsLimitsList()
    {
        self.judgeSession.setNextCase( caseId: "payments.limits.list", xcTestCase: self)
        
        let expectation                                 = self.expectation(description: "Response expectation")
        
        self.client.orders.payments.limits.list() { result in
            switch ( result ) {
            case .success( let limitsList ):
                XCTAssertEqual(limitsList.items.count, 2)
                
                XCTAssertEqual(limitsList.items [0].authorizationType.value, AuthorizationType.tac.value)
                XCTAssertEqual(limitsList.items [0].channelId.value, ChannelId.netBanking.value)
                XCTAssertEqual(limitsList.items [0].applicationId.value, ApplicationId.george.value)
                XCTAssertEqual(limitsList.items [0].remainingAmount.value, 99999999999999)
                XCTAssertEqual(limitsList.items [0].remainingAmount.precision, 2)
                XCTAssertEqual(limitsList.items [0].remainingAmount.currency, "CZK")
                
                XCTAssertEqual(limitsList.items [1].authorizationType.value, AuthorizationType.tac.value)
                XCTAssertEqual(limitsList.items [1].channelId.value, ChannelId.netBanking.value)
                XCTAssertEqual(limitsList.items [1].applicationId.value, ApplicationId.unknown.value)
                XCTAssertEqual(limitsList.items [1].remainingAmount.value, 99999999999999)
                XCTAssertEqual(limitsList.items [1].remainingAmount.precision, 2)
                XCTAssertEqual(limitsList.items [1].remainingAmount.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPaymentsMobileCreate()
    {
        self.judgeSession.setNextCase( caseId: "payments.mobile.create", xcTestCase: self)
        
        let expectation                                  = self.expectation(description: "Response expectation")
        let mobilePaymentsRequest                        = MobilePaymentsRequest()
        
        mobilePaymentsRequest.paymentType                = .vodafonePayment
        mobilePaymentsRequest.phoneNumber                = "777952341"
        mobilePaymentsRequest.sender                     = MobilePaymentSender()
        mobilePaymentsRequest.sender?.iban               = "CZ1208000000002059930033"
        mobilePaymentsRequest.sender?.bic                = "GIBACZPX"
        mobilePaymentsRequest.sender?.number             = "2059930033"
        mobilePaymentsRequest.sender?.bankCode           = "0800"
        mobilePaymentsRequest.sender?.countryCode        = "CZ"
        mobilePaymentsRequest.amount                     = Amount()
        mobilePaymentsRequest.amount?.value              = 3000
        mobilePaymentsRequest.amount?.precision          = 0
        mobilePaymentsRequest.amount?.currency           = "CZK"
        mobilePaymentsRequest.confirmationPhoneNumber   = "777952341"
        
        self.client.orders.payments.mobile.create(mobilePaymentsRequest) { result in
            switch ( result ) {
            case .success( let mobilePaymentsResponse ):
                XCTAssertEqual(mobilePaymentsResponse.paymentType?.value, MobilePaymentType.vodafonePayment.value)
                XCTAssertEqual(mobilePaymentsResponse.phoneNumber, "777952341")
                XCTAssertEqual(mobilePaymentsResponse.sender?.number, "2059930033")
                XCTAssertEqual(mobilePaymentsResponse.sender?.bankCode, "0800")
                XCTAssertEqual(mobilePaymentsResponse.sender?.countryCode, "CZ")
                XCTAssertEqual(mobilePaymentsResponse.sender?.iban, "CZ1208000000002059930033")
                XCTAssertEqual(mobilePaymentsResponse.sender?.bic, "GIBACZPX")
                XCTAssertEqual(mobilePaymentsResponse.amount?.value, 300000)
                XCTAssertEqual(mobilePaymentsResponse.amount?.precision, 2)
                XCTAssertEqual(mobilePaymentsResponse.amount?.currency, "CZK")
                XCTAssertEqual(mobilePaymentsResponse.confirmationPhoneNumber, "777952341")
                XCTAssertEqual(mobilePaymentsResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(mobilePaymentsResponse.signInfo?.signId, "1671744209")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
}
