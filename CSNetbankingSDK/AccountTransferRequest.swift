//
//  TransferRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Account transfer.
 */
//==============================================================================
public class AccountTransferRequest: WebApiEntity
{
    /**
     * Type of the transfer. Currently only REVOLVING_LOAN_DISBURSEMENT is supported. Mandatory.
     */
    public var type:                                                  AccountsTransferType?
    
    /**
     * Amount which should be transfered. Mandatory.
     */
    public var amount:                                                Amount?
    
    /**
     * Payment transfer date. Mandatory.
     */
    public var transferDate:                                          Date?
    
    /**
     * Note for the recipient. Optional.
     */
    public var recipientNote:                                         String?
    
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
        self.type                    <- (map["type"], AccountsTransferType.transform())
        self.amount                  <- map["amount"]
        self.transferDate            <- (map["transferDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.recipientNote           <- map["recipientNote"]
        
        super.mapping( map )
    }
    
}
