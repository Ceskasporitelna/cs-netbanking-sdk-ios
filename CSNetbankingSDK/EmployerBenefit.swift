//
//  EmployerBenefit.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class EmployerBenefit: WebApiEntity
{
    /**
     * frequency of the contribution. ENUM: ONCE, MONTHLY, QUARTERLY, HALFYEARLY, YEARLY, UNKNOWN
     */
    public internal (set) var frequency:                                   Interval?
    
    /**
     * Explanatory text to employer contribution. Possible values: WHOLE_PREMIUM, PARTLY_PAID_PREMIUM, EXTRAORDINARY_PAYMENTS?
     */
    public internal (set) var type:                                        EmployerBenefitType?
    
    /**
     * Amount of the contribution
     */
    public internal (set) var amount:                                      Amount?
    
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
        self.frequency              <- (map["frequency"], Interval.transform())
        self.type                   <- (map["type"], EmployerBenefitType.transform())
        self.amount                 <- map["amount"]
        
        super.mapping( map )
    }
}


