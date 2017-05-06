//
//  ReservationResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Reservation provides information about reservation.
 */
//==============================================================================
public class ReservationResponse: WebApiEntity
{
    /**
     * Type of reservation. Possible values are CASH_WITHDRAWAL, PAYMENT, CARD_PAYMENT, OTHER
     */
    public internal(set) var type:                                 ReservationType!
    
    /**
     * Reservation status. Possible values are RESERVED, CANCELLED, EXPIRED. Currently only reservations with status RESERVED are supported.
     */
    public internal(set) var status:                               ReservationStatus!
    
    /**
     * Transaction date and time.
     */
    public internal(set) var creationDate:                         Date!
    
    /**
     * Reservation expiration date.
     */
    public internal(set) var expirationDate:                       Date?
    
    /**
     * Merchant Name / ATM.
     */
    public internal(set) var merchantName:                         String?
    
    /**
     * Merchant address.
     */
    public internal(set) var czMerchantAddress:                    String?
    
    /**
     * Reservation description, additional info.
     */
    public internal(set) var description:                          String!
    
    /**
     * The amount of reservation in account's currency
     */
    public internal(set) var amount:                               Amount!
    
    /**
     * The amount of the reservation in transaction currency
     */
    public internal(set) var amountSender:                         Amount?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.type            = .other(value: "")
        self.status          = .other(value: "")
        self.creationDate    = Date()
        self.description     = String()
        self.amount          = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.type                    <- (map["type"], ReservationType.transform())
        self.status                  <- (map["status"], ReservationStatus.transform())
        self.creationDate            <- (map["creationDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.expirationDate          <- (map["expirationDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.merchantName            <- map["merchantName"]
        self.czMerchantAddress       <- map["cz-merchantAddress"]
        self.description             <- map["description"]
        self.amount                  <- map["amount"]
        self.amountSender            <- map["amountSender"]
        
        super.mapping( map )
    }
}
