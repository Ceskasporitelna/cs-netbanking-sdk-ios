//
//  PromotionAction.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PromotionAction: WebApiEntity
{
    /**
     * Technical identifier of the action
     */
    public internal (set) var actionId:                                 String!
    
    /**
     * Type of the action button. Possible values are SHOPPRODUCT, SHOWURL, HIDE
     */
    public internal (set) var actionType:                               ActionType!
    
    /**
     * Name of the window where the url should be publiced. This element is mandatory only in case of actionType = SHOWURL. Can be empty then same window
     */
    public internal (set) var target:                                   String?
    
    /**
     * Contains the URL of an external site to be called. This element is only mandatory if actionType = SHOWURL
     */
    public internal (set) var url:                                      String?
    
    /**
     * Code of the product/plugin connected to the sales promotion. Possible values are Possible values are: RUFO_ORDER, RUFO_INCREASE, UFO_ORDER, UFO_INCREASE.
     */
    public internal (set) var productCode:                              ProductCode?
    
    /**
     * Element connected to this action. Application specific attribute.
     */
    public internal (set) var element:                                  String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.actionId     = String()
        self.actionType   = .other(value: "")
        self.element      = String()

    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.actionId                 <- map["actionId"]
        self.actionType               <- (map["actionType"], ActionType.transform())
        self.target                   <- map["target"]
        self.url                      <- map["url"]
        self.productCode              <- (map["productCode"], ProductCode.transform())
        self.element                  <- map["element"]
        
        super.mapping( map )
    }
}
