//
//  SecuritiesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class SecuritiesResource: NetbankingResource, OptionalPaginatedListEnabled, HasInstanceResource
{
    /**
     * Returns list of securities accounts for current user. Securities account represents virtual account which holds securities titles and its shares (funds, bonds, etc.).
     */
    //--------------------------------------------------------------------------
    public func list(_ params: ListParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<SecurityResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "securitiesAccounts", parameters: params?.toDictionary(nil), transform: nil, callback: callback)
    }
    
    /**
     * Get resource of security with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> SecurityResource
    {
        return SecurityResource(id: id, path: self.path, client: self.client);
    }
}
