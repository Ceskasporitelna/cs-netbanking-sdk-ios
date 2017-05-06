//
//  DownloadStatementsParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class DownloadStatementsParameters: Parameters
{
    
    /**
     * Format of statements file. Example: PDF_A4. Default: PDF_A4.
     */
    public var format:  Format? = Format.pdfA4
    
    /**
     * Statement identifier.
     */
    public var statementId: String?
    
    //--------------------------------------------------------------------------
    public init( format: Format?, statementId: String )
    {
        super.init()
        if let fmt = format {
            self.format = fmt
        }
        self.statementId = statementId
    }
    
    //--------------------------------------------------------------------------
    convenience public init( statementId: String )
    {
        self.init( format: nil, statementId: statementId )
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params = super.toDictionary(existingParams)
        if let fmt = self.format {
            params ["format"] = fmt.value as AnyObject?
        }
        if let stmtId = self.statementId {
            params ["statementId"] = stmtId as AnyObject?
        }
        return params
    }
}
