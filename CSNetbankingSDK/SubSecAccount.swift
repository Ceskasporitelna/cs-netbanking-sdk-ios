//
//  SubSecAccount.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class SubSecAccount: WebApiEntity
{
    /**
     * Sub Securities Account ID
     */
    public internal (set) var id:                               String!
    
    /**
     * Array of the titles within sub account.
     */
    public internal (set) var titles:                           [SubSecAccountTitle]?
    
    /**
     * Array of flags.
     */
    public internal (set) var flags:                            [String]!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.id    = String()
        self.flags = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- map["id"]
        self.titles                           <- map["titles"]
        self.flags                            <- map["flags"]
        
        super.mapping( map )
    }

}
