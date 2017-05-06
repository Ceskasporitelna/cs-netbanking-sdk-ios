//
//  PaymentResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Individual Payment order resource
 */
//==============================================================================
public class PaymentResource: NetbankingInstanceResource, GetEnabled, DeleteEnabled
{
    /**
     * Get detail of the payment
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<PaymentResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback);
    }
    
    /**
     * Remove payment
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<NetbankingEmptyResponse>)->Void)
    {
        ResourceUtils.CallDelete(self, pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
