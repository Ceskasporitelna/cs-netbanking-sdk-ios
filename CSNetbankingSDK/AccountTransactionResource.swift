//
//  AccountTransactionResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Allows to add or change a client's personal transaction note and mark the transaction as favorite/important for one specific transaction on selected account.
 */
//==============================================================================
public class AccountTransactionResource: NetbankingInstanceResource, UpdateEnabled
{
    /**
     * Adds, changes of marks transaction
     */
    //--------------------------------------------------------------------------
    public func update(_ request : AddNoteAndMarkTransactionRequest, callback: @escaping (_ result:CoreResult<AddNoteAndMarkTransactionResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
