//
//  BuildingsContractsServicesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class BuildingsContractsServicesResource: NetbankingResource, OptionalPaginatedListEnabled
{
    /**
     * Returns list of services which are connected or arranged for building saving product instance.
     */
    //--------------------------------------------------------------------------
    public func list(_ params: ListParameters?, callback: @escaping (_ result: CoreResult<PaginatedListResponse<ServiceResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "services", parameters: params?.toDictionary(nil), transform: nil, callback: callback)
    }
}
