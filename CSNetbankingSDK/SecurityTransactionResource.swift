//
//  SecurityTransactionResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class SecurityTransactionResource: NetbankingInstanceResource, UpdateEnabled
{
    /**
     * Allows to add or change a client's personal note and mark/star the transaction 
     * as favorite/important for one specific transaction on selected product.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : SecurityTransactionRequest, callback: @escaping (_ result:CoreResult<SecurityTransactionResponse>)->Void)
    {
        request.id = self.id as? String
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
