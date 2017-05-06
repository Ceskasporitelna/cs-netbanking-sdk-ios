//
//  MobilePaymentSender.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 22/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class MobilePaymentSender: WebApiEntity
{
    /**
     * Account number with possible prefix. Format is "XXXXXX-NNNNNNNNNN" if prefix is not null or "000000". If prefix is not provided then format is "NNNNNNNNNN" without leading zeros.
     */
    public var number:                                   String!
    
    /**
     * Bank Code
     */
    public var bankCode:                                 String!
    
    /**
     * Code of the Country - 2 characters; mandatoryfor international orders.
     */
    public var countryCode:                              String?
    
    /**
     * IBAN
     */
    public var iban:                                     String!
    
    /**
     * BIC
     */
    public var bic:                                      String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.number   = String()
        self.bankCode = String()
        self.iban     = String()
        self.bic      = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.number                           <- map["number"]
        self.bankCode                         <- map["bankCode"]
        self.countryCode                      <- map["countryCode"]
        self.iban                             <- map["iban"]
        self.bic                              <- map["bic"]
        
        super.mapping( map )
    }
    
}
