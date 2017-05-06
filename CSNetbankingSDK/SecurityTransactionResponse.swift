//
//  SecurityTransactionResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class SecurityTransactionResponse: WebApiEntity, Signable
{
    /**
     * Transaction data.
     */
    public internal (set) var transaction:         TransactionResponse!
    
    /**
     * Infomation about the signing
     */
    public var signInfo:                           SignInfo?

    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                            SigningObject?

    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                            String {
        return self.resource.path
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.transaction = TransactionResponse()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.signInfo                            <- map["signInfo"]
        self.transaction                         <- map["transaction"]
        
        super.mapping( map )
    }

}
