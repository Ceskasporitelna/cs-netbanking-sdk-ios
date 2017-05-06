//
//  TaxPaymentTemplate.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class TaxPaymentTemplate: WebApiEntity
{
    /**
     * Symbols (Variable symbol)
     */
    public internal (set) var symbols:                                       Symbol?
    
    /**
     * Receiver account number
     */
    public internal (set) var receiver:                                      AccountNumber?
    
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
        self.symbols                <- map["symbols"]
        self.receiver               <- map["receiver"]
        
        super.mapping( map )
    }
    
}
