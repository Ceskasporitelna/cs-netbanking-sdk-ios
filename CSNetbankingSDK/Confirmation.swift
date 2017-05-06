//
//  Confirmation.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class Confirmation: WebApiEntity
{
    /**
     * Email
     */
    public var email:                                   String!
    
    /**
     * Language
     */
    public var language:                                Language!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.email    = String()
        self.language = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.email                               <- map["email"]
        self.language                            <- (map["language"], Language.transform())
        
        super.mapping( map )
    }
    
}
