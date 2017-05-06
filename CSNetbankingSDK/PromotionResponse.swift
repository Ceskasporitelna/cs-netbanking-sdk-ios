//
//  PromotionResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PromotionResponse: WebApiEntity
{
    /**
     * Id of campaign
     */
    public internal (set) var promotionId: String!
    
    public internal (set) var displayType: DisplayType!
    
    /**
     * Possible actions. Each action is represented by related button on the promotion card/message etc.
     */
    public internal (set) var actions: [PromotionAction]!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.promotionId = String()
        self.displayType = DisplayType()
        self.actions     = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.promotionId              <- map["promotionId"]
        self.displayType              <- map["displayType"]
        self.actions                  <- map["actions"]
        
        super.mapping( map )
    }
}
