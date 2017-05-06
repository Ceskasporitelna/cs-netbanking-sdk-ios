//
//  Saving.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Saving provides information about Saving. Used in {@link MainAccount}
 */
//==============================================================================
public class Saving: WebApiEntity
{
    /**
     * In case of interest rate bands this is the interest rate which applies to value over limit.
     */
    public internal(set) var interestRateOverLimit:                       TCurrency?
    
    /**
     * Limit amount for basic credit interest rate used for some saving accounts.
     */
    public internal(set) var interestRateLimit:                           Amount?
    
    /**
     * Bonus interest rates which can be gained if certain conditions are met.
     */
    public internal(set) var czBonusInterestRate:                         TCurrency?
    
    /**
     * Saving purpose code (for some savings accounts). Possible values are ELECTRONICS, WHITE_GOODS, HOLIDAYS, SPORT_EQUIPMENT, FURNITURE, CARS_AND_ACCESSORIES, HOBBIES_AND_GARDEN, GIFTS_AND_PARTIES, HEALTH, STUDIES, HOUSING, PERSONAL.
     */
    public internal(set) var savingGoal:                                  SavingGoal?
    
    /**
     * For some savings accounts this is target amount of the saving.
     */
    public internal(set) var targetAmount:                                Amount?
    
    /**
     * Minimum balance for some current and savings accounts.
     */
    public internal(set) var minimumBalance:                              Amount?
    
    /**
     * The next prolongation date, when BE system will automatically credit regular deposit amount on saving account or calculate and transfer interest on term deposit.
     */
    public internal(set) var nextProlongation:                            Date!
    
    /**
     * Maximum amount of own transfer from current (master) to saving account (slave, this) used only for some saving accounts. Currently used only for Individualní spoření. Field contains maximum amount for current month (maximum for month minus already executed payments in current month).
     */
    public internal(set) var extraSavingMaximum:                          Amount?
    
    /**
     * Maximum amount of own transfer from current (master) to saving account (slave, this) used only for some saving accounts. Currently used only for Individualni sporeni. Field contains maximum possible amount for all months (regardless already created payments).
     */
    public internal(set) var czExtraSavingMaximumMonthly:                 Amount?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.nextProlongation = Date()
    }

    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.interestRateOverLimit       <- map["interestRateOverLimit"]
        self.interestRateLimit           <- map["interestRateLimit"]
        self.czBonusInterestRate         <- map["cz-bonusInterestRate"]
        self.savingGoal                  <- (map["savingGoal"], SavingGoal.transform())
        self.targetAmount                <- map["targetAmount"]
        self.minimumBalance              <- map["minimumBalance"]
        self.nextProlongation            <- map["nextProlongation"]
        self.extraSavingMaximum          <- map["extraSavingMaximum"]
        self.czExtraSavingMaximumMonthly <- map["cz-extraSavingMaximumMonthly"]
        
        super.mapping( map )
    }
}
