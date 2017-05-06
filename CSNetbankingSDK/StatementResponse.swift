//
//  StatementResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 05/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class StatementResponse: WebApiEntity
{
    /**
     * Identifier of statement in BE system.
     */
    public internal(set) var id:                                       String!
    
    /**
     * Statement sequence number.
     */
    public internal(set) var number:                                   Int!
    
    /**
     * Timestamp of statement creation.
     */
    public internal(set) var statementDate:                            Date!
    
    /**
     * Periodicity of account statement creation. Possible values are: DAILY, WEEKLY, BI_WEEKLY, MONTHLY, QUARTERLY, HALFYEARLY, YEARLY, 10_YAERLY, OTHER
     */
    public internal(set) var periodicity:                              Periodicity!
    
    /**
     * Statement format. Possible value is PDF_A4
     */
    public internal(set) var format:                                   Format?
    
    /**
     * Language version of created statement. ISO 639-1 ENUM values: en, de, cs, sk, hr, sr, ro, hu, fr (fr is local specific)
     */
    public internal(set) var language:                                 Language!
    
    /**
     * Number of files for of the whole statement.
     */
    public internal(set) var czFileTotalNumber:                        Int?
    
    /**
     * File number - to recognize order of the file if the statement is separated into several files.
     */
    public internal(set) var czFileOrderNumber:                        Int!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id                = String()
        self.number            = Int()
        self.statementDate     = Date()
        self.periodicity       = .other(value: "")
        self.language          = .other(value: "")
        self.czFileOrderNumber = Int()

    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                      <- map["id"]
        self.number                  <- map["number"]
        self.periodicity             <- (map["periodicity"], Periodicity.transform())
        self.statementDate           <- (map["statementDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.format                  <- (map["format"], Format.transform())
        self.language                <- (map["language"], Language.transform())
        self.czFileTotalNumber       <- map["cz-fileTotalNumber"]
        self.czFileOrderNumber       <- map["cz-fileOrderNumber"]
        
        super.mapping( map )
    }
}
