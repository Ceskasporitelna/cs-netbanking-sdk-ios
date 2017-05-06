//
//  ProfileResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the profile and past logins.
 */
//==============================================================================
public class ProfileResource: NetbankingResource, GetEnabled
{
    /**
     * Returns LastLoginsResource for listing past logins
     */
    //--------------------------------------------------------------------------
    public var lastLogins: LastLoginsResource {
        return (self.client as! NetbankingClient).logins
    }
    
    /**
     * Returns information about the profile
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<ProfileResponse>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
}
