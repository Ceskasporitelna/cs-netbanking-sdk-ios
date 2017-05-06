//
//  BudgetResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class BudgetResponse: WebApiEntity
{
    /**
     * Budget category attributes.
     */
    public internal (set) var category:                                  BudgetCategory!
    
    /**
     * financial limit of the watched category per a given period.
     */
    public internal (set) var budget:                                    Amount?
    
    /**
     * Convenience property to obtain the resource.
     */
    public var budgetsResource: BudgetsResource {
        return (self.resource.client as! NetbankingClient).budgets
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.category = BudgetCategory()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.category              <- map["category"]
        self.budget                <- map["budget"]
        
        super.mapping( map )
    }
}
