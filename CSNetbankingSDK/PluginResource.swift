//
//  PluginResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PluginResource: NetbankingInstanceResource, UpdateEnabled
{
    /**
     * Activation and deactivation of the specific plugin. You can also change settlement account for given plugin and current user.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdatePluginRequest, callback: @escaping (_ result:CoreResult<SignablePluginResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }    
}
