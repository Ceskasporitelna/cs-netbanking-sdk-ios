//
//  UpdateContractTrasferRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class UpdateContractTrasferRequest: WebApiEntity
{
    /**
     * Type of the transfer. Possible values are PAY_PREMIUM, EXTRA_DEPOSIT, RECOMMENDED_DEPOSIT. Mandatory.
     */
    public var type:                       InsuranceTransferType?
    
    /**
     * Amount which should be transfered. Mandatory.
     */
    public var amount:                     Amount?
    
    /**
     * Sender account. Mandatory.
     */
    public var sender:                     AccountNumber?
    
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
        self.type                   <- (map["type"], InsuranceTransferType.transform())
        self.amount                 <- map["amount"]
        self.sender                 <- map["sender"]
        
        super.mapping( map )
    }
}
