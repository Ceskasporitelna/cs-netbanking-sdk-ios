//
//  BudgetCategory.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class BudgetCategory: WebApiEntity
{
    /**
     * Unique id of watched main category of client transactions. Possible values are 
     * NON_REGULAR_INCOME, UNCATEGORIZED_INCOME, TRAVEL_HOLIDAYS, HEALTH, LEISURE, 
     * COMMUNICATION, CAR, FOOD, EDUCATION, REGULAR_INCOME, ONLINE_SHOPPING, 
     * OTHER_EXPENSES, CLOTHING, UNCATEGORIZED_EXPENSE, FEES, SAVINGS_INVESTMENT, 
     * TRANSPORT, ALIMONY_POCKET_MONEY, TAXES, WITHDRAWAL, LIVING_AND_ENERGY.
     */
    public var id:                            CategoryId!
    
    /**
     * Category level. Currently only "mainCategory" is supported.
     */
    public var level:                         String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.id = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id              <- (map["id"], CategoryId.transform())
        self.level           <- map["level"]
        
        super.mapping( map )
    }
}
