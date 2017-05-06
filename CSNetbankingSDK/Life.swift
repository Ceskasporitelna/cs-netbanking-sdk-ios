//
//  Life.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class Life: WebApiEntity
{
    /**
     * Payment Interval. ENUM: ONCE, MONTHLY, QUARTERLY, HALFYEARLY, YEARLY, UNKNOWN
     */
    public internal (set) var premiumPaymentInterval:                         Interval!
    
    /**
     * The agreed premium for the specific insurance.
     */
    public internal (set) var premium:                                        Amount!
    
    /**
     * The agreed end dates of the insurance contract.
     */
    public internal (set) var contractEndDate:                                Date?
    
    /**
     * The contract start date.
     */
    public internal (set) var contractStartDate:                              Date!
    
    /**
     * The agreed amount insured or risk covered by the insurance.
     */
    public internal (set) var insuredAmount:                                  Amount!
    
    /**
     * Capital value of the insurance. Amount of money in saving part of the insurance.
     */
    public internal (set) var currentCapitalValue:                            Amount?
    
    /**
     * Date of the last premium payment
     */
    public internal (set) var lastPremiumDate:                                Date?
    
    /**
     * Last premium payment amount
     */
    public internal (set) var lastPremiumPaid:                                Amount?
    
    /**
     * Date of possible contract termination
     */
    public internal (set) var contractTerminationDate:                        Date?
    
    /**
     * Array of flags for life insurance extended detail
     */
    public internal (set) var flags:                                         [String]?
    
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.premiumPaymentInterval = .other(value: "")
        self.premium                = Amount()
        self.contractStartDate      = Date()
        self.insuredAmount          = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.premiumPaymentInterval                    <- (map["premiumPaymentInterval"], Interval.transform())
        self.premium                                   <- map["premium"]
        self.contractEndDate                           <- (map["contractEndDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.contractStartDate                         <- (map["contractStartDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.lastPremiumDate                           <- (map["lastPremiumDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.insuredAmount                             <- map["insuredAmount"]
        self.currentCapitalValue                       <- map["currentCapitalValue"]
        self.lastPremiumPaid                           <- map["lastPremiumPaid"]
        self.contractTerminationDate                   <- (map["contractTerminationDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.flags                                     <- map["flags"]
        
        super.mapping( map )
    }
}
