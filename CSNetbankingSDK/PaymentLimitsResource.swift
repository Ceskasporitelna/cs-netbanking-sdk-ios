//
//  PaymentLimitsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get remaining amounts for payment orders
 */
//==============================================================================
public class PaymentLimitsResource: NetbankingResource, ListEnabled
{
    /**
     * List all limits for payment orders
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<PaymentLimitResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "remainingLimits", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
