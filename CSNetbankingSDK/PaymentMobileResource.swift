//
//  PaymentsMobileResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 22/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Recharging the credit available on prepaid cards provided by Vodafone, T-Mobile or O2.
 */
//==============================================================================
public class PaymentMobileResource: NetbankingResource, CreateEnabled
{
    /**
     * Recharge the credit on prepaid card
     */
    //--------------------------------------------------------------------------
    public func create(_ request : MobilePaymentsRequest, callback: @escaping (_ result:CoreResult<MobilePaymentsResponse>) -> Void )
    {
        ResourceUtils.CallCreate(self, payload: request, transform: nil, callback: callback)
    }
}
