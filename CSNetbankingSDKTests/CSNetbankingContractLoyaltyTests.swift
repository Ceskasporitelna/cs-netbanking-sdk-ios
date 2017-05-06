//
//  CSNetbankingContractLoyaltyTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingContractLoyaltyTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testContractsLoyaltyGet()
    {
        self.judgeSession.setNextCase( caseId: "contracts.loyalty.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")

        self.client.contracts.loyalty.get() { result in
            switch (result) {
            case .success(let loyalty):
                XCTAssertEqual(loyalty.exportDate, self.dateTimeFormatter.date(from: "2016-05-31T00:00:00+02:00"))
                XCTAssertEqual(loyalty.state.value, LoyaltyState.unregistered.value)
                XCTAssertEqual(loyalty.pointsCount, 0)
                XCTAssertEqual(loyalty.activationCode, "15B8FE1760")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

}
