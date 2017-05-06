//
//  GoalsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class GoalsResource: NetbankingResource, ListEnabled, UpdateEnabled
{
    /**
     * Returns list of user's tracked categories and its limits.
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<GoalResponse>>) -> Void)
    {
         ResourceUtils.CallList(self, itemJSONKey: "goals", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Set new value of goals. In price, only CZK currency is supported. If completed flag is not present, false value is supposed. All goals of given client are replaced - old ones (except of completed) are deleted and these new specified are inserted.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateGoalsRequest, callback: @escaping (_ result:CoreResult<UpdateGoalsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
