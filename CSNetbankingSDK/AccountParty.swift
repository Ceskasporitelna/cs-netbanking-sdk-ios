//
//  AccountParty.swift
//  CSNetbankingSDK
//
//  Created by Jan Hauser on 23/01/2018.
//  Copyright © 2018 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type AccountParty. Used in AccountTransaction
 */
public class AccountParty: WebApiEntity
{
    
    /**
     * account number of transaction party
     * Required
     * f.e. 2812275553
     */
    public internal(set) var accountNumber: String!

    /**
     * account prefix of transaction party
     * f.e. 0
     */
    public internal(set) var accountPrefix: String?
    
    /**
     * Account bank code of transaction party
     * Required
     * f.e. 0800
     */
    public internal(set) var bankCode: String!
    
    /**
     * Id of bank/branch, constant for domestic accounts in csas
     * Required
     * f.e. GIBACZPX
     */
    public internal(set) var bic: String!
    
    /**
     * Account number of transaction party in IBAN format
     * Required
     * f.e. CZ2908000000002812275553
     */
    public internal(set) var iban: String!
    
    /**
     * Name of transaction party. For ATM transaction, masked card number used in transaction
     * Required
     * f.e. Petr Malý
     */
    public internal(set) var partyInfo: String!
    
    /**
     * Whole account number including bank of transaction party. For ATM transaction, address of ATM
     * if known. For card transaction, identification (name) of the merchant.
     * Required
     * f.e. 2812275553/0800
     */
    public internal(set) var partyDescription: String!
    
    public override init()
    {
        super.init()
    }
    
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    public override func mapping(_ map: Map)
    {
        self.accountNumber <- map["accountNumber"]
        self.accountPrefix <- map["accountPrefix"]
        self.bankCode <- map["bankCode"]
        self.bic <- map["bic"]
        self.iban <- map["iban"]
        self.partyInfo <- map["partyInfo"]
        self.partyDescription <- map["partyDescription"]
        super.mapping( map )
    }
}
