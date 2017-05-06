//
//  PensionsContractsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PensionsContractsResource: NetbankingResource, OptionalPaginatedListEnabled, HasInstanceResource
{
    /**
     * Returns list of pension products which belongs to current user. 
     * This includes Pension Savings, Supplementary Pension Insurance and Supplementary Pension Savings.
     */
    //--------------------------------------------------------------------------
    public func list(_ params: ListParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<PensionResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "pensions", parameters: params?.toDictionary(nil), transform: nil, callback: callback)
    }
    
    /**
     * Get the resource of pension contract with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> PensionsContractResource
    {
        return PensionsContractResource(id: id, path: self.path, client: self.client)
    }
}
