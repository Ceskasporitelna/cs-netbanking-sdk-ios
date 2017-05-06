//
//  PluginResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PluginResponse: WebApiEntity
{
    /**
     * Plugin unique identifier.
     */
    public internal (set) var productCode:                String!
    
    /**
     * User settlement account for charging fees.
     */
    public internal (set) var settlementAccount:          AccountNumber?
    
    /**
     * Array of optional flag values.
     */
    public internal (set) var flags:                      [String]?
    
    /**
     * Localized name of the plugin.
     */
    public internal (set) var name:                       String!
    
    /**
     * Date until plugin is valid.
     */
    public internal (set) var validUntil:                 Date!
    
    /**
     * Date of activation of plugin for user.
     */
    public internal (set) var dateOfActivation:           Date?
    
    public internal (set) var standardFees:               [PluginFee]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.name       = String()
        self.validUntil = Date()
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
        self.name                     <- map["name"]
        self.validUntil               <- (map["validUntil"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.dateOfActivation         <- (map["dateOfActivation"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.standardFees             <- map["standardFees"]
        
        super.mapping( map )
    }

}
