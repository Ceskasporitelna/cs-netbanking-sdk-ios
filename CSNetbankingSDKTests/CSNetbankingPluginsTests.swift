//
//  CSNetbankingPluginsTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingPluginsTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testPluginsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "plugins.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.plugins.list(params) { result in
            switch (result) {
            case .success(let pluginsList):
                let paginationTest = self.checkPagination(pagination: pluginsList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let plugins: [PluginResponse] = pluginsList.items
                
                XCTAssertEqual(plugins.count, 1)
                
                XCTAssertEqual(plugins[0].productCode, "PI-MOBILEPAYMENTS")
                XCTAssertEqual(plugins[0].name, "Plugin pro mobilní platby")
                
                XCTAssertEqual(plugins[0].standardFees?.count, 1)
                XCTAssertEqual(plugins[0].standardFees?[0].timeOfCharging.value, TimeOfCharging.immediately.value)
                XCTAssertEqual(plugins[0].standardFees?[0].periodOfCharging.value, PeriodOfCharging.nonRecurring.value)
                
                XCTAssertEqual(plugins[0].standardFees?[0].amount.value, 0)
                XCTAssertEqual(plugins[0].standardFees?[0].amount.precision, 2)
                XCTAssertEqual(plugins[0].standardFees?[0].amount.currency, "CZK")
                
                XCTAssertEqual(plugins[0].validUntil, self.dateFormatter.date(from: "2100-01-01"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPluginsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "plugins.list.page1", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        self.client.plugins.list(params) { result in
            switch (result) {
            case .success(let pluginsList):
                let paginationTest = self.checkPagination(pagination: pluginsList.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                let plugins: [PluginResponse] = pluginsList.items
                
                XCTAssertEqual(plugins.count, 1)
                
                XCTAssertEqual(plugins[0].productCode, "PFM_1")
                XCTAssertEqual(plugins[0].name, "PluginBudgets pro CZ")
                
                XCTAssertEqual(plugins[0].standardFees?.count, 1)
                XCTAssertEqual(plugins[0].standardFees?[0].timeOfCharging.value, TimeOfCharging.immediately.value)
                XCTAssertEqual(plugins[0].standardFees?[0].periodOfCharging.value, PeriodOfCharging.nonRecurring.value)
                
                XCTAssertEqual(plugins[0].standardFees?[0].amount.value, 0)
                XCTAssertEqual(plugins[0].standardFees?[0].amount.precision, 2)
                XCTAssertEqual(plugins[0].standardFees?[0].amount.currency, "CZK")
                
                XCTAssertEqual(plugins[0].validUntil, self.dateFormatter.date(from: "2100-01-01"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPluginsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "plugins.withId.update", xcTestCase: self)
        
        let expectation                 = self.expectation(description: "Response expectation")
        let updatePluginRequest         = UpdatePluginRequest()
        updatePluginRequest.productCode = "PI-MOBILEPAYMENTS"
        updatePluginRequest.flags       = ["active"]
        
        self.client.plugins.withId("PI-MOBILEPAYMENTS").update(updatePluginRequest) { result in
            switch (result) {
            case .success(let signablePlugin):
                
                XCTAssertEqual(signablePlugin.productCode, "PI-MOBILEPAYMENTS")
                XCTAssertEqual(signablePlugin.name, "Plugin pro mobilní platby")
                
                XCTAssertEqual(signablePlugin.standardFees?.count, 1)
                XCTAssertEqual(signablePlugin.standardFees?[0].timeOfCharging.value, TimeOfCharging.immediately.value)
                XCTAssertEqual(signablePlugin.standardFees?[0].periodOfCharging.value, PeriodOfCharging.nonRecurring.value)
                
                XCTAssertEqual(signablePlugin.standardFees?[0].amount.value, 0)
                XCTAssertEqual(signablePlugin.standardFees?[0].amount.precision, 2)
                XCTAssertEqual(signablePlugin.standardFees?[0].amount.currency, "CZK")
                
                XCTAssertEqual(signablePlugin.validUntil, self.dateFormatter.date(from: "2100-01-01"))
                
                XCTAssertEqual(signablePlugin.flags?.count, 1)
                XCTAssertEqual(signablePlugin.flags?[0], "active")
                
                XCTAssertEqual(signablePlugin.signInfo?.state, "NONE")

                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }


}
