//
//  Amount.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Amount provides information about amount used in several classes.
 */

//==============================================================================
public class Amount: WebApiEntity
{
    /**
     * Value of an amount. Number without decimal part.
     */
    public var value:                   Int64!
    
    /**
     * Precision of the amount. How many digits from value fields should be considered to be decimal.
     */
    public var precision:               Int!
    
    /**
     * Currency of the amount.
     */
    public var currency:                String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.value     = Int64()
        self.precision = Int()
        self.currency  = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.value                  <- (map["value"], TransformOf<Int64, NSNumber>(fromJSON: { $0?.int64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.precision              <- map["precision"]
        self.currency               <- map["currency"]
        
        super.mapping( map )
    }
}
