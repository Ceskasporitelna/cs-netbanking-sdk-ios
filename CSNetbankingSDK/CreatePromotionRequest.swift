//
//  CreatePromotionRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class CreatePromotionRequest: WebApiEntity
{
    /**
     * Id of campaign. Mandatory.
     */
    public var promotionId: String?
    
    /**
     * Executed action. Mandatory.
     */
    public var executedAction: PromotionExecutedAction?
    
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
        self.promotionId              <- map["promotionId"]
        self.executedAction           <- map["executedAction"]
        
        super.mapping( map )
    }
}
