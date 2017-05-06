//
//  CardAccountsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 11/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class CardAccountsResource: NetbankingResource, HasInstanceResource
{
    /**
     * Returns CardAccountResource for an account with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> CardAccountResource
    {
        return CardAccountResource(id: id, path: self.path, client: self.client)
    }
}
