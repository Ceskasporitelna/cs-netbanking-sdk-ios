//
//  ContractPaymentList.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 27/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContractPaymentList: WebApiEntity
{
    /**
     * Array of contract payments.
     */
    public internal (set) var payments:                     [ContractPayment]?
    
    /**
     * Array of flags for funds.
     */
    public internal (set) var flags:                        [String]?
    
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
        self.payments                                <- map["payments"]
        self.flags                                   <- map["flags"]
        
        super.mapping( map )
    }

}
