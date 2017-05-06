//
//  CardLimitsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class CardLimitsResponse: WebApiEntity
{
    /**
     * Limit type defines ATM, POS, internet/eCommerce, total limits. Possible Values: ATM, POS, INTERNET
     */
    public internal (set) var limitType:                                 CardLimitType!
    
    /**
     * Bank limit's period in days defined for limit type (default daily - 1D). Possible Values: 1D, 2D, 3D, 5D, 7D, 10D, 15D, 30D
     */
    public internal (set) var limitPeriod:                               CardLimitPeriod!
    
    /**
     * Current limit amount valid for limit's type and period
     */
    public internal (set) var limit:                                     Amount?
    
    /**
     * Temporary limit amount valid for limit's type and period
     */
    public internal (set) var temporaryLimit:                            Amount?
    
    /**
     * Temporary limit expiration date for limit's type and period. Field is mandatory if temporatyLimits are changed by PUT call. It is possible to set temporaryLimitExpiration up to 120 hours to the future.
     */
    public internal (set) var temporaryLimitExpiration:                  Date?
    
    /**
     * Maximum limit amount for card defined by bank valid for limit's type and period.
     */
    public internal (set) var bankLimit:                                 Amount?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.limitType   = .other(value: "")
        self.limitPeriod = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.limitType                           <- (map["limitType"], CardLimitType.transform())
        self.limitPeriod                         <- (map["limitPeriod"], CardLimitPeriod.transform())
        self.limit                               <- map["limit"]
        self.temporaryLimit                      <- map["temporaryLimit"]
        self.temporaryLimitExpiration            <- (map["temporaryLimitExpiration"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.bankLimit                           <- map["bankLimit"]
        
        super.mapping( map )
    }
}

