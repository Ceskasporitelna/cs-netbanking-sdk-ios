//
//  TransferReceiver.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Transfer receiver provides information about Transfer receiver.
 */
//==============================================================================
public class TransferReceiver: WebApiEntity
{
    /**
     * Identifier of the account which is allowed as a transfer receiver. If id is specified then you can find it among other accounts in GET /netbanking/my/accounts response.
     */
    public internal(set) var id:                                         String!
    
    /**
     * Account number which is allowed as a transfer receiver.
     */
    public internal(set) var accountNo:                                  AccountNumber!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id          = String()
        self.accountNo   = AccountNumber()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                          <- map["id"]
        self.accountNo                   <- map["accountno"]
        
        super.mapping( map )
    }
}

