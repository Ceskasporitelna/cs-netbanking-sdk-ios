//
//  UpdateGoalsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class UpdateGoalsRequest: WebApiEntity
{
    /**
     * Goals. Mandatory.
     */
    public var goals:                                        [GoalRequest]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.goals                 <- map["goals"]
        
        super.mapping( map )
    }
    
}
