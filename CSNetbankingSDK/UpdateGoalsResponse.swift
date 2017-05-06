//
//  UpdateGoalsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class UpdateGoalsResponse: WebApiEntity
{
    /**
     * Goals
     */
    public var goals:                                        [GoalResponse]!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.goals = []
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
