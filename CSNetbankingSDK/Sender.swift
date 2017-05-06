//
//  Sender.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 06/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class Sender: WebApiEntity
{
    /**
     * Identification of the source account for the transfer.
     */
    public var id:                                       String?
    
    /**
     * Account number of the source account for the transfer.
     */
    public var accountno:                                AccountNumber!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.accountno = AccountNumber()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- map["id"]
        self.accountno                        <- map["accountno"]
        
        super.mapping( map )
    }
    
}
