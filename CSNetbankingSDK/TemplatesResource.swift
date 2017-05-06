//
//  TemplatesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class TemplatesResource: NetbankingResource, OptionalPaginatedListEnabled, HasInstanceResource
{
    /**
     * Paginated list of payment templates for current user.
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: ListParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<TemplateResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "templates", parameters: parameters?.toDictionary(nil), transform: nil, callback: callback)
    }
    
    /**
     * Get resource for template with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> TemplateResource
    {
        return TemplateResource(id: id, path: self.path, client: self.client);
    }
}
