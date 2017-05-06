//
//  ContractStrategyFund.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContractStrategyFund: WebApiEntity
{
    /**
     * Id of the fund
     */
    public internal (set) var code:                 String!
    
    /**
     * Name of the fund.
     */
    public internal (set) var name:                 String!
    
    /**
     * Share in the fund. This is percentage value. 20 means 20%.
     */
    public internal (set) var share:                Double!
    
    /**
     * Change gtype of the fund.
     */
    public internal (set) var changeType:           String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
        
        self.code  = String()
        self.name  = String()
        self.share = Double()
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.code                   <- map["code"]
        self.name                   <- map["name"]
        self.share                  <- map["share"]
        self.changeType             <- map["changeType"]
        
        super.mapping( map )
    }
}
