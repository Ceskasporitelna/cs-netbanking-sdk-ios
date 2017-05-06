//
//  AccountStandingOrdersResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 01/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountStandingOrdersResource: NetbankingResource, PaginatedListEnabled, HasInstanceResource, CreateEnabled
{
    /**
     * Returns list of actual standing/sweep orders for accounts of the current user.
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: StandingOrdersParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<StandingOrderResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"standingOrders", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Get the resource of standing order with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> AccountStandingOrderResource
    {
        return AccountStandingOrderResource( id: id, path: self.path, client: self.client);
    }
    
    /**
     * Resource for creating standing/sweep order. Once order has been signed new payments are generated and executed according its settings.
     */
    //--------------------------------------------------------------------------
    public func create(_ request: CreateStandingOrderRequest, callback: @escaping (_ result: CoreResult<SignableStandingOrderResponse>) -> Void)
    {
        ResourceUtils.CallCreate(self, payload: request, transform: nil, callback: callback)
    }
}
