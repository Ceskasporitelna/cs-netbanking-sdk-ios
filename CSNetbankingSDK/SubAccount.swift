//
//  SubAccount.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Sub account provides information about sub account.
 */
//==============================================================================
public class SubAccount: Account
{
    /**
     * In case of interest rate bands this is the interest rate which applies to value over limit.
     */
    public internal(set) var czInterestRateOverLimit: TCurrency?
    
    /**
     * Limit amount for basic credit interest rate used for some saving accounts.
     */
    public internal(set) var czInterestRateLimit:     Amount?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.czInterestRateOverLimit <- map["cz-interestRateOverLimit"]
        self.czInterestRateLimit     <- map["cz-interestRateLimit"]
        super.mapping( map )
    }
}
