//
//  CardDeliveryResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class CardDeliveryResponse: WebApiEntity
{
    /**
     * Type of the delivery which should be set for this card. Possible values are BRANCH, OTHER_BRANCH, HOME, ADDRESS_ABROAD.
     */
    public internal(set) var cardDeliveryMode:                         CardDeliveryMode!
    
    /**
     * Identification of the branch where card will be ready to takeover.
     */
    public internal(set) var branchId:                                 String!
    
    /**
     * Address where card should be sent.
     */
    public internal(set) var address:                                  Address!
    
    /**
     * Information about the confirmation
     */
    public internal(set) var confirmations:                            [Confirmation]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.cardDeliveryMode = .other(value: "")
        self.branchId         = String()
        self.address          = Address()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.cardDeliveryMode                    <- (map["cardDeliveryMode"], CardDeliveryMode.transform())
        self.branchId                            <- map["branchId"]
        self.address                             <- map["address"]
        self.confirmations                       <- map["confirmations"]
        
        super.mapping( map )
    }

}

