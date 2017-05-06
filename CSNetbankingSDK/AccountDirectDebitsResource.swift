//
//  AccountDirectDebitsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 01/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountDirectDebitsResource: NetbankingResource, PaginatedListEnabled, CreateEnabled, HasInstanceResource
{
    /**
     * Resource Direct Debit List represents collection of all direct debit approvals entered by user for the specified user
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: DirectDebitsParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<DirectDebitResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"directDebits", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Get the resource of direct debit with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> AccountDirectDebitResource
    {
        return AccountDirectDebitResource( id: id, path: self.path, client: self.client);
    }
    
    /**
     * Resource for creating (or allowing) direct debit on certain account. Once signed it can be used by receiver party.
     */
    //--------------------------------------------------------------------------
    public func create(_ request: DirectDebitRequest, callback: @escaping (_ result: CoreResult<SignableDirectDebitResponse>) -> Void)
    {
        ResourceUtils.CallCreate(self, payload: request, transform: nil, callback: callback)
    }

    
}
