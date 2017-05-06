//
//  PaymentBookingDateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 11/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PaymentBookingDateRequest: WebApiEntity
{
    
    /**
     * Account's ID. Mandatory, will be set in the resource.
     */
    public internal (set) var accountId:                 String?
    
    /**
     * Receiver's account number. Optional.
     */
    public var receiver:                                 AccountNumber?
    
    /**
     * Payment order priority selected by user, ENUM values: URGENT (for express payments), STANDARD. Optional.
     */
    public var priority:                                 PaymentOrderPriority?
    
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
        self.accountId                        <- map["accountId"]
        self.receiver                         <- map["receiver"]
        self.priority                         <- (map["priority"], PaymentOrderPriority.transform())
        
        super.mapping( map )
    }
    
}
