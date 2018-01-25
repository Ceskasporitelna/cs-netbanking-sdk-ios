//
//  AccountTransactionsHistoryResource.swift
//  CSNetbankingSDK
//
//  Created by Jan Hauser on 23/01/2018.
//  Copyright © 2018 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the account's services
 */
public class AccountTransactionsHistoryResource: NetbankingResource, PaginatedListEnabled
{
    /**
     * Fetches the transactions history and returns them in a promise
     */
    public func list(_ parameters: AccountTransactionsHistoryParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<AccountTransaction>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"transactions", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
}
