//
//  CardActionsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Issue various actions on a single card.
 */
//==============================================================================
public class CardActionsResource: NetbankingResource, UpdateEnabled
{
    /**
     * Issues various actions on a single card
     */
    //--------------------------------------------------------------------------
    public func update(_ request : CardActionRequest, callback: @escaping (_ result:CoreResult<CardActionResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
    
}
