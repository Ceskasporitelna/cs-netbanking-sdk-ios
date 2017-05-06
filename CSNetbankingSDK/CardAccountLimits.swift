//
//  CardAccountLimits.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class CardAccountLimits: WebApiEntity
{
    /**
     * Daily ATM limit on credit line. Daily ATM limit for all credit cards issued to mainAccount.
     */
    public internal(set) var limitATM:                                  Amount?
    
    /**
     * Daily POS limit on credit line. Daily POS limit for all credit cards issued to mainAccount.
     */
    public internal(set) var limitPOS:                                  Amount?
    
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
        self.limitATM                         <- map["limitATM"]
        self.limitPOS                         <- map["limitPOS"]
        
        super.mapping( map )
    }    
}
