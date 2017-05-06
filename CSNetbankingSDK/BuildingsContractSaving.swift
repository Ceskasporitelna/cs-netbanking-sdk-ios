//
//  BuildingsContractSaving.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class BuildingsContractSaving: WebApiEntity
{
    /**
     * Target amount. Will not be set for loans.
     */
    public internal (set) var targetAmount:                    Amount?
    
    /**
     * Agreed monthly savings amount for building savings. Will not be set for loans.
     */
    public internal (set) var agreedMonthlySavings:            Amount?
    
    /**
     * Notice period expiry date. Not set for loans.
     */
    public internal (set) var expiryDate:                      Date?
    
    /**
     * Remaining deposit to be paid to Building Savings till the end of this year to get annual maximal bonus.
     */
    public internal (set) var bonusBearingDepositToPay:        Amount?
    
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
        self.targetAmount             <- map["targetAmount"]
        self.agreedMonthlySavings     <- map["agreedMonthlySavings"]
        self.expiryDate               <- (map["expiryDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.bonusBearingDepositToPay <- map["bonusBearingDepositToPay"]
        
        super.mapping( map )
    }
}
