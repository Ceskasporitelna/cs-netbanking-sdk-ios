//
//  CSNetbankingProfileTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import XCTest

import CSCoreSDK

@testable import CSNetbankingSDK


//==============================================================================
class CSNetbankingProfileTests: CSNetbankingTest
{
    
    //--------------------------------------------------------------------------
    func testProfileGet()
    {
        self.judgeSession.setNextCase( caseId: "profile.get", xcTestCase: self)
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.profile.get( { result in
            switch ( result ) {
            case .success( let customerProfile ):
                XCTAssertEqual(customerProfile.firstName, "Anna")
                XCTAssertEqual(customerProfile.lastName, "Vojtíšková")
                XCTAssertEqual(customerProfile.salutation, "Anno Vojtíšková")
                XCTAssertEqual(customerProfile.customerId, "2002-12-02-00.17.40.959689")
                XCTAssertEqual(customerProfile.instituteId, 1)
                XCTAssertEqual(customerProfile.marketingInfoAcceptance.value, MarketingInfoAcceptance.unknown.value)
                XCTAssertEqual(customerProfile.gender.value, Gender.female.value)
                XCTAssertEqual( self.dateTimeFormatter.date( from: "2016-03-17T15:01:49+01:00" ), customerProfile.lastLogin )
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        })
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testProfileLastLoginList()
    {
        self.judgeSession.setNextCase( caseId: "profile.lastLogin.list", xcTestCase: self)
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.logins.list( { result in
            switch ( result ) {
            case .success( let loginItems):
                //                XCTAssertEqual(loginItems.items.count, 1);
                XCTAssertTrue(loginItems.items.count == 1, "Login items count must be 1.")
                let loginItem = loginItems.items [0];
                XCTAssertEqual(loginItem.channel, "GEORGE")
                XCTAssertEqual( self.dateTimeFormatter.date( from: "2016-03-17T15:01:49+01:00" ), loginItem.lastLogin )
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        })
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
}
