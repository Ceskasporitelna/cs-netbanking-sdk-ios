//
//  BudgetRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 21/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class BudgetRequest: WebApiEntity
{
    /**
     * Budget category attributes. Mandatory.
     */
    public var category:                                  BudgetCategory?
    
    /**
     * Financial limit of the watched category per a given period. Optional.
     */
    public var budget:                                    Amount?
    
    
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
        self.category              <- map["category"]
        self.budget                <- map["budget"]
        
        super.mapping( map )
    }
}
