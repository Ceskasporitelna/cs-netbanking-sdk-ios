//
//  PromotionsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PromotionsResource: NetbankingResource, ListEnabled, CreateEnabled
{
    /**
     * Returns promotion list for the current user
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<PromotionResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "promotions", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Hide specified promotion
     */
    //--------------------------------------------------------------------------
    public func create(_ request: CreatePromotionRequest,callback: @escaping (_ result: CoreResult<CreatePromotionResponse>) -> Void )
    {
        let customResource = PromotionsResource(path: self.path.replacingOccurrences(of: "/promotions", with: "/actions"), client: self.client)
        ResourceUtils.CallCreate(customResource, payload: request, transform: nil, callback: callback)
    }

}
