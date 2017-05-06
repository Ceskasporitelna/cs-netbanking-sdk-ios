//
//  CSNetbankingBundlesTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingBundlesTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testBundlesCreate()
    {
        self.judgeSession.setNextCase( caseId: "bundles.create", xcTestCase: self)
        
        let expectation                                   = self.expectation(description: "Response expectation")
        
        let request                                       = BundleCreateRequest()
        request.name                                      = "Bundles 6.10."
        
        var item                                          = BundleItem()
        item.id                                           = "161125181818261"
        item.signInfo                                     = SignInfo()
        item.signInfo?.state                              = "OPEN"
        item.signInfo?.signId                             = "62567b1991b086e5b6822bb814d505792e1bccdb9057e0a450ec628dc02fbbed"
        
        request.items                                     = []
        request.items?.append(item)
        
        item                                              = BundleItem()
        item.id                                           = "161125181840386"
        item.signInfo                                     = SignInfo()
        item.signInfo?.state                              = "OPEN"
        item.signInfo?.signId                             = "47a59e4bcf661d213ddbb11ad84b5f2f4aae99da47bc7d289d5dcccf0dfd7be9"
        
        request.items?.append(item)
        
        self.client.bundles.create(request) { result in
            switch (result) {
            case .success(let bundleResponse):
                XCTAssertEqual(bundleResponse.id, "161125181840315")
                XCTAssertEqual(bundleResponse.name, "Bundles 6.10.")
                
                XCTAssertEqual(bundleResponse.items?.count, 2)
                
                XCTAssertEqual(bundleResponse.items?[0].id, "161125181818261")
                XCTAssertEqual(bundleResponse.items?[0].signInfo?.state, "OPEN")
                XCTAssertEqual(bundleResponse.items?[0].signInfo?.signId, "62567b1991b086e5b6822bb814d505792e1bccdb9057e0a450ec628dc02fbbed")
                
                XCTAssertEqual(bundleResponse.items?[1].id, "161125181840386")
                XCTAssertEqual(bundleResponse.items?[1].signInfo?.state, "OPEN")
                XCTAssertEqual(bundleResponse.items?[1].signInfo?.signId, "47a59e4bcf661d213ddbb11ad84b5f2f4aae99da47bc7d289d5dcccf0dfd7be9")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
}
