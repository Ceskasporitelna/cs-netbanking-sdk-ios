//
//  CardsTransactionResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Add or change a client's personal note and mark/star the card transaction as favorite/important
 */
//==============================================================================
public class CardTransactionResource: NetbankingInstanceResource, UpdateEnabled
{
    /**
     * Adds, changes of marks transaction
     */
    //--------------------------------------------------------------------------
    public func update(_ request : AddNoteAndMarkTransactionRequest, callback: @escaping (_ result:CoreResult<AddNoteAndMarkCardTransactionResponse>) -> Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
