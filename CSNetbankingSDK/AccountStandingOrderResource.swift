//
//  AccountStandingOrderResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 02/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountStandingOrderResource: NetbankingInstanceResource, GetEnabled, DeleteEnabled
{
    /**
     * Returns detail of actual standing/sweep orders identified by its number.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<StandingOrderResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback);
    }

    /**
     * This call removes existing standing/sweep order. No more payments for the order are executed after the change has been signed.
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<SignableStandingOrderResponse>)->Void)
    {
        ResourceUtils.CallDelete(self, pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
