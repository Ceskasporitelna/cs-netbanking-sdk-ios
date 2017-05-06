//
//  CSNetbankingPhoneBookTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

import CSNetbankingSDK

//==============================================================================
class CSNetbankingPhoneBookTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testPhoneBookList()
    {
        self.judgeSession.setNextCase( caseId: "phoneBook.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.phoneNumbers.list() { result in
            switch (result) {
            case .success(let phoneNumberList):
                let phoneNubmers: [PhoneNumberResponse] = phoneNumberList.items
                
                XCTAssertEqual(phoneNubmers.count, 1)
                
                XCTAssertEqual(phoneNubmers[0].id, "2195")
                XCTAssertEqual(phoneNubmers[0].alias, "Graham Bell")
                XCTAssertEqual(phoneNubmers[0].phoneNumber, "777952341")
                
                XCTAssertEqual(phoneNubmers[0].flags?.count, 1)
                XCTAssertEqual(phoneNubmers[0].flags?[0], "isFavourite")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPhoneBookCreate()
    {
        self.judgeSession.setNextCase( caseId: "phoneBook.create", xcTestCase: self)
        
        let expectation     = self.expectation(description: "Response expectation")
        let request         = PhoneNumberCreateRequest()
        request.alias       = "Graham Bell"
        request.phoneNumber = "777952341"
        request.flags       = ["isFavourite"]
        
        self.client.phoneNumbers.create(request) {result in
            switch (result) {
            case .success(let phoneNumber):
                XCTAssertEqual(phoneNumber.id, "2195")
                XCTAssertEqual(phoneNumber.alias, "Graham Bell")
                XCTAssertEqual(phoneNumber.phoneNumber, "777952341")
                
                XCTAssertEqual(phoneNumber.flags?.count, 1)
                XCTAssertEqual(phoneNumber.flags?[0], "isFavourite")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testPhoneBookWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "phoneBook.withId.update", xcTestCase: self)
        
        let expectation     = self.expectation(description: "Response expectation")
        let request         = PhoneNumberUpdateRequest()
        request.alias       = "Graham B."
        request.phoneNumber = "777952341"
        request.flags       = ["isFavourite"]
        
        self.client.phoneNumbers.withId("2195").update(request) { result in
            switch (result) {
            case .success(let phoneNumber):
                XCTAssertEqual(phoneNumber.id, "2195")
                XCTAssertEqual(phoneNumber.alias, "Graham B.")
                XCTAssertEqual(phoneNumber.phoneNumber, "777952341")
                
                XCTAssertEqual(phoneNumber.flags?.count, 1)
                XCTAssertEqual(phoneNumber.flags?[0], "isFavourite")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testPhoneBookWithIdDelete()
    {
        self.judgeSession.setNextCase( caseId: "phoneBook.withId.delete", xcTestCase: self)
        
        let expectation     = self.expectation(description: "Response expectation")
        let request         = PhoneNumberUpdateRequest()
        request.alias       = "Graham B."
        request.phoneNumber = "777952341"
        request.flags       = ["isFavourite"]
        
        self.client.phoneNumbers.withId("2195").delete() { result in
            switch (result) {
            case .success(_):
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

}
