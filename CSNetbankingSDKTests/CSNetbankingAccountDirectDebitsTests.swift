//
//  CSNetbankingAccountDirectDebitsTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingAccountDirectDebitsTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testAccountsWithIdDirectDebtsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.directDebts.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let parametres  = DirectDebitsParameters(pagination: Pagination(pageNumber: 0, pageSize: 2), sort: Sort( by:[(.periodCycle, .descending)]))
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").directDebits.list(parametres) { result in
            switch (result) {
            case .success(let directDebitList):
                let paginationTest = self.checkPagination(pagination: directDebitList.pagination, pageNumber: 0, pageCount: 2, pageSize: 2, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let directDebits: [DirectDebitResponse] = directDebitList.items
                XCTAssertEqual(directDebits.count, 2 )
                
                XCTAssertEqual(directDebits[0].number, "2")
                
                XCTAssertEqual(directDebits[0].receiver.number, "428602109")
                XCTAssertEqual(directDebits[0].receiver.bankCode, "0800")
                XCTAssertEqual(directDebits[0].receiver.countryCode, "CZ")
                
                XCTAssertEqual(directDebits[0].type.value, "DIRECT_DEBIT")
                XCTAssertEqual(directDebits[0].periodicity, 1)
                XCTAssertEqual(directDebits[0].periodCycle.value, "MONTHLY")
                
                XCTAssertEqual(directDebits[0].limitSum?.value, 99999999900)
                XCTAssertEqual(directDebits[0].limitSum?.precision, 2)
                XCTAssertEqual(directDebits[0].limitSum?.currency, "CZK")
                
                XCTAssertEqual(directDebits[0].startDate, self.dateFormatter.date(from: "2012-11-26"))
                
                XCTAssertEqual(directDebits[0].symbols?.variableSymbol, "0")
                XCTAssertEqual(directDebits[0].symbols?.specificSymbol, "0")
                
                XCTAssertEqual(directDebits[0].versionId, 1)
                XCTAssertEqual(directDebits[0].versionValidityDate, self.dateFormatter.date(from: "2012-11-26"))
                
                XCTAssertEqual(directDebits[0].receiverName, "Vrba Aleš")
                
                XCTAssertEqual(directDebits[1].number, "3")
                
                XCTAssertEqual(directDebits[1].receiver.number, "1330052")
                XCTAssertEqual(directDebits[1].receiver.bankCode, "0800")
                XCTAssertEqual(directDebits[1].receiver.countryCode, "CZ")
                
                XCTAssertEqual(directDebits[1].type.value, "DIRECT_DEBIT")
                XCTAssertEqual(directDebits[1].periodicity, 12)
                XCTAssertEqual(directDebits[1].periodCycle.value, "MONTHLY")
                
                XCTAssertEqual(directDebits[1].limitSum?.value, 88400)
                XCTAssertEqual(directDebits[1].limitSum?.precision, 2)
                XCTAssertEqual(directDebits[1].limitSum?.currency, "CZK")
                
                XCTAssertEqual(directDebits[1].startDate, self.dateFormatter.date(from: "2012-11-30"))
                
                XCTAssertEqual(directDebits[1].symbols?.variableSymbol, "0")
                XCTAssertEqual(directDebits[1].symbols?.specificSymbol, "0")
                
                XCTAssertEqual(directDebits[1].versionId, 1)
                XCTAssertEqual(directDebits[1].versionValidityDate, self.dateFormatter.date(from: "2012-11-30"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdDirectDebtsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.directDebts.list.page1", xcTestCase: self)
        
        let expectation = self.self.expectation(description: "Response expectation")
        let parametres  = DirectDebitsParameters(pagination: Pagination(pageNumber: 1, pageSize: 2), sort: Sort( by:[(.periodCycle, .descending)]))
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").directDebits.list(parametres) { result in
            switch (result) {
            case .success(let directDebitList):
                let paginationTest = self.checkPagination(pagination: directDebitList.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let directDebits: [DirectDebitResponse] = directDebitList.items
                XCTAssertEqual(directDebits.count, 1 )
                
                XCTAssertEqual(directDebits[0].number, "4")
                
                XCTAssertEqual(directDebits[0].receiver.number, "101082201")
                XCTAssertEqual(directDebits[0].receiver.bankCode, "0800")
                XCTAssertEqual(directDebits[0].receiver.countryCode, "CZ")
                
                XCTAssertEqual(directDebits[0].type.value, "SIPO")
                XCTAssertEqual(directDebits[0].periodicity, 1)
                XCTAssertEqual(directDebits[0].periodCycle.value, "MONTHLY")
                
                XCTAssertEqual(directDebits[0].limitSum?.value, 99999999900)
                XCTAssertEqual(directDebits[0].limitSum?.precision, 2)
                XCTAssertEqual(directDebits[0].limitSum?.currency, "CZK")
                
                XCTAssertEqual(directDebits[0].startDate, self.dateFormatter.date(from: "2013-01-08"))
                
                XCTAssertEqual(directDebits[0].symbols?.variableSymbol, "8009710218")
                XCTAssertEqual(directDebits[0].symbols?.specificSymbol, "0")
                
                XCTAssertEqual(directDebits[0].versionId, 1)
                XCTAssertEqual(directDebits[0].versionValidityDate, self.dateFormatter.date(from: "2013-01-08"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdDirectDebtsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.directDebts.withId.get", xcTestCase: self)
        
        let expectation = self.self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").directDebits.withId("4").get() { result in
            switch (result) {
            case .success(let directDebit):

                XCTAssertEqual(directDebit.number, "4")
                
                XCTAssertEqual(directDebit.receiver.number, "101082201")
                XCTAssertEqual(directDebit.receiver.bankCode, "0800")
                XCTAssertEqual(directDebit.receiver.countryCode, "CZ")
                
                XCTAssertEqual(directDebit.type.value, "SIPO")
                XCTAssertEqual(directDebit.periodicity, 1)
                XCTAssertEqual(directDebit.periodCycle.value, "MONTHLY")
                
                XCTAssertEqual(directDebit.limitSum?.value, 99999999900)
                XCTAssertEqual(directDebit.limitSum?.precision, 2)
                XCTAssertEqual(directDebit.limitSum?.currency, "CZK")
                
                XCTAssertEqual(directDebit.startDate, self.dateFormatter.date(from: "2013-01-08"))
                
                XCTAssertEqual(directDebit.symbols?.variableSymbol, "8009710218")
                XCTAssertEqual(directDebit.symbols?.specificSymbol, "0")
                
                XCTAssertEqual(directDebit.versionId, 1)
                XCTAssertEqual(directDebit.versionValidityDate, self.dateFormatter.date(from: "2013-01-08"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdDirectDebtsWithIdDelete()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.directDebts.withId.delete", xcTestCase: self)
        
        let expectation = self.self.expectation(description: "Response expectation")
        
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
                
                XCTAssertEqual(signableDirectDebit.versionId, 1)
                XCTAssertEqual(signableDirectDebit.versionValidityDate, self.dateFormatter.date(from: "2013-01-08"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdDirectDebtsCreate()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.directDebts.create", xcTestCase: self)
        
        let expectation                                    = self.self.expectation(description: "Response expectation")
        let directDebit                                    = DirectDebitRequest()
        directDebit.type                                   = .directDebit
        
        directDebit.receiver                               = AccountNumber()
        directDebit.receiver?.number                       = "428602109"
        directDebit.receiver?.bankCode                     = "0800"
        
        directDebit.alias                                  = "moje inkaso"
        directDebit.periodicity                            = 1
        directDebit.periodCycle                            = .monthly
        
        directDebit.numberLimit                            = 5
        
        directDebit.limit                                  = Amount()
        directDebit.limit?.value                           = 100000
        directDebit.limit?.precision                       = 2
        directDebit.limit?.currency                        = "CZK"
        
        directDebit.limitSum                               = Amount()
        directDebit.limitSum?.value                        = 300000
        directDebit.limitSum?.precision                    = 2
        directDebit.limitSum?.currency                     = "CZK"
        
        directDebit.startDate                              = self.dateFormatter.date(from: "2017-07-14")
        directDebit.endDate                                = self.dateFormatter.date(from: "2018-07-14")
        
        directDebit.symbols                                = Symbols()
        directDebit.symbols?.variableSymbol                = "4567"
        directDebit.symbols?.specificSymbol                = "800"
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").directDebits.create(directDebit) { result in
            switch (result) {
            case .success(let signableDirectDebit):
                XCTAssertEqual(signableDirectDebit.receiver.number, "428602109")
                XCTAssertEqual(signableDirectDebit.receiver.bankCode, "0800")
                
                XCTAssertEqual(signableDirectDebit.type.value, "DIRECT_DEBIT")
                XCTAssertEqual(signableDirectDebit.periodicity, 1)
                XCTAssertEqual(signableDirectDebit.periodCycle.value, "MONTHLY")
                
                XCTAssertEqual(signableDirectDebit.limit?.value, 100000)
                XCTAssertEqual(signableDirectDebit.limit?.precision, 2)
                XCTAssertEqual(signableDirectDebit.limit?.currency, "CZK")
                
                XCTAssertEqual(signableDirectDebit.limitSum?.value, 300000)
                XCTAssertEqual(signableDirectDebit.limitSum?.precision, 2)
                XCTAssertEqual(signableDirectDebit.limitSum?.currency, "CZK")
                
                XCTAssertEqual(signableDirectDebit.startDate, self.dateFormatter.date(from: "2017-07-14"))
                XCTAssertEqual(signableDirectDebit.endDate, self.dateFormatter.date(from: "2018-7-14"))
                
                XCTAssertEqual(signableDirectDebit.symbols?.variableSymbol, "4567")
                XCTAssertEqual(signableDirectDebit.symbols?.specificSymbol, "800")
                
                XCTAssertEqual(signableDirectDebit.signInfo?.state, "OPEN")
                XCTAssertEqual(signableDirectDebit.signInfo?.signId, "160530104689642")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

}
