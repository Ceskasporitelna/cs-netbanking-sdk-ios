//
//  PromotionExecutedAction.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PromotionExecutedAction: WebApiEntity
{
    /**
     * Promotion action ID.
     */
    public var actionId:                       String!
    
    /**
     * Promotion action type.
     */
    public var actionType:                     ActionType!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
        
        self.actionId   = String()
        self.actionType = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.actionId                 <- map["actionId"]
        self.actionType               <- (map["actionType"], ActionType.transform())
        
        super.mapping( map )
    }
}
