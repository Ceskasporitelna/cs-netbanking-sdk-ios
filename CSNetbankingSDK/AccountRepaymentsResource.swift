//
//  AccountRepaymentsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the account's repayments
 */
//==============================================================================
public class AccountRepaymentsResource: NetbankingResource, ListEnabled 
{
    /**
     * Fetches the repayments and returns them in a promise
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<RepaymentResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "repayments", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
