//
//  LifeDetail.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class LifeDetail: Life
{
    /**
     * Reason of possible contract termination
     */
    public internal (set) var contractTerminationReason:           String?
    
    /**
     * In case of CLOSED contract, this means the reason of the termination. This field si localized.
     */
    public internal (set) var czContractEndReason:                 String?
    
    /**
     * Technique for the premium payment
     */
    public internal (set) var premiumPaymentMethodI18N:            String?
    
    /**
     * Date of the last premium payment
     */
    public internal (set) var premiumLastPaid:                     Date?
    
    /**
     * Technical interest rate. Value in percentage, e.g. 0,5 will be displayed as 0,5 %.
     */
    public internal (set) var technicalInterestRate:               Double?
    
    /**
     * Employer benefit info.
     */
    public internal (set) var employerBenefit:                     EmployerBenefit?
    
    /**
     * Immobilization info.
     */
    public internal (set) var immobilization:                      Immobilization?
    
    /**
     * List of payment templates.
     */
    public internal (set) var paymentTemplates:                    [PaymentTemplate]?
    
    /**
     * Maximum amount that can be withdrawn from capital value
     */
    public internal (set) var czCapitalValueMaxWithdrawal:         Amount?
    
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
        self.contractTerminationReason                 <- map["contractTerminationReason"]
        self.czContractEndReason                       <- map["cz-contractEndReason"]
        self.premiumPaymentMethodI18N                  <- map["premiumPaymentMethodI18N"]
        self.premiumLastPaid                           <- (map["premiumLastPaid"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.lastPremiumPaid                           <- map["lastPremiumPaid"]
        self.technicalInterestRate                     <- map["technicalInterestRate"]
        self.employerBenefit                           <- map["employerBenefit"]
        self.immobilization                            <- map["immobilization"]
        self.paymentTemplates                          <- map["paymentTemplates"]
        self.czCapitalValueMaxWithdrawal               <- map["czCapitalValueMaxWithdrawal"]
        
        super.mapping( map )
    }
}
