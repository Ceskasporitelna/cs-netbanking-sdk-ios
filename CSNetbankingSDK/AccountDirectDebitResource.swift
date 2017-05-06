//
//  AccountDirectDebitResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 02/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountDirectDebitResource: NetbankingInstanceResource, GetEnabled, PaginatedListEnabled, CreateEnabled, DeleteEnabled
{
    /**
     * Get the single direct debits detail.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<DirectDebitResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Resource Direct Debit List represents collection of all direct debit approvals entered by user for the specified user
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: ListParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<DirectDebitResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"standingOrders", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Resource for creating (or allowing) direct debit on certain account. Once signed it can be used by receiver party.
     */
    //--------------------------------------------------------------------------
    public func create(_ request: DirectDebitRequest, callback: @escaping (_ result: CoreResult<SignableDirectDebitResponse>) -> Void)
    {
        ResourceUtils.CallCreate(self, payload: request, transform: nil, callback: callback)
    }
    
    /**
     * Resource for deleting direct debit (permission) on certain account. Once signed no more transfers can be made by receiver party.
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<SignableDirectDebitResponse>)->Void)
    {
        ResourceUtils.CallDelete(self, pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }

}
