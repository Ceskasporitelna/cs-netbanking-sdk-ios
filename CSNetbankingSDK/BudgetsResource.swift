//
//  BudgetsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class BudgetsResource: NetbankingResource, OptionalPaginatedListEnabled, UpdateEnabled
{
    /**
     * Returns list of user's tracked categories and its limits.
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: ListParameters? =  nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<BudgetResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "budgets", parameters: parameters?.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Set new value of tracked categories.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : BudgetsUpdateRequest, callback: @escaping (_ result:CoreResult<BudgetsListResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
