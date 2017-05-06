//
//  BundlesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class BundlesResource: NetbankingResource, CreateEnabled
{
    /**
     * Resource for creating the bundle. Bundle represents set of payment orders which can be signed
     * at once. Number of items in bundle is limited to 50 items.
     */
    //--------------------------------------------------------------------------
    public func create(_ request: BundleCreateRequest, callback: @escaping (_ result: CoreResult<BundleResponse>) -> Void)
    {
        ResourceUtils.CallCreate(self, payload: request, transform: nil, callback: callback)
    }
}
