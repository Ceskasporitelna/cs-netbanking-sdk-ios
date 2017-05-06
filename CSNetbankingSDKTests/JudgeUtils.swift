//
//  JudgeUtils.swift
//  CSTransparentAcc
//
//  Created by Marty on 25/01/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

//==============================================================================
class Judge
{
    static let JudgeSessionHeaderName       = "x-judge-session";
    static let JudgeCaseHeaderName          = "x-judge-case";
    static let BaseURL                      = "http://csas-judge.herokuapp.com";
    
    //--------------------------------------------------------------------------
    static func startNewSession() -> JudgeSession
    {
        let sessionId = NSUUID().uuidString;
        WebServiceClient.globalHeaders[Judge.JudgeSessionHeaderName] = sessionId;
        let session = JudgeSession(sessionId: sessionId);
        return session;
    }
}

//==============================================================================
class JudgeSession
{
    let sessionId:                  String
    let nextCaseClient:             WebServiceClient
    let lastCaseClient:             WebServiceClient
    private var currentExpectation: XCTestExpectation?
    
    //--------------------------------------------------------------------------
    init(sessionId : String)
    {
        self.sessionId      = sessionId
        self.nextCaseClient = WebServiceClient(
            configuration: WebServicesClientConfiguration(
                endPoint: "\(Judge.BaseURL)/judge/nextCase",
                apiKey: nil
            ))
        self.lastCaseClient = WebServiceClient(
            configuration: WebServicesClientConfiguration(
                endPoint: "\(Judge.BaseURL)/judge/lastCase/verdict",
                apiKey: nil
        ))
    }
    
    //--------------------------------------------------------------------------
    func setNextCase(caseId:String, xcTestCase : XCTestCase)
    {
        self.nextCaseClient.headers [Judge.JudgeCaseHeaderName]    = caseId;
        print("Preparing judge case \(caseId)");
        self.currentExpectation = xcTestCase.expectation(description: "Preparing judge case \(caseId)");
        
        self.nextCaseClient.post(JudgeRequestDTO()){ (result:ApiCallResult<JudgeResponseDTO>) in
            switch result {
            case .success:
                print("Test case: '\(caseId)' set")
                self.currentExpectation!.fulfill()
            case .failure:
                XCTAssertTrue( false, "Preparing of user registration failed." );
            }
        }
        //There is a longer timeout because Heroku dino needs some time to wind-up
        xcTestCase.waitForExpectations( timeout: 40.0, handler: { error in
            if ( error != nil ) {
                XCTFail("Expectation Failed with error: \(error)." );
            }
        })
    }
    
    //--------------------------------------------------------------------------
    func verifyLastTestCase( caseId: String, xcTestCase : XCTestCase, completion: ((Error?) -> Swift.Void))
    {
        self.lastCaseClient.headers [Judge.JudgeCaseHeaderName]    = caseId
        self.lastCaseClient.headers [Judge.JudgeSessionHeaderName] = self.sessionId
        
        self.currentExpectation = xcTestCase.expectation(description: "Checking verdict for judge case \(caseId)");
        var verifyError: Error? = nil
        
        self.lastCaseClient.callApi(nil, method: .GET){ (result:ApiCallResult<JudgeResponseDTO>) in
            switch result {
            case .success:
                self.currentExpectation!.fulfill()
                
            case .failure(let error, _):
                verifyError = error
            }
        }
        
        xcTestCase.waitForExpectations( timeout: 10.0)
        
        completion(verifyError)
    }
    
}

//==============================================================================
class JudgeRequestDTO : WebApiEntity
{
}

//==============================================================================
class JudgeResponseDTO : WebApiEntity
{
}
