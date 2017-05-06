//
//  PaymentDomesticResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 21/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PaymentDomesticResource: NetbankingInstanceResource, UpdateEnabled
{
    /**
     * Updates domestic payment and returns it in callback
     */
    //--------------------------------------------------------------------------
    public func update(_ request : FullDomesticPaymentUpdateRequest, callback: @escaping (_ result:CoreResult<DomesticPaymentResponse>) ->Void )
    {
        guard let idStr = self.id as? String else {
            assert(false, "id must be string here.")
            return
        }
        request.id = idStr

        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
