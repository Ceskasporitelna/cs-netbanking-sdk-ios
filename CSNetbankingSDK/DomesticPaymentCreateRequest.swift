//
//  DomesticPaymentCreateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 21/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class DomesticPaymentCreateRequest: WebApiEntity
{
    /**
     * Name of the sender
     */
    public var senderName:                               String!
    
    /**
     * Account number of the sender.
     */
    public var sender:                                   DomesticPaymentAccount!
    
    /**
     * Name of the payee
     */
    public var receiverName:                             String!
    
    /**
     * Account number of payee
     */
    public var receiver:                                 DomesticPaymentAccount!
    
    /**
     * Payment order amount.
     */
    public var amount:                                   Amount!
    
    /**
     * Optional date (in the future) when this payment has to be done
     */
    public var transferDate:                             Date?
    
    /**
     * Message for payee set during payment order creation. It is used to identify transaction on receiver side. Array of texts 4x35
     */
    public var additionalInfo:                           Info?
    
    /**
     * Message for me set during payment order creation.
     */
    public var senderReference:                          String?
    
    /**
     * Information about the symbols
     */
    public var symbols:                                  Symbols?
    
    /**
     * Array of optional Flag values depends on Payment order category, type.
     */
    public var flags:                                   [String]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.senderName    = String()
        self.sender        = DomesticPaymentAccount()
        self.receiverName  = String()
        self.receiver      = DomesticPaymentAccount()
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
        self.senderName                       <- map["senderName"]
        self.sender                           <- map["sender"]
        self.receiverName                     <- map["receiverName"]
        self.receiver                         <- map["receiver"]
        self.amount                           <- map["amount"]
        self.transferDate                     <- (map["transferDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.additionalInfo                   <- map["additionalInfo"]
        self.senderReference                  <- map["senderReference"]
        self.symbols                          <- map["symbols"]
        self.flags                            <- map["flags"]
        
        
        
        super.mapping( map )
    }
}
