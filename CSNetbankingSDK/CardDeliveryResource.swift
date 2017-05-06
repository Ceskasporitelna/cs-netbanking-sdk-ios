//
//  CardsDeliveryResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get current delivery settings
 */
//==============================================================================
public class CardDeliveryResource: NetbankingResource, GetEnabled, UpdateEnabled
{
    /**
     * Returns current delivery settings
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<CardDeliveryResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Change current delivery settings. Method not working yet.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : ChangeCardDeliverySettingsRequest, callback: @escaping (_ result:CoreResult<ChangeCardDeliverySettingsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}

