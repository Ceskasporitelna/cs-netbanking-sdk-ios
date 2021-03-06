//
//  ContractsTransactionResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class ContractsTransactionResource: NetbankingInstanceResource, UpdateEnabled
{
    /**
     * Allows to add or change a client's personal note and mark/star the 
     * transaction as favorite/important for one specific transaction on selected product.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : SecurityTransactionRequest, callback: @escaping (_ result:CoreResult<SecurityTransactionResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
