//
//  BuildingsContractSavingLoan.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class BuildingsContractSavingLoan: WebApiEntity
{
    /**
     * Total contracted building loan amount.
     */
    public internal (set) var loanAmount:                      Amount?
    
    /**
     * Installment part of the loan monthly repayment.
     */
    public internal (set) var loanInstallment:                 Amount!
    
    /**
     * Saving part of the loan monthly repayment.
     */
    public internal (set) var additionalSavings:               Amount?
    
    /**
     * Insurance part of the loan monthly repayment.
     */
    public internal (set) var paymentInsurance:                Amount?
    
    /**
     * Current interest rate is valid from this date. Filled only for loans.
     */
    public internal (set) var interestRateFromDate:            Date?
    
    /**
     * Current interest rate is valid to this date. Filled only for loans in case of variable interest rate. If interest rate is fixed, this field is empty.
     */
    public internal (set) var interestRateToDate:              Date?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.loanInstallment = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.loanAmount               <- map["loanAmount"]
        self.loanInstallment          <- map["loanInstallment"]
        self.additionalSavings        <- map["additionalSavings"]
        self.paymentInsurance         <- map["paymentInsurance"]
        self.interestRateFromDate     <- (map["interestRateFromDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.interestRateToDate       <- (map["interestRateToDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        
        super.mapping( map )
    }

}
