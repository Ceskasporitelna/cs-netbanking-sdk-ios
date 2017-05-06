//
//  MainAccountResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Main account provides information about Account.
 */
//==============================================================================
public class MainAccountResponse: Account
{
    /**
     * User defined account name. Max. 50 characters
     */
    public internal(set) var alias:                              String?
    
    /**
     * Account description. Currently account owner name is returned.
     */
    public internal(set) var description:                        String?
    
    /**
     * Disposable account balance
     */
    public internal(set) var disposable:                         Amount?
    
    /**
     * Overdraft amount for account
     */
    public internal(set) var overdraft:                          OverdraftAmount?
    
    /**
     * Due date of overdraft. Only for overdrafts where automatic prolongation is not set.
     */
    public internal(set) var overdraftDueDate:                   Date?
    
    /**
     * Array of flags
     */
    public internal(set) var flags:                              [String]?
    
    /**
     * Account's subaccounts
     */
    public internal(set) var subAccounts:                        [SubAccount]?
    
    /**
     * Basic debit Interest rate, used for Loan and Mortgage account. Value in percentage, e.g. 11,5 will be displayed as 11,5 %.
     */
    public internal(set) var debitInterestRate:                  TCurrency?
    
    /**
     * For loans (not mortgages) this is interest rate which apply when repayment is delayed. Value in percentage, e.g. 19,5 will be displayed as 19,5 %.
     */
    public internal(set) var penaltyInterestRate:                TCurrency?
    
    /**
     * Loan of the account
     */
    public internal(set) var loan:                               Loan?
    
    /**
     * Savings of the account
     */
    public internal(set) var saving:                             Saving?
    
    /**
     * List of own Transfer Receivers related to the account.
     */
    public internal(set) var ownTransferReceivers:               TransferReceiver?
    
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
        self.alias                   <- map["alias"]
        self.description             <- map["description"]
        self.disposable              <- map["disposable"]
        self.overdraft               <- map["overdraft"]
        self.overdraftDueDate        <- (map["overdraftDueDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.flags                   <- map["flags"]
        self.subAccounts             <- map["subaccounts"]
        self.debitInterestRate       <- map["debitInterestRate"]
        self.penaltyInterestRate     <- map["penaltyInterestRate"]
        self.loan                    <- map["loan"]
        self.saving                  <- map["saving"]
        self.ownTransferReceivers    <- map["ownTransferReceivers"]
        
        super.mapping( map )
    }
}
