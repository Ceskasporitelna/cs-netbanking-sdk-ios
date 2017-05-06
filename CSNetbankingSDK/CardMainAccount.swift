//
//  MainCardAccount.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class CardMainAccount: WebApiEntity
{
    /**
    * Internal ID as reference for account provided by BE
    */
    public internal(set) var id:                                       String?
    
    /**
     * Full name of the main account's holder.
     */
    public internal(set) var holderName:                               String!
    
    /**
     * Main account is credit card shadow account for credit card or linked main current account for bank/debit card.
     */
    public internal(set) var accountNo:                                AccountNumber!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.holderName = String()
        self.accountNo  = AccountNumber()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- map["id"]
        self.holderName                       <- map["holderName"]
        self.accountNo                        <- map["accountno"]
        
        super.mapping( map )
    }
}
