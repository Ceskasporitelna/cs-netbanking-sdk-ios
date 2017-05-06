//
//  UpdatePluginRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class UpdatePluginRequest: WebApiEntity
{
    /**
     * Plugin unique identifier. Mandatory.
     */
    public var productCode:                               String?
    
    /**
     * User settlement account for charging fees. Optional.
     */
    public var settlementAccount:                         AccountNumber?
    
    /**
     * Array of optional flag values.
     */
    public var flags:                                     [String]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.productCode = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.productCode              <- map["productCode"]
        self.settlementAccount        <- map["settlementAccount"]
        self.flags                    <- map["flags"]
        
        super.mapping( map )
    }
}
