//
//  CSNetbankingBudgetsTests.swift
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
class CSNetbankingBudgetsTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testBudgetsList()
    {
        self.judgeSession.setNextCase( caseId: "budgets.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.budgets.list() { result in
            switch (result) {
            case .success(let budgetsList):
                XCTAssertEqual(budgetsList.items?.count, 3)
                
                XCTAssertEqual(budgetsList.items?[0].category.id.value, CategoryId.car.value)
                XCTAssertEqual(budgetsList.items?[0].category.level, "mainCategory")
                
                XCTAssertEqual(budgetsList.items?[0].budget?.value, 2000000)
                XCTAssertEqual(budgetsList.items?[0].budget?.precision, 2)
                XCTAssertEqual(budgetsList.items?[0].budget?.currency, "CZK")
                
                XCTAssertEqual(budgetsList.items?[1].category.id.value, CategoryId.withdrawal.value)
                XCTAssertEqual(budgetsList.items?[1].category.level, "mainCategory")
                
                XCTAssertNil(budgetsList.items?[1].budget)
                
                XCTAssertEqual(budgetsList.items?[2].category.id.value, CategoryId.clothing.value)
                XCTAssertEqual(budgetsList.items?[2].category.level, "mainCategory")
                
                XCTAssertNil(budgetsList.items?[2].budget)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testBudgetsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "budgets.update", xcTestCase: self)
        
        let expectation   = self.expectation(description: "Response expectation")
        
        let budget               = BudgetRequest()
        budget.budget            = Amount()
        budget.budget?.value     = 5000
        budget.budget?.precision = 2
        budget.budget?.currency  = "CZK"
        
        budget.category          = BudgetCategory()
        budget.category?.id      = .otherExpenses
        budget.category?.level   = "mainCategory"
        
        let updateBudgets        = BudgetsUpdateRequest()
        updateBudgets.budgets    = [budget]
        
        self.client.budgets.update(updateBudgets) { result in
            switch (result) {
            case .success(let updateBudgets):
                XCTAssertEqual(updateBudgets.budgets?.count, 1)
                XCTAssertTrue(updateBudgets.manuallySet!)
                
                XCTAssertEqual(updateBudgets.budgets?[0].category.id.value, CategoryId.otherExpenses.value)
                XCTAssertEqual(updateBudgets.budgets?[0].category.level, "mainCategory")
                
                XCTAssertEqual(updateBudgets.budgets?[0].budget?.value, 5000)
                XCTAssertEqual(updateBudgets.budgets?[0].budget?.precision, 2)
                XCTAssertEqual(updateBudgets.budgets?[0].budget?.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

}
