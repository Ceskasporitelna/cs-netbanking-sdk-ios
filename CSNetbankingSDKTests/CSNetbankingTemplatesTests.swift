//
//  CSNetbankingTemplatesTests.swift
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
class CSNetbankingTemplatesTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testTemplatesList()
    {
        self.judgeSession.setNextCase( caseId: "templates.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.templates.list() { result in
            switch (result) {
            case .success(let templatesList):
                let templates: [TemplateResponse] = templatesList.items
                
                XCTAssertEqual(templates.count, 2)
                
                XCTAssertEqual(templates[0].id, "template_0-123-100")
                XCTAssertEqual(templates[0].name, "Jan Novák")
                XCTAssertEqual(templates[0].orderCategory?.value, OrderCategory.domestic.value)

                XCTAssertEqual(templates[0].receiver.number, "2326573123")
                XCTAssertEqual(templates[0].receiver.bankCode, "0800")
                
                XCTAssertEqual(templates[1].id, "template_0-124-100")
                XCTAssertEqual(templates[1].name, "Marek Nový")
                XCTAssertEqual(templates[1].orderCategory?.value, OrderCategory.domestic.value)
                
                XCTAssertEqual(templates[1].receiver.iban, "CZ3308000000001592286253")
                XCTAssertEqual(templates[1].receiver.bic, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testTemplatesListPagination()
    {
        self.judgeSession.setNextCase( caseId: "templates.list.pagination", xcTestCase: self)
        
        var expectation = self.expectation(description: "Response expectation")
        var params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.templates.list(params) { result in
            switch (result) {
            case .success(let templatesList):
                let paginationTest = self.checkPagination(pagination: templatesList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                let templates: [TemplateResponse] = templatesList.items
                
                XCTAssertEqual(templates.count, 1)
                
                XCTAssertEqual(templates[0].id, "template_0-123-100")
                XCTAssertEqual(templates[0].name, "Jan Novák")
                XCTAssertEqual(templates[0].orderCategory?.value, OrderCategory.domestic.value)
                
                XCTAssertEqual(templates[0].receiver.number, "2326573123")
                XCTAssertEqual(templates[0].receiver.bankCode, "0800")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        self.client.templates.list(params) { result in
            switch (result) {
            case .success(let templatesList):
                let paginationTest = self.checkPagination(pagination: templatesList.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let templates: [TemplateResponse] = templatesList.items
                
                XCTAssertEqual(templates.count, 1)
                
                XCTAssertEqual(templates[0].id, "template_0-124-100")
                XCTAssertEqual(templates[0].name, "Marek Nový")
                XCTAssertEqual(templates[0].orderCategory?.value, OrderCategory.domestic.value)
                
                XCTAssertEqual(templates[0].receiver.iban, "CZ3308000000001592286253")
                XCTAssertEqual(templates[0].receiver.bic, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.templates.list(params) { result in
            switch (result) {
            case .success(let templatesList):
                let paginationTest = self.checkPagination(pagination: templatesList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let templates: [TemplateResponse] = templatesList.items
                
                XCTAssertEqual(templates.count, 1)
                
                XCTAssertEqual(templates[0].id, "template_0-123-100")
                XCTAssertEqual(templates[0].name, "Jan Novák")
                XCTAssertEqual(templates[0].orderCategory?.value, OrderCategory.domestic.value)
                
                XCTAssertEqual(templates[0].receiver.number, "2326573123")
                XCTAssertEqual(templates[0].receiver.bankCode, "0800")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testTemplatesWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "templates.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.templates.withId("template_0-123-100").get() { result in
            switch (result) {
            case .success(let template):
                XCTAssertEqual(template.id, "template_0-123-100")
                XCTAssertEqual(template.name, "Jan Novák")
                XCTAssertEqual(template.orderCategory?.value, OrderCategory.domestic.value)
                
                XCTAssertEqual(template.receiver.number, "2326573123")
                XCTAssertEqual(template.receiver.bankCode, "0800")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

}
