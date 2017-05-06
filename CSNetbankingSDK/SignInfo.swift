//
//  SignInfo.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 07/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class SignInfo: WebApiEntity
{
    /**
     * Sign Info state
     */
    public internal(set) var state:                                     String!
    
    /**
     * Hash value.
     */
    public internal(set) var signId:                                    String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.state  = String()
        self.signId = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.state                       <- map["state"]
        self.signId                      <- map["signId"]
        
        super.mapping( map )
    }
}
