//
//  AccountTransaction.swift
//  CSNetbankingSDK
//
//  Created by Jan Hauser on 23/01/2018.
//  Copyright © 2018 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Account transaction. It provides information about Account transaction.
 */
public class AccountTransaction: WebApiEntity
{
    
    /**
     * Transaction reference ID
     * Required
     * f.e. I141126DXHZ3T
     */
    public internal(set) var id: String!
    
    /**
     * Account party object
     * Required
     */
    public internal(set) var accountParty: AccountParty!
    
    /**
     * Additional info to transaction - not used
     */
    public internal(set) var additionalTexts: String?
    
    /**
     * Amount object
     * Required
     */
    public internal(set) var amount: Amount!
    
    /**
     * Amount sender object
     * Required
     */
    public internal(set) var amountSender: Amount!
    
    /**
     * Date of booking
     * Required
     * f.e. 2014-11-26T00:00:00+01:00
     */
    public internal(set) var bookingDate: Date!
    
    /**
     * Type of booking
     */
    public internal(set) var bookingType: String?
    
    /**
     * Number of card used in transaction
     * Required
     * f.e. 0
     */
    public internal(set) var cardNumber: Int!
    
    /**
     * Constant symbol
     * Required
     * f.e. 0558
     */
    public internal(set) var constantSymbol: String!
    
    /**
     * Date of conversion
     */
    public internal(set) var currRateEURDate: Date?
    
    /**
     * Conversion rates in EUR
     */
    public internal(set) var currRateEURValue: String?
    
    /**
     * User description of the transaction
     * Required
     * f.e. domácí platba
     */
    public internal(set) var description: String!
    
    /**
     * If true, then description could be changed using PUT method/false
     * Required
     * f.e. false
     */
    public internal(set) var descriptionEditable: String!
    
    /**
     * not used
     */
    public internal(set) var paymentReference: String?
    
    /**
     * Note for payee ("zpráva pro příjemce"). Up to 140 chars. For foreign transactions, additional
     * info about currency rate etc.
     * Required
     * f.e. note for payee
     */
    public internal(set) var payeeNote: String!
    
    /**
     * Note for payer ("zpráva pro mě"). Up to 140 chars.
     * Required
     * f.e. note for payer
     */
    public internal(set) var payerNote: String!
    
    /**
     * Specific symbol
     * Required
     * f.e. 55
     */
    public internal(set) var specificSymbol: String!
    
    /**
     * Transaction state
     */
    public internal(set) var state: String?
    
    /**
     * not used
     */
    public internal(set) var timestampId: String?
    
    /**
     * Type of transaction
     * Required
     * f.e. 54
     */
    public internal(set) var transactionType: String!
    
    /**
     * Date of valuation
     * Required
     * f.e. 2014-11-26T00:00:00+01:00
     */
    public internal(set) var valuationDate: Date!
    
    /**
     * Variable symbol
     * Required
     * f.e. 0000000009
     */
    public internal(set) var variableSymbol: String!
    
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
        self.id <- map["id"]
        self.accountParty <- map["accountParty"]
        self.additionalTexts <- map["additionalTexts"]
        self.amount <- (map["amount"])
        self.amountSender <- map["amountSender"]
        self.bookingDate <- (map["bookingDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.cardNumber <- map["cardNumber"]
        self.constantSymbol <- map["constantSymbol"]
        self.currRateEURDate <- (map["currRateEURDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.currRateEURValue <- map["currRateEURValue"]
        self.description <- map["description"]
        self.descriptionEditable <- map["descriptionEditable"]
        self.paymentReference <- map["paymentReference"]
        self.payeeNote <- map["payeeNote"]
        self.payerNote <- map["payerNote"]
        self.specificSymbol <- map["specificSymbol"]
        self.state <- map["state"]
        self.timestampId <- map["timestampId"]
        self.transactionType <- map["transactionType"]
        self.valuationDate <- (map["valuationDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.variableSymbol <- map["variableSymbol"]
        super.mapping( map )
    }
}
