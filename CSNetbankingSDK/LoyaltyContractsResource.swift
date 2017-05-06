//
//  LoyaltyContractsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class LoyaltyContractsResource: NetbankingResource, GetEnabled
{
    /**
     * Get data about iBod account of the current client.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<LoyaltyResponse>) -> Void)
    {
        ResourceUtils.CallGet(self, pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
