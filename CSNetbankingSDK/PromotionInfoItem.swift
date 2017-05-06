//
//  PromotionInfoItem.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PromotionInfoItem: WebApiEntity
{
    public internal (set) var infoName: String!
    
    public internal (set) var infoValue: String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.infoName  = String()
        self.infoValue = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.infoName                 <- map["infoName"]
        self.infoValue                <- map["infoValue"]
        
        super.mapping( map )
    }
}
