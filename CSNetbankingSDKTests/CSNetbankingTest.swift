//
//  CSNetbankingTest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 31/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class NetbankingTestsAccessTokenProvider: AccessTokenProvider
{
    let token = "judge_access_token"
    
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
class CSNetbankingTest: XCTestCase
{
    var client:NetbankingClient!
    var judgeSession:JudgeSession!
    let dateFormatter     = DateFormatter()
    let dateTimeFormatter = DateFormatter()
    
    
    //--------------------------------------------------------------------------
    override func setUp()
    {
        super.setUp()
        
        let environment = Environment(apiContextBaseUrl: Judge.BaseURL + "/webapi", oAuth2ContextBaseUrl: "")
        let config      = WebApiConfiguration(webApiKey: "TEST_API_KEY", environment: environment, language: "cs-CZ", signingKey: nil)
        
        CoreSDK.sharedInstance
            .useWebApiKey(config.webApiKey)
            .useEnvironment(environment)
        
        self.judgeSession                 = Judge.startNewSession()
        self.client                       = NetbankingClient(config: config)
        self.client.accessTokenProvider   = NetbankingTestsAccessTokenProvider()//CoreSDK.sharedInstance.sharedContext
        
        self.dateFormatter.dateFormat     = "yyyy-MM-dd"
        self.dateTimeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    }
 
    //--------------------------------------------------------------------------
    override func tearDown()
    {
        super.tearDown()
    }
    
    //--------------------------------------------------------------------------
    func isValidPdfDocumentWithData( pdfData: Data? ) -> Bool
    {
        guard let data = pdfData, data.count >= 4 else {
            return false
        }
        
        let stringValue = String.init(data: data, encoding: String.Encoding.ascii)
        //return ( stringValue?.substring(to: (stringValue?.startIndex.advancedBy(4))!) == "%PDF" )
        return ( stringValue?.substring(to: (stringValue?.index((stringValue?.startIndex)!, offsetBy: 4))!) == "%PDF" )
    }
    
    //--------------------------------------------------------------------------
    func isValidPdfDocumentAtFilePath( pdfFileName: String ) -> Bool
    {
        let manager = FileManager()
        if ( manager.fileExists(atPath: pdfFileName) ) {
            do {
                let pdfData = try Data(contentsOf: URL(fileURLWithPath: pdfFileName))
                return self.isValidPdfDocumentWithData(pdfData: pdfData)
            }
            catch {}
        }
        return false
    }
    
    //--------------------------------------------------------------------------
    func checkDate( date: Date, reference: String) -> Bool
    {
        let components          = reference.components(separatedBy: "-")
        assert( components.count == 3, "Wrong reference date components: \(reference)")
        
        var referenceComponents   = DateComponents()
        referenceComponents.year  = Int(components [0])!
        referenceComponents.month = Int(components [1])!
        referenceComponents.day   = Int(components [2])!
        
        if let referenceDate = Calendar.current.date(from: referenceComponents) {
            return date == referenceDate
        }
        else {
            return false
        }
    }

    //--------------------------------------------------------------------------
    func checkPagination(pagination: ResponsePagination, pageNumber: UInt, pageCount: UInt, pageSize: UInt, nextPageNumber: UInt? = nil) -> (Bool, String)
    {
        var errorMessage = String()
        var result       = true
        
        if ( pagination.pageNumber != pageNumber ) {
            errorMessage += "actual pageNumber = \(pagination.pageNumber), expected = \(pageNumber) "
            result = false
        }
        
        if ( pagination.pageCount != pageCount ) {
            errorMessage += "actual pageCount = \(pagination.pageCount), expected = \(pageCount) "
            result = false
        }
        
        if ( pagination.pageSize != pageSize ) {
            errorMessage += "actual pageSize = \(pagination.pageSize), expected = \(pageSize) "
            result = false
        }
        
        if ( pagination.hasNextPage && pagination.nextPageNumber != nextPageNumber ) {
            errorMessage += "actual nextPageNumber = \(pagination.nextPageNumber!), expected = \(nextPageNumber!) "
            result = false
        }
        
        return ( result, errorMessage )
    }
}
