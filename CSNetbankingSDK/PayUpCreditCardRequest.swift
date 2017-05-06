//
//  PayUpCreditCardRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 06/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PayUpCreditCardRequest: WebApiEntity
{
    /**
     * Type of the transfer. Currently only DEBT_REPAYMENT is supported. Mandatory.
     */
    public var type:                                                   CardTransferType?
    
    /**
     * Information about the sender. Mandatory.
     */
    public var sender:                                                 Sender?
    
    /**
     * Amount which should be transfered. Mandatory.
     */
    public var amount:                                                 Amount?
    
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
        self.type                             <- (map["type"], CardTransferType.transform())
        self.sender                           <- map["sender"]
        self.amount                           <- map["amount"]
        
        super.mapping( map )
    }
}
