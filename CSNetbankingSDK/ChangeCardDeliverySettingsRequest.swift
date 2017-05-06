//
//  ChangeCardDeliverySettingsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class ChangeCardDeliverySettingsRequest: WebApiEntity
{
    /**
     * Indicates how a client receives their card and pin. Possible values: BRANCH, HOME, OTHER_BRANCH, ADDRESS_ABROAD. Mandatory.
     */
    public var cardDeliveryMode:                                      CardDeliveryMode?
    
    /**
     * ID of a branch where card should be sent. Optional.
     */
    public var branchId:                                              String?
    
    /**
     * Address where card should be sent. Optional.
     */
    public var address:                                               Address?
    
    /**
     * Phone number of the client. Optional.
     */
    public var deliveryPhone:                                         String?
    
    /**
     * Information about the confirmation. Mandatory.
     */
    public var confirmations:                                        [Confirmation]?
    
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
        self.cardDeliveryMode                    <- (map["cardDeliveryMode"], CardDeliveryMode.transform())
        self.branchId                            <- map["branchId"]
        self.address                             <- map["address"]
        self.deliveryPhone                       <- map["deliveryPhone"]
        self.confirmations                       <- map["confirmations"]
        
        super.mapping( map )
    }
}
