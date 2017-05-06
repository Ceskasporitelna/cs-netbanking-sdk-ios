//
//  LoyaltyResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class LoyaltyResponse: WebApiEntity
{
    /**
     * State of the ibod account. Possible values are REGISTERED, UNREGISTERED, DEACTIVATED_FROM_FSCS.
     */
    public internal (set) var state:                                      LoyaltyState!
    
    /**
     * Date when data were actual.
     */
    public internal (set) var exportDate:                                 Date!
    
    /**
     * IBod points count.
     */
    public internal (set) var pointsCount:                                Double!
    
    /**
     * Activation ibod code.
     */
    public internal (set) var activationCode:                             String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.state       = .other(value: "")
        self.exportDate  = Date()
        self.pointsCount = Double()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.state                <- (map["state"], LoyaltyState.transform())
        self.exportDate           <- (map["exportDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.pointsCount          <- map["pointsCount"]
        self.activationCode       <- map["activationCode"]
        
        super.mapping( map )
    }
}
