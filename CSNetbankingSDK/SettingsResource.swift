//
//  SettingsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class SettingsResource: NetbankingResource, GetEnabled, UpdateEnabled
{
    /**
     * Returns basic user settings.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<SettingsResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Change user settings. Currently only language can be changed by this endpoint.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : SettingsRequest, callback: @escaping (_ result:CoreResult<SignableSettingsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
