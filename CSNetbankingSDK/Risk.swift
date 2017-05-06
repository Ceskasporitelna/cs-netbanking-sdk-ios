//
//  Risk.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class Risk: WebApiEntity
{
    /**
     * Name of the active risk product.
     */
    public internal (set) var productName:                                String?
    
    /**
     * Group of the active risk product.
     */
    public internal (set) var riskGroup:                                  String?
    
    /**
     * Amount that an ​insurance ​company will ​pay after making a ​claim.
     */
    public internal (set) var insuredSum:                                 Amount?
    
    /**
     * Frequency in which insured sum may be paid.
     */
    public internal (set) var frequency:                                  String?
    
    /**
     * Description of the insured risk.
     */
    public internal (set) var explanation:                                String?
    
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
        self.productName                <- map["productName"]
        self.riskGroup                  <- map["riskGroup"]
        self.insuredSum                 <- map["insuredSum"]
        self.frequency                  <- map["frequency"]
        self.explanation                <- map["explanation"]
        
        super.mapping( map )
    }
}
