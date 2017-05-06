//
//  ContractPayment.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContractPayment: WebApiEntity
{
    /**
     * Payment identifier. Unique for current insurance.
     */
    public internal (set) var id:                                         String!
    
    /**
     * Type of the payment. Possible values are ORDINARY, ONETIME, EXTRAORDINARY, FUTURE, OVERDUE, WITHDRAWAL, PARTIALLY_PAID, UNKNOWN.
     */
    public internal (set) var type:                                       PaymentType!
    
    /**
     * Payment date.
     */
    public internal (set) var transactionDate:                            Date?
    
    /**
     * Payment amount. Amount which was received by insurance company.
     */
    public internal (set) var amount:                                     Amount!
    
    /**
     * Rest which should be paid if payment instruction wasn't fully paid by this payment.
     */
    public internal (set) var restToPay:                                  Amount?
    
    /**
     * Payment instruction amount. Amount which should be paid for particular period.
     */
    public internal (set) var instruction:                                Amount?
    
    /**
     * Amount paid by employer (as benefit). It is included in the payment amount.
     */
    public internal (set) var employerContribution:                       Amount?
    
    /**
     * Start date of the period for which payment instruction was created.
     */
    public internal (set) var instructionFrom:                            Date?
    
    /**
     * End date of the period for which payment instruction was created.
     */
    public internal (set) var instructionTo:                              Date?
    
    /**
     * Array of flags for funds.
     */
    public internal (set) var flags:                                      [String]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id     = String()
        self.type   = .other(value: "")
        self.amount = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                         <- map["id"]
        self.type                       <- (map["type"], PaymentType.transform())
        self.transactionDate            <- (map["transactionDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.amount                     <- map["amount"]
        self.restToPay                  <- map["restToPay"]
        self.instruction                <- map["instruction"]
        self.employerContribution       <- map["employerContribution"]
        self.instructionFrom            <- (map["instructionFrom"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.instructionTo              <- (map["instructionTo"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.flags                      <- map["flags"]
        
        super.mapping( map )
    }
}
