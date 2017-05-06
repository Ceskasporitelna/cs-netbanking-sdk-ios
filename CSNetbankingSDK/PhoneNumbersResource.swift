//
//  PhoneNumbersResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PhoneNumbersResource: NetbankingResource, ListEnabled, HasInstanceResource, CreateEnabled
{
    /**
     * Returns list of phone numbers
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<PhoneNumberResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "phoneNumbers", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Get resource of security with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> PhoneNumberResource
    {
        return PhoneNumberResource(id: id, path: self.path, client: self.client);
    }
    
    /**
     * Creates new phone number
     */
    //--------------------------------------------------------------------------
    public func create(_ request: PhoneNumberCreateRequest,callback: @escaping (_ result: CoreResult<PhoneNumberResponse>) -> Void )
    {
        ResourceUtils.CallCreate(self, payload: request, transform: nil, callback: callback)
    }
}
