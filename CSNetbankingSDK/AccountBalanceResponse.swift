//
//  AccountBalanceResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Domestic account number provides information about account number.
 */

//==============================================================================
public class AccountBalanceResponse: WebApiEntity
{
    /**
     * Account balance for Current, Saved amount for Saving, Principal Outstanding for Loan/Mortgage.
     */
    public internal(set) var balance:                  Amount!
    
    /**
     * Disposable balance for Current account.
     */
    public internal(set) var disposable:               Amount?
    
    /**
     * Overdraft amount for Current account.
     */
    public internal(set) var overdraft:                Amount?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.balance    = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.balance                 <- map["balance"]
        self.disposable              <- map["disposable"]
        self.overdraft               <- map["overdraft"]
        
        super.mapping( map )
    }
    
}
