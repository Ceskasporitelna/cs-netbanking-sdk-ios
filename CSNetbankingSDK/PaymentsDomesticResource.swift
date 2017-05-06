//
//  PaymentsDomesticResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 21/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//


import CSCoreSDK

//==============================================================================
public class PaymentsDomesticResource: NetbankingResource, CreateEnabled, HasInstanceResource
{
    /**
     * Creates domestic payment order and returns it in callback
     */
    //--------------------------------------------------------------------------
    public func create(_ request : DomesticPaymentCreateRequest, callback: @escaping (_ result:CoreResult<DomesticPaymentResponse>) ->Void )
    {
        ResourceUtils.CallCreate(self, payload: request, transform: nil, callback: callback)
    }
    
    /**
     * Returns PaymentDomesticResource resource for updating domestic payment
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> PaymentDomesticResource
    {
        return PaymentDomesticResource(id: id as AnyObject, path: self.path, client: self.client)
    }
}
