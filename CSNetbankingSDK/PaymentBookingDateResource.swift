//
//  PaymentBookingDateResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 11/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get currently available booking date
 */
//==============================================================================
public class PaymentBookingDateResource: NetbankingResource, UpdateEnabled
{
    /**
     * Returns current available booking date based on the provided account and optional payment order category parameters
     */
    //--------------------------------------------------------------------------
    public func update(_ request : PaymentBookingDateRequest, callback: @escaping (_ result:CoreResult<PaymentBookingDateResponse>) ->Void )
    {
        guard let accountId = request.accountId else {
            assert(false, "request.accountId must not be nil!")
            return
        }
        
        let queryPath      = "\(self.path)?accountId=\(accountId)"
        let updateResource = PaymentBookingDateResource(path: queryPath, client: self.client)
        request.accountId  = nil
        
        ResourceUtils.CallUpdate(updateResource, payload: request, transform: nil, callback: callback)
    }
}
