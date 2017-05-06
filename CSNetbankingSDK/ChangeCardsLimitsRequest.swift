//
//  ChangeCardsLimitsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class ChangeCardsLimitsRequest: WebApiEntity
{
    /**
     * Card's limits. Optional.
     */
    public var limits:                                                 [CardLimitsRequest]?
    
    /**
     * Information about the confirmation. Optional
     */
    public var confirmations:                                          [Confirmation]?
    
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
        self.limits                           <- map["limits"]
        self.confirmations                    <- map["confirmations"]
        
        super.mapping( map )
    }
}
