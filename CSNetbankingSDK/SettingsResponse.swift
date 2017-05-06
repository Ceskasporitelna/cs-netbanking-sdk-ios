//
//  SettingsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class SettingsResponse: WebApiEntity
{
    /**
     * Preferred language. Possible values are cs and en.
     */
    public internal (set) var language:                              Language!
    
    /**
     * List of flags.
     */
    public internal (set) var flags:                                 [String]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
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
        self.language                 <- (map["language"], Language.transform())
        self.flags                    <- map["flags"]
        
        super.mapping( map )
    }
}
