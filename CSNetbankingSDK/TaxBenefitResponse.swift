//
//  TaxBenefitsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class TaxBenefitResponse: WebApiEntity
{
    /**
     * Tax deductable premium.
     */
    public internal (set) var taxDeductiblePremium:                    Amount?
    
    /**
     * Recommended extraordinary deposit for maximum tax deduction.
     */
    public internal (set) var recommendedDeposit:                      Amount?
    
    /**
     * Explanatory text for recommended extraordinary deposit. Available only in CZ language.
     */
    public internal (set) var recommendedDepositText:                  String?
    
    /**
     * Contains data that should be prefilled to domestic payment form.
     */
    public internal (set) var paymentTemplate:                        TaxPaymentTemplate?
    
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
        self.taxDeductiblePremium       <- map["taxDeductiblePremium"]
        self.recommendedDeposit         <- map["recommendedDeposit"]
        self.recommendedDepositText     <- map["recommendedDepositText"]
        self.paymentTemplate            <- map["paymentTemplate"]
        
        super.mapping( map )
    }

}
