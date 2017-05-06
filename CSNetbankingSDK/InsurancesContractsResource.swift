//
//  InsurancesContractsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractsResource: NetbankingResource, OptionalPaginatedListEnabled, HasInstanceResource
{
    /**
     * Returns list of life insurances for current user.
     */
    //--------------------------------------------------------------------------
    public func list(_ params: ListParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<InsuranceResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "insurances", parameters: params?.toDictionary(nil), transform: nil, callback: callback)
    }
    
    /**
     * Get the resource of insurance contracts with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> InsurancesContractResource
    {
        return InsurancesContractResource(id: id, path: self.customPath, client: self.client)
    }
}
