//
//  BuildingsContractsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class BuildingsContractsResource: NetbankingResource, OptionalPaginatedListEnabled, HasInstanceResource
{
    /**
     * Resource represents list of building savings for current user. It contains building savings and loans from building savings as well.
     */
    //--------------------------------------------------------------------------
    public func list(_ params: ListParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<BuildingsContractResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"buildings", parameters: params?.toDictionary(nil), transform: nil, callback: callback )
    }
    
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> BuildingsContractResource
    {
        return BuildingsContractResource(id: id, path: self.path, client: self.client);
    }
}
