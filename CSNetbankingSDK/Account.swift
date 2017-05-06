//
//  Account.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

public typealias TCurrency = Double

/**
 * The type Account. It provides information about Account.
 */

//==============================================================================
public class Account: WebApiEntity
{
    /**
     * Unique product id
     */
    public internal(set) var id:                               String!
    
    /**
     * Account number of this account
     */
    public internal(set) var accountNo:                        AccountNumber!
    
    /**
     * Actual account balance. For loans this field contains outstanding principal
     */
    public internal(set) var balance:                          Amount!
    
    /**
     * Product code.
     */
    public internal(set) var product:                          String!
    
    /**
     * Product description localized
     */
    public internal(set) var productI18N:                      String!
    
    /**
     * Product type. Possible values are CURRENT (for current accounts), SAVING (for saving accounts), LOAN (for loans)
     */
    public internal(set) var type:                             ProductType!
    
    /**
     * Subtype product. Possible values are mapping based on type. For CURRENT (CURRENT_ACCOUNT, INVESTMENT_CURRENT_ACCOUNT,
     * GIRO_ACCOUNT, GIRO_ACCOUNT_OLD, FOREIGN_ACCOUNT, INVESTMENT_FOREIGN_ACCOUNT), SAVING (DEPOSIT_ACCOUNT, SAVINT_ACCOUNT,
     * SAVING_INTERNET, CHILDREN_PASSBOOK, SAVING_CS, BENEFIT_INVEST), LOAN (LOAN_ACCOUNT, MORTGAGE, REVOLVING_LOAN).
     */
    public internal(set) var subType:                          ProductSubType!
    
    /**
     * Basic credit Interest rate, used for Current and Saving account. Value in percentage, e.g. 0,5 will be displayed as 0,5 %
     */
    public internal(set) var creditInterestRate:               TCurrency!
    
    /**
     * Information about signing.
     */
    public internal(set) var signInfo:                         SignInfo!
    
    /**
     * Convenience property for AccountResource.
     */
    public var accountResource: AccountResource {
        return (self.resource as! AccountResource)
    }
    
    /**
     * Convenience property for AccountSubAccountsResource.
     */
    public var subAccountsResource: AccountSubAccountsResource {
        return self.accountResource.subAccounts
    }
    
    /**
     * Convenience property for AccountBalanceResource.
     */
    public var balanceResource: AccountBalanceResource {
        return self.accountResource.balance
    }
    
    /**
     * Convenience property for AccountReservationsResource.
     */
    public var reservationsResource: AccountReservationsResource {
        return self.accountResource.reservations
    }
    
    /**
     * Convenience property for AccountTransactionsResource.
     */
    public var transactionsResource: AccountTransactionsResource {
        return self.accountResource.transactions
    }
    
    /**
     * Convenience property for AccountServicesResource.
     */
    public var servicesResource: AccountServicesResource {
        return self.accountResource.services
    }
    
    /**
     * Convenience property for AccountRepaymentsResource.
     */
    public var repaymentsResource: AccountRepaymentsResource {
        return self.accountResource.repayments
    }
    
    /**
     * Convenience property for AccountStatementsResource.
     */
    public var statementsResource: AccountStatementsResource {
        return self.accountResource.statements
    }
    
    /**
     * Convenience property for AccountTransferResource.
     */
    public var transferResource: AccountTransferResource {
        return self.accountResource.transfer
    }
    
    /**
     * Convenience method for update account's settings.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : ChangeAccountSettingsRequest, callback: @escaping (_ result:CoreResult<ChangeAccountSettingsResponse>)->Void)
    {
        self.accountResource.update(request, callback: callback)
    }

    /**
     * Convenience method for get account detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<MainAccountResponse>) -> () )
    {
        self.accountResource.get(callback)
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id                 = String()
        self.accountNo          = AccountNumber()
        self.balance            = Amount()
        self.product            = String()
        self.productI18N        = String()
        self.type               = .other(value: "")
        self.subType            = .other(value: "")
        self.creditInterestRate = TCurrency()
        self.signInfo           = SignInfo()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                      <- map["id"]
        self.accountNo               <- map["accountno"]
        self.balance                 <- map["balance"]
        self.product                 <- map["product"]
        self.productI18N             <- map["productI18N"]
        self.type                    <- (map["type"], ProductType.transform())
        self.subType                 <- (map["subtype"], ProductSubType.transform())
        self.creditInterestRate      <- map["creditInterestRate"]
        self.signInfo                <- map["signInfo"]
        
        super.mapping( map )
    }
}



