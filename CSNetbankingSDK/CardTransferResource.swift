//
//  CardTransferResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 06/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


/**
 * Resource for paying up credit card debt
 */
//==============================================================================
public class CardTransferResource: NetbankingResource, UpdateEnabled
{
    /**
     * Pays up the credit card debt and returns sign info
     */
    //--------------------------------------------------------------------------
    public func update(_ request : PayUpCreditCardRequest, callback: @escaping (_ result:CoreResult<PayUpCreditCardResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }

}
