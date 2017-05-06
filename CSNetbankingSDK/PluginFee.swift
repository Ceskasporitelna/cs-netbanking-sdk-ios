//
//  PluginFee.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PluginFee: WebApiEntity
{
    /**
     * Time moment of changing the plugin fee. Possible values are IMMEDIATELY, ACCOUNT_STATEMENT, UNKNOWN.
     */
    public internal (set) var timeOfCharging:                             TimeOfCharging!
    
    /**
     * Frequency period of changing the plugin fee. Possible values are MONTHLY, NON_RECURRING, UNKNOWN.
     */
    public internal (set) var periodOfCharging:                           PeriodOfCharging!
    
    /**
     * Fee amount defined for this plugin.
     */
    public internal (set) var amount:                                     Amount!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.timeOfCharging   = .other(value: "")
        self.periodOfCharging = .other(value: "")
        self.amount           = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.timeOfCharging           <- (map["timeOfCharging"], TimeOfCharging.transform())
        self.periodOfCharging         <- (map["periodOfCharging"], PeriodOfCharging.transform())
        self.amount                   <- map["amount"]
        
        super.mapping( map )
    }
}
