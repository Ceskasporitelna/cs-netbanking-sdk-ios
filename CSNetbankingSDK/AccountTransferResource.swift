//
//  AccountTransferResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Revolve a loan
 */
//==============================================================================
public class AccountTransferResource: NetbankingResource, UpdateEnabled
{
    /**
     * Revolves the loan. Currently only REVOLVING_LOAN subtype is supported.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : AccountTransferRequest, callback: @escaping (_ result:CoreResult<TransferResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}

