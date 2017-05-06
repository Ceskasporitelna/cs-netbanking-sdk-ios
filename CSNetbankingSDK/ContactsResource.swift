//
//  ContactsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class ContactsResource: NetbankingResource, ListEnabled, HasInstanceResource
{
    /**
     * Resource represents list of contact information for current user. It can contain addresses, phones and email addresses.
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<ContactResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "contacts", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Get the resource of contact with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> ContactResource
    {
        return ContactResource(id: id, path: self.path, client: self.client);
    }
}
