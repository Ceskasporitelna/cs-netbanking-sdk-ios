//
//  PhoneNumberResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PhoneNumberResource: NetbankingInstanceResource, UpdateEnabled, DeleteEnabled
{
    /**
     * Updates phone number
     */
    //--------------------------------------------------------------------------
    public func update(_ request : PhoneNumberUpdateRequest, callback: @escaping (_ result:CoreResult<PhoneNumberResponse>)->Void)
    {
        guard let idString = self.id as? String else {
            assert(false, "self.id must be String!")
            return
        }
        request.id = idString
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
    
    /**
     * Deletes phone number
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<NetbankingEmptyResponse>)->Void)
    {
        ResourceUtils.CallDelete(self, pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
