//
//  AccountsResource.swift
//  CSNetbankingSDK
//
//  Created by Marty on 07/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * List all accounts and get individual account instance resource
 */
//==============================================================================
public class AccountsResource: NetbankingResource, HasInstanceResource, OptionalPaginatedListEnabled
{
    /**
     * List all accounts
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: AccountsParameters? =  nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<MainAccountResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "accounts", parameters: parameters?.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Get the detail of the account with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> AccountResource
    {
        return AccountResource(id: id, path: self.path, client: self.client);
    }
    
}
