//
//  Loan.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Loan provides information about Loan.
 */
//==============================================================================
public class Loan: WebApiEntity
{
    /**
     * For mortgages this is the date of interest rate validity.
     */
    public internal(set) var interestRateToDate:                          TCurrency?
    
    /**
     * For loans this is contracted value of the loan.
     */
    public internal(set) var loanAmount:                                  Amount?
    
    /**
     * For mortgages this is its maturity date.
     */
    public internal(set) var maturityDate:                                Date?
    
    /**
     * For loans this is remaining amount for utilization. Basically this is disposable balance for loans.
     */
    public internal(set) var remainingLoanAmount:                         Amount!
    
    /**
     * For loans and morgages this is last date when you can use money.
     */
    public internal(set) var drawDownToDate:                              Date?
    
    /**
     * For mortgages this is actual drawdown amount.
     */
    public internal(set) var drawDownAmount:                              Amount!
    
    /**
     * For loans and mortgages this is value of the principal. Value which should be paid back to bank.
     */
    public internal(set) var outstandingDebt:                             Amount?
    
    /**
     * Amount of money to onetime repay whole loan.
     */
    public internal(set) var czLumpsumRepayment:                          Amount?
    
    /**
     * Frequency of the repayment. Possible values are MONTHLY, QUARTERLY, HALFYEARLY, YEARLY, WEEKLY.
     */
    public internal(set) var installmentFrequency:                        InstallmentFrequency?
    
    /**
     * Day of the month when repayment should be paid (f.e. 22)
     */
    public internal(set) var installmentDay:                              Int?
    
    /**
     * Loans and mortgages repayment amount.
     */
    public internal(set) var nextRateAmount:                              Amount?
    
    /**
     * Next date of the repayment (for loans).
     */
    public internal(set) var nextRateDate:                                Date?
    
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.remainingLoanAmount = Amount()
        self.drawDownAmount      = Amount()
    }
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.interestRateToDate     <- map["interestRateToDate"]
        self.loanAmount             <- map["loanAmount"]
        self.maturityDate           <- (map["maturityDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.remainingLoanAmount    <- map["remainingLoanAmount"]
        self.drawDownToDate         <- (map["drawdownToDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.drawDownAmount         <- map["drawdownAmount"]
        self.outstandingDebt        <- map["outstandingDebt"]
        self.czLumpsumRepayment     <- map["cz-lumpsumRepayment"]
        self.installmentFrequency   <- (map["installmentFrequency"], InstallmentFrequency.transform())
        self.installmentDay         <- map["installmentDay"]
        self.nextRateAmount         <- map["nextRateAmount"]
        self.nextRateDate           <- (map["nextRateDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        
        super.mapping( map )
    }
}
