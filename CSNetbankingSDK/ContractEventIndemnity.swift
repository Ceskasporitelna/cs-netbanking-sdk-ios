//
//  ContractEventIndemnity.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContractEventIndemnity: WebApiEntity
{
    /**
     * Date of the payment was paid out.
     */
    public internal (set) var paymentDate:                  Date!
    
    /**
     * Method of the transfer.
     */
    public internal (set) var transferMethod:               String!
    
    /**
     * Receiver name.
     */
    public internal (set) var receiverName:                 String!
    
    /**
     * Paid indemnity value.
     */
    public internal (set) var amount:                       Amount!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.paymentDate     = Date()
        self.transferMethod  = String()
        self.receiverName    = String()
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
        self.paymentDate                <- (map["paymentDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.transferMethod             <- map["transferMethod"]
        self.receiverName               <- map["receiverName"]
        self.amount                     <- map["amount"]
        
        super.mapping( map )
    }

}
