//
//  ChangeCardsLimitsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class ChangeCardsLimitsResponse: WebApiEntity, Signable
{
    /**
     * Card's limits
     */
    public internal(set) var limits:                                   [CardLimitsResponse]?
    
    /**
     * Information about the confirmation
     */
    public internal(set) var confirmations:                            [Confirmation]?
    
    /**
     * Infomation about the signing
     */
    public internal(set) var signInfo:                                 SignInfo?
    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                                                SigningObject?
    
    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                                                String {
        return self.resource.path
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init();
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
        self.signInfo                         <- map["signInfo"]
        
        super.mapping( map )
    }
}
