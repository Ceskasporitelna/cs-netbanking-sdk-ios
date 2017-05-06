//
//  CSNetbankingGoalsTests.swift
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
class CSNetbankingGoalsTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testGoalsList()
    {
        self.judgeSession.setNextCase( caseId: "goals.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.goals.list() { result in
            switch (result) {
            case .success(let goalsList):
                let goals: [GoalResponse] = goalsList.items
                XCTAssertEqual(goals.count, 1)
                
                XCTAssertEqual(goals[0].name, "Dovolená")
                XCTAssertEqual(goals[0].price.value, 1500000)
                XCTAssertEqual(goals[0].price.precision, 2)
                XCTAssertEqual(goals[0].price.currency, "CZK")
                
                XCTAssertNil(goals[0].deadline)
                XCTAssertFalse(goals[0].completed)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testGoalsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "goals.update", xcTestCase: self)
        
        let expectation          = self.expectation(description: "Response expectation")
        let referenceDate        = Date(timeIntervalSince1970: 1445554800000)
        
        let goal                 = GoalRequest()
        goal.name                = "Auto"
        
        goal.price               = Amount()
        goal.price!.value         = 4000
        goal.price!.precision     = 2
        goal.price!.currency      = "CZK"
        
        goal.deadline            = referenceDate
        goal.completed           = false
        
        let updateGoals          = UpdateGoalsRequest()
        updateGoals.goals        = [goal]

        self.client.goals.update(updateGoals) { result in
            switch (result) {
            case .success(let updateGoal):
                XCTAssertEqual(updateGoal.goals?.count, 1)
                
                XCTAssertEqual(updateGoal.goals?[0].name, "Auto")
                
                XCTAssertEqual(updateGoal.goals?[0].price?.value, 4000)
                XCTAssertEqual(updateGoal.goals?[0].price?.precision, 2)
                XCTAssertEqual(updateGoal.goals?[0].price?.currency, "CZK")
                
                XCTAssertEqual(updateGoal.goals?[0].deadline, referenceDate)
                XCTAssertFalse(updateGoal.goals[0].completed)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
}
