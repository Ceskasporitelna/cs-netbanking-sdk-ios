//
//  MobilePaymentsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 22/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class MobilePaymentsRequest: WebApiEntity
{
    /**
     * Type of mobile payment depending on provider of mobile services. Possible values: TOP_UP (for all operators) and INVOICE, VODAFONE_PAYMENT, MOBILE_DEPOSIT (for Vodafone). Mandatory.
     */
    public var paymentType:                              MobilePaymentType?
    
    /**
     * Phone number. Mandatory.
     */
    public var phoneNumber:                              String?
    
    /**
     * Sender name. Mandatory.
     */
    public var sender:                                   MobilePaymentSender?
    
    /**
     * Payment amount. Mandatory.
     */
    public var amount:                                   Amount?
    
    /**
     * Invoice number used as identifier of mobile payment on mobile service provider side (only for paymentType: INVOICE). Optional.
     */
    public var invoiceNumber:                            String?
    
    /**
     * Phone number used for sending of confirmation of mobile payment execution. Not available for paymentType: INVOICE. Mandatory.
     */
    public var confirmationPhoneNumber:                  String?
    
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
        self.paymentType                      <- (map["paymentType"], MobilePaymentType.transform())
        self.phoneNumber                      <- map["phoneNumber"]
        self.sender                           <- map["sender"]
        self.amount                           <- map["amount"]
        self.invoiceNumber                    <- map["invoiceNumber"]
        self.confirmationPhoneNumber          <- map["confirmationPhoneNumber"]
        
        super.mapping( map )
    }
    
}
