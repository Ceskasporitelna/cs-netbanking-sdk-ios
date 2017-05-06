//
//  CSNetbankingAccountStandingOrdersTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 02/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingAccountStandingOrdersTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testAccountsWithIdStandingOrdersListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.standingOrders.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let parametres  = StandingOrdersParameters(pagination: Pagination(pageNumber: 0, pageSize: 2), sort: Sort( by:[(.nextExecutionDate, .descending)]))

        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").standingOrders.list(parametres) { result in
            switch (result) {
            case .success(let standingOrdersList):
                let paginationTest = self.checkPagination(pagination: standingOrdersList.pagination, pageNumber: 0, pageCount: 3, pageSize: 2, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let standingOrders: [StandingOrderResponse] = standingOrdersList.items
                
                XCTAssertEqual(standingOrders.count, 2)
                
                XCTAssertEqual(standingOrders[0].number, "1")
                XCTAssertEqual(standingOrders[0].type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrders[0].status, "OK")
                XCTAssertEqual(standingOrders[0].alias, "nájemné")
                
                XCTAssertEqual(standingOrders[0].receiver.number, "174748262")
                XCTAssertEqual(standingOrders[0].receiver.bankCode, "0300")
                XCTAssertEqual(standingOrders[0].receiver.countryCode, "CZ")
                XCTAssertEqual(standingOrders[0].receiver.czIBAN, "CZ6703000000000174748262")
                
                XCTAssertEqual(standingOrders[0].amount.value, 235000)
                XCTAssertEqual(standingOrders[0].amount.precision, 2)
                XCTAssertEqual(standingOrders[0].amount.currency, "CZK")
                
                XCTAssertEqual(standingOrders[0].startDate, self.dateTimeFormatter.date(from: "2013-01-09T00:00:00+01:00"))
                XCTAssertEqual(standingOrders[0].nextExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                XCTAssertEqual(standingOrders[0].realExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                XCTAssertEqual(standingOrders[0].executionDueMode.value, "DUE_DAY_OF_MONTH")
                XCTAssertEqual(standingOrders[0].executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrders[0].executionInterval.value, "MONTHLY")
                XCTAssertEqual(standingOrders[0].intervalDueDay, 17)
                
                XCTAssertEqual(standingOrders[0].symbols?.variableSymbol, "8840709604")
                XCTAssertEqual(standingOrders[0].symbols?.specificSymbol, "311013")
                
                XCTAssertEqual(standingOrders[0].flags?.count, 1)
                XCTAssertEqual(standingOrders[0].flags?[0], "deletable")
                
                XCTAssertEqual(standingOrders[0].scheduledExecutionDates?.count, 1)
                XCTAssertEqual(standingOrders[0].scheduledExecutionDates?[0], self.dateFormatter.date(from: "2016-06-17"))
                
                XCTAssertEqual(standingOrders[1].number, "2")
                XCTAssertEqual(standingOrders[1].type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrders[1].status, "OK")
                XCTAssertEqual(standingOrders[1].alias, "spořící účet")
                
                XCTAssertEqual(standingOrders[1].receiver.number, "3668601379")
                XCTAssertEqual(standingOrders[1].receiver.bankCode, "0800")
                XCTAssertEqual(standingOrders[1].receiver.countryCode, "CZ")
                XCTAssertEqual(standingOrders[1].receiver.czIBAN, "CZ7308000000003668601379")
                
                XCTAssertEqual(standingOrders[1].amount.value, 100000)
                XCTAssertEqual(standingOrders[1].amount.precision, 2)
                XCTAssertEqual(standingOrders[1].amount.currency, "CZK")
                
                XCTAssertEqual(standingOrders[1].startDate, self.dateTimeFormatter.date(from: "2014-04-24T00:00:00+02:00"))
                XCTAssertEqual(standingOrders[1].nextExecutionDate, self.dateFormatter.date(from: "2016-06-15"))
                XCTAssertEqual(standingOrders[1].realExecutionDate, self.dateFormatter.date(from: "2016-06-15"))
                XCTAssertEqual(standingOrders[1].executionDueMode.value, "DUE_DAY_OF_MONTH")
                XCTAssertEqual(standingOrders[1].executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrders[1].executionInterval.value, "MONTHLY")
                XCTAssertEqual(standingOrders[1].intervalDueDay, 15)
                
                XCTAssertEqual(standingOrders[1].flags?.count, 1)
                XCTAssertEqual(standingOrders[1].flags?[0], "deletable")
                
                XCTAssertEqual(standingOrders[1].scheduledExecutionDates?.count, 1)
                XCTAssertEqual(standingOrders[1].scheduledExecutionDates?[0], self.dateFormatter.date(from: "2016-06-15"))
                    
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdStandingOrdersListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.standingOrders.list.page1", xcTestCase: self)
        
        let expectation = self.self.expectation(description: "Response expectation")
        let parametres  = StandingOrdersParameters(pagination: Pagination(pageNumber: 1, pageSize: 2), sort: Sort( by:[(.nextExecutionDate, .descending)]))
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").standingOrders.list(parametres) { result in
            switch (result) {
            case .success(let standingOrdersList):
                let paginationTest = self.checkPagination(pagination: standingOrdersList.pagination, pageNumber: 1, pageCount: 3, pageSize: 2, nextPageNumber: 2)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                let standingOrders: [StandingOrderResponse] = standingOrdersList.items
                
                XCTAssertEqual(standingOrders.count, 2)
                
                XCTAssertEqual(standingOrders[0].number, "3")
                XCTAssertEqual(standingOrders[0].type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrders[0].status, "OK")
                
                XCTAssertEqual(standingOrders[0].receiver.number, "35-2001269369")
                XCTAssertEqual(standingOrders[0].receiver.bankCode, "0800")
                XCTAssertEqual(standingOrders[0].receiver.countryCode, "CZ")
                XCTAssertEqual(standingOrders[0].receiver.czIBAN, "CZ7908000000352001269369")
                
                XCTAssertEqual(standingOrders[0].amount.value, 50000)
                XCTAssertEqual(standingOrders[0].amount.precision, 2)
                XCTAssertEqual(standingOrders[0].amount.currency, "CZK")
                
                XCTAssertEqual(standingOrders[0].startDate, self.dateTimeFormatter.date(from: "2014-04-24T00:00:00+02:00"))
                XCTAssertEqual(standingOrders[0].nextExecutionDate, self.dateFormatter.date(from: "2016-06-15"))
                XCTAssertEqual(standingOrders[0].realExecutionDate, self.dateFormatter.date(from: "2016-06-15"))
                XCTAssertEqual(standingOrders[0].executionDueMode.value, "DUE_DAY_OF_MONTH")
                XCTAssertEqual(standingOrders[0].executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrders[0].executionInterval.value, "MONTHLY")
                XCTAssertEqual(standingOrders[0].intervalDueDay, 15)
                
                XCTAssertEqual(standingOrders[0].symbols?.variableSymbol, "1034176627")
                
                XCTAssertEqual(standingOrders[0].flags?.count, 1)
                XCTAssertEqual(standingOrders[0].flags?[0], "deletable")
                
                XCTAssertEqual(standingOrders[0].scheduledExecutionDates?.count, 1)
                XCTAssertEqual(standingOrders[0].scheduledExecutionDates?[0], self.dateFormatter.date(from: "2016-06-15"))
                
                XCTAssertEqual(standingOrders[1].number, "4")
                XCTAssertEqual(standingOrders[1].type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrders[1].status, "OK")
                
                XCTAssertEqual(standingOrders[1].receiver.number, "35-2001269369")
                XCTAssertEqual(standingOrders[1].receiver.bankCode, "0800")
                XCTAssertEqual(standingOrders[1].receiver.countryCode, "CZ")
                XCTAssertEqual(standingOrders[1].receiver.czIBAN, "CZ7908000000352001269369")
                
                XCTAssertEqual(standingOrders[1].amount.value, 100000)
                XCTAssertEqual(standingOrders[1].amount.precision, 2)
                XCTAssertEqual(standingOrders[1].amount.currency, "CZK")
                
                XCTAssertEqual(standingOrders[1].startDate, self.dateTimeFormatter.date(from: "2015-07-31T00:00:00+02:00"))
                XCTAssertEqual(standingOrders[1].nextExecutionDate, self.dateFormatter.date(from: "2016-06-15"))
                XCTAssertEqual(standingOrders[1].realExecutionDate, self.dateFormatter.date(from: "2016-06-15"))
                XCTAssertEqual(standingOrders[1].executionDueMode.value, "DUE_DAY_OF_MONTH")
                XCTAssertEqual(standingOrders[1].executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrders[1].executionInterval.value, "MONTHLY")
                XCTAssertEqual(standingOrders[1].intervalDueDay, 15)
                
                XCTAssertEqual(standingOrders[1].flags?.count, 1)
                XCTAssertEqual(standingOrders[1].flags?[0], "deletable")
                
                XCTAssertEqual(standingOrders[1].scheduledExecutionDates?.count, 1)
                XCTAssertEqual(standingOrders[1].scheduledExecutionDates?[0], self.dateFormatter.date(from: "2016-06-15"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdStandingOrdersWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.standingOrders.withId.get", xcTestCase: self)
        
        let expectation = self.self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").standingOrders.withId("1").get() { result in
            switch (result) {
            case .success(let standingOrder):
                XCTAssertEqual(standingOrder.number, "1")
                XCTAssertEqual(standingOrder.type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrder.status, "OK")
                
                XCTAssertEqual(standingOrder.receiver.number, "174748262")
                XCTAssertEqual(standingOrder.receiver.bankCode, "0300")
                XCTAssertEqual(standingOrder.receiver.countryCode, "CZ")
                XCTAssertEqual(standingOrder.receiver.czIBAN, "CZ6703000000000174748262")
                
                XCTAssertEqual(standingOrder.amount.value, 235000)
                XCTAssertEqual(standingOrder.amount.precision, 2)
                XCTAssertEqual(standingOrder.amount.currency, "CZK")
                
                XCTAssertEqual(standingOrder.startDate, self.dateTimeFormatter.date(from: "2013-01-09T00:00:00+01:00"))
                XCTAssertEqual(standingOrder.nextExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                XCTAssertEqual(standingOrder.realExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                XCTAssertEqual(standingOrder.executionDueMode.value, "DUE_DAY_OF_MONTH")
                XCTAssertEqual(standingOrder.executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrder.executionInterval.value, "MONTHLY")
                XCTAssertEqual(standingOrder.intervalDueDay, 17)
                
                XCTAssertEqual(standingOrder.symbols?.variableSymbol, "8840709604")
                XCTAssertEqual(standingOrder.symbols?.specificSymbol, "311013")
                
                XCTAssertEqual(standingOrder.flags?.count, 1)
                XCTAssertEqual(standingOrder.flags?[0], "deletable")
                
                XCTAssertEqual(standingOrder.scheduledExecutionDates?.count, 1)
                XCTAssertEqual(standingOrder.scheduledExecutionDates?[0], self.dateFormatter.date(from: "2016-06-17"))
                
                XCTAssertEqual(standingOrder.stoppages?.count, 3)
                XCTAssertEqual(standingOrder.stoppages?[0].value, StoppageMonth.january.value)
                XCTAssertEqual(standingOrder.stoppages?[1].value, StoppageMonth.february.value)
                XCTAssertEqual(standingOrder.stoppages?[2].value, StoppageMonth.march.value)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdStandingOrdersWithIdDelete()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.standingOrders.withId.delete", xcTestCase: self)
        
        let expectation = self.self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").standingOrders.withId("1").delete() { result in
            switch (result) {
            case .success(let standingOrder):
                XCTAssertEqual(standingOrder.number, "1")
                XCTAssertEqual(standingOrder.type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrder.status, "OK")
                
                XCTAssertEqual(standingOrder.receiver.number, "174748262")
                XCTAssertEqual(standingOrder.receiver.bankCode, "0300")
                XCTAssertEqual(standingOrder.receiver.countryCode, "CZ")
                XCTAssertEqual(standingOrder.receiver.czIBAN, "CZ6703000000000174748262")
                
                XCTAssertEqual(standingOrder.amount.value, 235000)
                XCTAssertEqual(standingOrder.amount.precision, 2)
                XCTAssertEqual(standingOrder.amount.currency, "CZK")
                
                XCTAssertEqual(standingOrder.startDate, self.dateTimeFormatter.date(from: "2013-01-09T00:00:00+01:00"))
                XCTAssertEqual(standingOrder.nextExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                XCTAssertEqual(standingOrder.realExecutionDate, self.dateFormatter.date(from: "2016-06-17"))
                XCTAssertEqual(standingOrder.executionDueMode.value, "DUE_DAY_OF_MONTH")
                XCTAssertEqual(standingOrder.executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrder.executionInterval.value, "MONTHLY")
                XCTAssertEqual(standingOrder.intervalDueDay, 17)
                
                XCTAssertEqual(standingOrder.symbols?.variableSymbol, "8840709604")
                XCTAssertEqual(standingOrder.symbols?.specificSymbol, "311013")
                
                XCTAssertEqual(standingOrder.flags?.count, 1)
                XCTAssertEqual(standingOrder.flags?[0], "deletable")
                
                XCTAssertEqual(standingOrder.scheduledExecutionDates?.count, 1)
                XCTAssertEqual(standingOrder.scheduledExecutionDates?[0], self.dateFormatter.date(from: "2016-06-17"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdStandingOrdersCreate()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.standingOrders.create", xcTestCase: self)
        
        let expectation                 = self.self.expectation(description: "Response expectation")
        
        let request                     = CreateStandingOrderRequest()
        request.type                    = .standingOrder
        request.alias                   = "Monthly standing order executed on the last day of month"
        request.receiverName            = "Name of the receiver"
        
        request.receiver                = AccountNumber()
        request.receiver?.number        = "188505042"
        request.receiver?.bankCode      = "0300"
        
        request.amount                  = Amount()
        request.amount?.value           = 30000
        request.amount?.precision       = 2
        request.amount?.currency        = "CZK"
        
        request.nextExecutionDate       = self.dateFormatter.date(from: "2016-12-31")
        request.executionMode           = .untilCancellation
        request.executionDueMode        = .dueLastDayOfMonth
        request.executionInterval       = .monthly
        
        request.symbols                 = Symbols()
        request.symbols?.variableSymbol = "854259"
        request.symbols?.constantSymbol = "0305"
        request.symbols?.specificSymbol = "785421"
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").standingOrders.create(request) { result in
            switch (result) {
            case .success(let standingOrderResponse):
                XCTAssertEqual(standingOrderResponse.number, "160526104005956")
                XCTAssertEqual(standingOrderResponse.type.value, "STANDING_ORDER")
                XCTAssertEqual(standingOrderResponse.status, "OK")
                XCTAssertEqual(standingOrderResponse.alias, "Monthly standing order executed on the last day of month")
                
                XCTAssertEqual(standingOrderResponse.receiver.number, "188505042")
                XCTAssertEqual(standingOrderResponse.receiver.bankCode, "0300")

                XCTAssertEqual(standingOrderResponse.amount.value, 30000)
                XCTAssertEqual(standingOrderResponse.amount.precision, 2)
                XCTAssertEqual(standingOrderResponse.amount.currency, "CZK")
                
                XCTAssertEqual(standingOrderResponse.startDate, self.dateTimeFormatter.date(from: "2016-12-31T00:00:00+01:00"))
                XCTAssertEqual(standingOrderResponse.nextExecutionDate, self.dateFormatter.date(from: "2016-12-31"))
                
                XCTAssertEqual(standingOrderResponse.executionDueMode.value, "DUE_LAST_DAY_OF_MONTH")
                XCTAssertEqual(standingOrderResponse.executionMode.value, "UNTIL_CANCELLATION")
                XCTAssertEqual(standingOrderResponse.executionInterval.value, "MONTHLY")
                
                XCTAssertEqual(standingOrderResponse.symbols?.variableSymbol, "854259")
                XCTAssertEqual(standingOrderResponse.symbols?.constantSymbol, "0305")
                XCTAssertEqual(standingOrderResponse.symbols?.specificSymbol, "785421")
                
                XCTAssertEqual(standingOrderResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(standingOrderResponse.signInfo?.signId, "160526104005956")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }


}
