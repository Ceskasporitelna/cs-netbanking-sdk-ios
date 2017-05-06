//
//  ContractStrategyResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContractStrategyResponse: WebApiEntity
{
    /**
     * Type of the chosen strategy. Possible values: CONSERVATIVE, PROGRESSIVE, BALANCED, CONTROL, ACTUAL_SETTING
     */
    public internal (set) var type:                                ContractStrategyType!
    
    /**
     * Possible values are STRATEGY, INVESTMENT_MANAGEMENT. That means the funds 
     * allocation is fixed given by the chosen strategy, or it is under an investment 
     * program, so it is variable depending on current market state.
     */
    public internal (set) var group:                               ContractStrategyGroup!
    
    /**
     * Strategy funds list
     */
    public internal (set) var funds:                               [ContractStrategyFund]!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.type  = .other(value: "")
        self.group = .other(value: "")
        self.funds = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.type                   <- (map["type"], ContractStrategyType.transform())
        self.group                  <- (map["group"], ContractStrategyGroup.transform())
        self.funds                  <- map["funds"]
        
        super.mapping( map )
    }
}
