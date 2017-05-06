//
//  AddNoteAndMarkCardTransactionResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class AddNoteAndMarkCardTransactionResponse: WebApiEntity, Signable
{
    /**
     * Transactions information
     */
    public internal(set) var cardTransaction:            TransactionResponse!
    
    /**
     * Infomation about the signing
     */
    public internal(set) var signInfo:                   SignInfo?
    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                                  SigningObject?
    
    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                                  String {
        return "/../"
    }

    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.cardTransaction = TransactionResponse()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.cardTransaction                  <- map["cardTransaction"]
        self.signInfo                         <- map["signInfo"]
        
        super.mapping( map )
    }
}
