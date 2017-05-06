//
//  CSNetbankingMessagesTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingMessagesTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testMessagesList()
    {
        self.judgeSession.setNextCase( caseId: "messages.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.messages.list() { result in
            switch (result) {
            case .success(let messagesList):
                let messages: [MessageResponse] = messagesList.items
                
                XCTAssertEqual(messages.count, 1)
                XCTAssertEqual(messages[0].id, "134625")
                XCTAssertEqual(messages[0].from, "WCM")
                XCTAssertEqual(messages[0].subject, "test attach")
                
                XCTAssertEqual(messages[0].date, self.dateTimeFormatter.date(from: "2016-04-08T09:20:32+02:00"))
                
                XCTAssertEqual(messages[0].attachments.count, 1)
                XCTAssertEqual(messages[0].attachments[0].id, "palec.png")
                XCTAssertEqual(messages[0].attachments[0].fileName, "palec.png")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testMessagesPagination()
    {
        self.judgeSession.setNextCase( caseId: "messages.pagination", xcTestCase: self)
        
        var expectation = self.expectation(description: "Response expectation")
        var params      = MessagesParameters(pagination: Pagination(pageNumber: 0, pageSize: 1), sort: nil)
        
        self.client.messages.list(params) { result in
            switch (result) {
            case .success(let messagesList):
                let paginationTest = self.checkPagination(pagination: messagesList.pagination, pageNumber: 0, pageCount: 5, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let messages: [MessageResponse] = messagesList.items
                
                XCTAssertEqual(messages.count, 1)
                XCTAssertEqual(messages[0].id, "134625")
                XCTAssertEqual(messages[0].from, "WCM")
                XCTAssertEqual(messages[0].subject, "test attach")
                
                XCTAssertEqual(messages[0].date, self.dateTimeFormatter.date(from: "2016-04-08T09:20:32+02:00"))
                
                XCTAssertEqual(messages[0].attachments.count, 1)
                XCTAssertEqual(messages[0].attachments[0].id, "jellyfishgrg.jpg")
                XCTAssertEqual(messages[0].attachments[0].fileName, "jellyfishgrg.jpg")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = MessagesParameters(pagination: Pagination(pageNumber: 1, pageSize: 1), sort: nil)
        
        self.client.messages.list(params) { result in
            switch (result) {
            case .success(let messagesList):
                let paginationTest = self.checkPagination(pagination: messagesList.pagination, pageNumber: 1, pageCount: 5, pageSize: 1, nextPageNumber: 2)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let messages: [MessageResponse] = messagesList.items
                
                XCTAssertEqual(messages.count, 1)
                XCTAssertEqual(messages[0].id, "278583")
                XCTAssertEqual(messages[0].from, "WCM")
                XCTAssertEqual(messages[0].subject, "Pozor - evidence dluhu na Vašem úvěrovém případně osobním účtu! Hrozí naúčtování poplatků")
                
                XCTAssertEqual(messages[0].date, self.dateTimeFormatter.date(from: "2016-04-27T08:20:32+02:00"))
                XCTAssertEqual(messages[0].body, "<html>\n <head></head>\n <body>\n  <p>Vážená paní/Vážený pane,</p>\n  <p>dovolujeme si Váš upozornit, že u Vás evidujeme dlužnou částku po splatnosti nebo nepovolený záporný zůstatek na osobním účtu. Uhraďte, prosím, tuto dlužnou částku co nejdříve. Zastavíte si tak navyšování úroku z prodlení.</p>\n  <p>Pokud byla dlužná částka již uhrazena, děkujeme Vám a této naší zprávy&nbsp;si nevšímejte.</p>\n  <p>.....................</p>\n  <p>Česká spořitelna</p> \n </body>\n</html>")
                
                XCTAssertEqual(messages[0].flags?.count, 1)
                XCTAssertEqual(messages[0].flags?[0], "mandatory")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = MessagesParameters(pagination: Pagination(pageNumber: 0, pageSize: 1), sort: nil)
        
        self.client.messages.list(params) { result in
            switch (result) {
            case .success(let messagesList):
                let paginationTest = self.checkPagination(pagination: messagesList.pagination, pageNumber: 0, pageCount: 5, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let messages: [MessageResponse] = messagesList.items
                
                XCTAssertEqual(messages.count, 1)
                XCTAssertEqual(messages[0].id, "134625")
                XCTAssertEqual(messages[0].from, "WCM")
                XCTAssertEqual(messages[0].subject, "test attach")
                
                XCTAssertEqual(messages[0].date, self.dateTimeFormatter.date(from: "2016-04-08T09:20:32+02:00"))
                
                XCTAssertEqual(messages[0].attachments.count, 1)
                XCTAssertEqual(messages[0].attachments[0].id, "jellyfishgrg.jpg")
                XCTAssertEqual(messages[0].attachments[0].fileName, "jellyfishgrg.jpg")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testMessagesWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "messages.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.messages.withId("134625" as AnyObject).get() { result in
            switch (result) {
            case .success(let message):
                XCTAssertEqual(message.id, "134625")
                XCTAssertEqual(message.from, "WCM")
                XCTAssertEqual(message.subject, "test attach")
                
                XCTAssertEqual(message.date, self.dateTimeFormatter.date(from: "2016-04-08T09:20:32+02:00"))
                
                XCTAssertEqual(message.attachments.count, 1)
                XCTAssertEqual(message.attachments[0].id, "jellyfishgrg.jpg")
                XCTAssertEqual(message.attachments[0].fileName, "jellyfishgrg.jpg")

                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testMessagesWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "messages.withId.update", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let updateMessageRequest  = UpdateMessageRequest()
        updateMessageRequest.read = true
        
        self.client.messages.withId("134625").update(updateMessageRequest) { result in
            switch (result) {
            case .success(_):
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testMessagesWithIdDelete()
    {
        self.judgeSession.setNextCase( caseId: "messages.withId.delete", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        
        self.client.messages.withId("134625").delete() { result in
            switch (result) {
            case .success(_):
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testMessagesWithIdAttachmentsWithIdDownload()
    {
        let caseId                = "messages.withId.attachments.withId.download"
        self.judgeSession.setNextCase( caseId: caseId, xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        
        var verifyResult          = false
        self.client.messages.withId("1421721").attachments.withId("palec.png").download() { result in
            switch (result) {
            case .success(let downloadedFileName):
                XCTAssertTrue(downloadedFileName.contains("test-file.png"))
                expectation.fulfill()
                
            case .failure:
                verifyResult = true
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        if verifyResult {
            self.judgeSession.verifyLastTestCase(caseId: caseId, xcTestCase: self) { error in
                if let coreError = error as? CoreSDKError, let info = coreError.serverErrorInfo {
                    XCTAssertTrue( false, "Error: \(info)" )
                }
                else {
                    XCTAssertTrue( false, "Error: \(String(describing: error))" );
                }
            }
        }
    }
    
    
    //--------------------------------------------------------------------------
    func testMessagesMandatoryList()
    {
        self.judgeSession.setNextCase( caseId: "messages.mandatory.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.messages.mandatory.list() { result in
            switch (result) {
            case .success(let messagesList):
                let messages: [MessageResponse] = messagesList.items
                
                XCTAssertEqual(messages[0].id, "278583")
                XCTAssertEqual(messages[0].from, "WCM")
                XCTAssertEqual(messages[0].subject, "Pozor - evidence dluhu na Vašem úvěrovém případně osobním účtu! Hrozí naúčtování poplatků")
                
                XCTAssertEqual(messages[0].date, self.dateTimeFormatter.date(from: "2016-04-27T08:20:32+02:00"))
                XCTAssertEqual(messages[0].body, "<html>\n <head></head>\n <body>\n  <p>Vážená paní/Vážený pane,</p>\n  <p>dovolujeme si Váš upozornit, že u Vás evidujeme dlužnou částku po splatnosti nebo nepovolený záporný zůstatek na osobním účtu. Uhraďte, prosím, tuto dlužnou částku co nejdříve. Zastavíte si tak navyšování úroku z prodlení.</p>\n  <p>Pokud byla dlužná částka již uhrazena, děkujeme Vám a této naší zprávy&nbsp;si nevšímejte.</p>\n  <p>.....................</p>\n  <p>Česká spořitelna</p> \n </body>\n</html>")
                
                XCTAssertEqual(messages[0].flags?.count, 1)
                XCTAssertEqual(messages[0].flags?[0], "mandatory")

                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

}
