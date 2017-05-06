//
//  PaymentsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * List payments, get individual payment and other resources
 */
//==============================================================================
public class PaymentsResource: NetbankingResource, OptionalPaginatedListEnabled
{
    /**
     * Get individual payment with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> PaymentResource
    {
        return PaymentResource(id: id, path: self.path, client: self.client);
    }
    
    /**
     * Get currently available booking date
     */
    //--------------------------------------------------------------------------
    public var bookingDate: PaymentBookingDateResource {
        return PaymentBookingDateResource( path: self.path + "/bookingdate", client: self.client )
    }
    
    /**
     * Create domestic payment order
     */
    //--------------------------------------------------------------------------
    public var domestic: PaymentsDomesticResource {
        return PaymentsDomesticResource( path: self.path + "/domestic", client: self.client )
    }
    
    /**
     * Recharging the credit available on prepaid cards provided by Vodafone, T-Mobile or O2.
     */
    //--------------------------------------------------------------------------
    public var mobile: PaymentMobileResource {
        return PaymentMobileResource( path: self.customPath + "/mobile", client: self.client )
    }

    //--------------------------------------------------------------------------
    public var limits: PaymentLimitsResource {
        return PaymentLimitsResource( path: self.path + "/limits", client: self.client )
    }
    
    /**
     * Paginated and/or orderred list of all payments
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: PaymentsParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<PaymentResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"order", parameters: parameters?.toDictionary(nil), transform: nil, callback: callback )
    }
}
