//
//  RepaymentResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Repayment provides information about Repayment.
 */
//==============================================================================
public class RepaymentResponse: WebApiEntity
{
    /**
     * Date of the repayment.
     */
    public internal(set) var repaymentDate:                           Date!
    
    /**
     * Repayment amount. What should be paid.
     */
    public internal(set) var amount:                                  Amount!
    
    /**
     * Actual paid amount.
     */
    public internal(set) var paidAmount:                              Amount?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.repaymentDate = Date()
        self.amount        = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.repaymentDate           <- (map["repaymentDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.amount                  <- map["amount"]
        self.paidAmount              <- map["paidAmount"]
        
        super.mapping( map )
    }
    
}
