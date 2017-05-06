//
//  CSNetbankingSecuritiesTests.swift
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
class CSNetbankingSecuritiesTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testSecuritiesListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "securities.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.securities.list(params) { result in
            switch ( result ) {
            case .success( let securitiesList ):
                let paginationTest = self.checkPagination(pagination: securitiesList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let securities = securitiesList.items
                XCTAssertEqual(securities?.count, 1)
                
                XCTAssertEqual(securities?[0].id, "420A817C20E4814C7C516A53ABA8E78F0CDBE324")
                
                XCTAssertEqual(securities?[0].balance.value, 1345437)
                XCTAssertEqual(securities?[0].balance.precision, 2)
                XCTAssertEqual(securities?[0].balance.currency, "CZK")
                
                XCTAssertEqual(securities?[0].description, "Aleš Vrba")
                XCTAssertEqual(securities?[0].accountno, "1034176627")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")

            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSecuritiesListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "securities.list.page1", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        self.client.securities.list(params) { result in
            switch ( result ) {
            case .success( let securitiesList ):
                let paginationTest = self.checkPagination(pagination: securitiesList.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let securities = securitiesList.items
                XCTAssertEqual(securities?.count, 1)
                
                XCTAssertEqual(securities?[0].id, "420A217C20E4814C7C516A53ABA8E78F8CDBE324")
                
                XCTAssertEqual(securities?[0].balance.value, 1345412)
                XCTAssertEqual(securities?[0].balance.precision, 2)
                XCTAssertEqual(securities?[0].balance.currency, "CZK")
                
                XCTAssertEqual(securities?[0].description, "Aleš Vrba")
                XCTAssertEqual(securities?[0].accountno, "1034176627")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
                
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSecuritiesWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "securities.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")

        self.client.securities.withId("420A817C20E4814C7C516A53ABA8E78F0CDBE324").get() { result in
            switch ( result ) {
            case .success( let security ):
                XCTAssertEqual(security.id, "420A817C20E4814C7C516A53ABA8E78F0CDBE324")
                
                XCTAssertEqual(security.balance.value, 1345437)
                XCTAssertEqual(security.balance.precision, 2)
                XCTAssertEqual(security.balance.currency, "CZK")
                
                XCTAssertEqual(security.description, "Aleš Vrba")
                XCTAssertEqual(security.accountno, "1034176627")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
                
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSecuritiesWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "securities.withId.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let request     = SecurityRequest()
        request.alias   = "lorem"
        
        self.client.securities.withId("420A817C20E4814C7C516A53ABA8E78F0CDBE324").update(request) { result in
            switch ( result ) {
            case .success( let securityResponse ):
                XCTAssertEqual(securityResponse.id, "420A817C20E4814C7C516A53ABA8E78F0CDBE324")
                
                XCTAssertEqual(securityResponse.balance.value, 1345437)
                XCTAssertEqual(securityResponse.balance.precision, 2)
                XCTAssertEqual(securityResponse.balance.currency, "CZK")
                
                XCTAssertEqual(securityResponse.alias, "lorem")
                XCTAssertEqual(securityResponse.description, "Aleš Vrba")
                XCTAssertEqual(securityResponse.accountno, "1034176627")
                
                XCTAssertEqual(securityResponse.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
                
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testSecuritiesWithIdTransactionsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "securities.withId.transactions.withId.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let request     = SecurityTransactionRequest()
        request.note    = "New client's personal note for transaction"
        request.flags   = ["hasStar"]
        
        self.client.securities.withId("420A817C20E4814C7C516A53ABA8E78F0CDBE324").transactions.withId("100000189114334").update(request) { result in
            switch ( result ) {
            case .success(let response):
                XCTAssertEqual(response.transaction.id, "100000189114334")
                XCTAssertEqual(response.transaction.note, "New client's personal note for transaction")
                
                XCTAssertEqual(response.transaction.flags?.count, 2)
                XCTAssertEqual(response.transaction.flags?[0], "hasNote")
                XCTAssertEqual(response.transaction.flags?[1], "hasStar")
                
                XCTAssertEqual(response.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
                
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testSecuritiesWithIdTransactionsExport()
    {
        let caseId                   = "securities.withId.transactions.export"
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
        self.client.securities.withId("420A817C20E4814C7C516A53ABA8E78F0CDBE324").transactions.export(parametres) { result in
            switch ( result ) {
            case .success( let pdfFileName ):
                XCTAssertTrue( self.isValidPdfDocumentAtFilePath(pdfFileName: pdfFileName))
                expectation.fulfill()
                
            case .failure:
                verifyResult = true
            }
        }


        self.waitForExpectations(timeout: 10.0, handler:nil)
        
        if verifyResult {
            self.judgeSession.verifyLastTestCase(caseId: caseId, xcTestCase: self) { error in
                if let coreError = error as? CoreSDKError, let info = coreError.serverErrorInfo {
                    XCTAssertTrue( false, "Error: \(info)" )
                }
                else {
                    XCTAssertTrue( false, "Error: \(String(describing: error))" );
                }
            }
        }
    }
 
}
