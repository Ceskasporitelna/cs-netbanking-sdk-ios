//
//  OrdersResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about payments orders
 */
//==============================================================================
public class OrdersResource: NetbankingResource
{
    /**
     * Returns PaymentsResource for listing, deleting and accessing other information about payments
     */
    //--------------------------------------------------------------------------
    public var payments: PaymentsResource {
        return PaymentsResource( path: self.path + "/payments", client: self.client )
    }
}
