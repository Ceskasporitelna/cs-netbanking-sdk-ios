//
//  PluginsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PluginsResource: NetbankingResource, OptionalPaginatedListEnabled, HasInstanceResource
{
    /**
     * List of plugins for current user.
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: ListParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<PluginResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "plugins", parameters: parameters?.toDictionary(nil), transform: nil, callback: callback)
    }
    
    /**
     * Get resource for template with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> PluginResource
    {
        return PluginResource(id: id, path: self.path, client: self.client);
    }
}
