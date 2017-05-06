//
//  CSNetbankingErrorTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 11/05/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import XCTest

import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class DummyAccessTokenProvider: AccessTokenProvider
{
    let token = "dummy_access_token"
    
    //--------------------------------------------------------------------------
    func getAccessToken( _ callback: @escaping ( _ result: CoreResult<TAccessToken>) -> () )
    {
        callback(CoreResult.success(self.token))
    }
    
    //--------------------------------------------------------------------------
    func refreshAccessToken( _ callback: @escaping ( _ result: CoreResult<TAccessToken>) -> () )
    {
        callback(CoreResult.success(self.token))
    }
}

//==============================================================================
class CSNetbankingErrorTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testAuthorizationTokenInvalid()
    {
        self.judgeSession.setNextCase( caseId: "authorizationToken.invalid", xcTestCase: self)
        
        let originalAccessTokenProvider = self.client.accessTokenProvider
        self.client.accessTokenProvider = DummyAccessTokenProvider()
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.accounts.list() { result in
            switch (result) {
            case .success(_):
                XCTFail("Should fail here.")
                
            case .failure(let error):
                XCTAssertTrue( error is CoreSDKError )
                
                let coreError   = error as! CoreSDKError
                XCTAssertEqual(coreError.code, 403)
                
                if let errorInfo   = coreError.serverErrorInfo {
                    let errorDetail = (errorInfo ["errors"] as! [[String:String]])[0] as [String:String]
                    XCTAssertEqual( errorDetail ["error"], "OAUTH2 failed to TOKEN_INFO with response: {\"error\":\"invalid_request\",\"error_description\":\"Token or Scope not found or invalid\"}")
                    
                    expectation.fulfill()
                }
                else {
                    XCTFail("No server error info!")
                }
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        self.client.accessTokenProvider = originalAccessTokenProvider
    }
    
    //--------------------------------------------------------------------------
    func testAuthorizationTokenMissing()
    {
        self.judgeSession.setNextCase( caseId: "authorizationToken.missing", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.accounts.list() { result in
            switch (result) {
            case .success(_):
                XCTFail("Should fail here.")
                
            case .failure(let error):
                XCTAssertTrue( error is CoreSDKError )
                
                let coreError   = error as! CoreSDKError
                XCTAssertEqual(coreError.code, 403)
            
                if let errorInfo   = coreError.serverErrorInfo {
                    let errorDetail = (errorInfo ["errors"] as! [[String:String]])[0] as [String:String]
                    XCTAssertEqual( errorDetail ["error"], "missing access token")
                    
                    expectation.fulfill()
                }
                else {
                    XCTFail("No server error info!")
                }
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)

    }
    
    //--------------------------------------------------------------------------
    func testNetbankingError_400()
    {
        self.judgeSession.setNextCase( caseId: "netbanking.error.400", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE").get { result in
            switch ( result ) {
            case .success(_):
                XCTFail("Should fail here.")
                
            case .failure(let error):
                XCTAssertTrue( error is CoreSDKError )
                
                let coreError   = error as! CoreSDKError
                XCTAssertEqual(coreError.code, 400)
                
                if let errorInfo   = coreError.serverErrorInfo {
                    XCTAssertEqual( (errorInfo ["transactionId"] as! String), "1173593573")
                    XCTAssertTrue( (errorInfo ["stacktrace"] as! String).contains("org.springframework.web.HttpMediaTypeNotSupportedException:"))
                    
                    let errorDetail = (errorInfo ["errors"] as! [[String:String]])[0] as [String:String]
                    XCTAssertEqual( errorDetail ["error"], "BAD_REQUEST")
                    XCTAssertEqual( errorDetail ["message"], "Content type 'null' not supported")
                    
                    expectation.fulfill()
                }
                else {
                    XCTFail("No server error info!")
                }
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testNetbankingError_404()
    {
        self.judgeSession.setNextCase( caseId: "netbanking.error.404", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("4B2F9EBE742BCAE1E98A78E12F6FBC62464A74oo").get { result in
            switch ( result ) {
            case .success(_):
                XCTFail("Should fail here.")
                
            case .failure(let error):
                XCTAssertTrue( error is CoreSDKError )
                
                let netbankingError   = error as! CoreSDKError
                XCTAssertTrue(netbankingError.code == 404)
                
                if let errorInfo   = netbankingError.serverErrorInfo {
                    XCTAssertEqual( (errorInfo ["transactionId"] as! String), "1318193189")
                    
                    let errorDetail = (errorInfo ["errors"] as! [[String:String]])[0] as [String:String]
                    XCTAssertEqual( errorDetail ["error"], "ID_NOT_FOUND")
                    
                    expectation.fulfill()
                }
                else {
                    XCTFail("No server error info!")
                }
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
}
