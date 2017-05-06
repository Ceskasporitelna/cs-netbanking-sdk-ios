//
//  AccountBalanceResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the account's balance
 */
//==============================================================================
public class AccountBalanceResource: NetbankingResource, GetEnabled
{
    /**
     * Fetches the balance and returns them in a callback.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<AccountBalanceResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback);
    }
}
