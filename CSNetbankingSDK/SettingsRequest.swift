//
//  SettingsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK


// MARK: -
//==============================================================================
public class SettingsRequest: WebApiEntity
{
    /**
     * Preferred language. Possible values are cs and en. Mandatory.
     */
    public var language:                              Language?
    
    /**
     * List of flags. Optional.
     */
    public var flags:                                 [String]?
    
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
        self.language                 <- (map["language"], Language.transform())
        self.flags                    <- map["flags"]
        
        super.mapping( map )
    }
}
