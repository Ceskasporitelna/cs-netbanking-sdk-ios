//
//  AccountSubAccountsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get individual SubAccount resource
 */
//==============================================================================
public class AccountSubAccountsResource: NetbankingResource, HasInstanceResource
{
    /**
     * Returns individual SubAccount resource with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> SubAccountResource
    {
        return SubAccountResource(id: id, path: self.path, client: self.client);
    }
}
