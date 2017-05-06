//
//  ServicesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class ServicesResource: NetbankingResource, OptionalPaginatedListEnabled
{
    /**
     * Returns possibly empty list of services for current user. This resource represents only services which are not bound to any product.
     */
    //--------------------------------------------------------------------------
    public func list(_ params: ListParameters?, callback: @escaping (_ result: CoreResult<PaginatedListResponse<ServiceResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "services", parameters: params?.toDictionary(nil), transform: nil, callback: callback)
    }
}
