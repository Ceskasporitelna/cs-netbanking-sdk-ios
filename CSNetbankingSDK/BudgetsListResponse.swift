//
//  BudgetsListResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class BudgetsListResponse: WebApiEntity
{
    /**
     * Get budgets.
     * Convenience property for budgets.
     */
    public internal (set) var budgets:        [BudgetResponse]!
    
    /**
     * Get manually set.
     */
    public internal (set) var manuallySet:     Bool? 
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.budgets = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.budgets              <- map["budgets"]
        self.manuallySet          <- map["manuallySet"]
        
        super.mapping( map )
    }

}
