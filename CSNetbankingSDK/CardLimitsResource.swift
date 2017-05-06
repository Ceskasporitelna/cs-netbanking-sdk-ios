//
//  CardsLimitsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


/**
 * Get information about different limits
 */
//==============================================================================
public class CardLimitsResource: NetbankingResource, ListEnabled, UpdateEnabled
{
    /**
     * List all limits
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<CardLimitsResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "limits", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Update individual limits
     */
    //--------------------------------------------------------------------------
    public func update(_ request : ChangeCardsLimitsRequest, callback: @escaping (_ result:CoreResult<ChangeCardsLimitsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }

}
