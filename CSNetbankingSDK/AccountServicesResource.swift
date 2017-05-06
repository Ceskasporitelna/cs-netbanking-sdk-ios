//
//  AccountServiceResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the account's services
 */
//==============================================================================
public class AccountServicesResource: NetbankingResource, PaginatedListEnabled
{
    /**
     * Fetches the services and returns them in a promise
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: ListParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<ServiceResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"services", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
}
