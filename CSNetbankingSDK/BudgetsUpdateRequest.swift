//
//  BudgetsUpdateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 31/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class BudgetsUpdateRequest: WebApiEntity
{
    /**
     * Convenience property for budgets. Mandatory.
     */
    public var budgets:                        [BudgetRequest]?
    
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
        self.budgets              <- map["budgets"]
        
        super.mapping( map )
    }
    
}
