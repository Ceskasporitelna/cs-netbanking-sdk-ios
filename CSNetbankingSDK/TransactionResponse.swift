//
//  TransactionResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class TransactionResponse: WebApiEntity
{
    
    /**
     * Transaction identifier.
     */
    public internal(set) var id:                                        String!
    
    /**
     * Personal, user specific note for transaction. Max. 4 000 characters.
     */
    public internal(set) var note:                                      String?
    
    /**
     * List of flags.
     */
    public internal(set) var flags:                                     [String]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id = String()
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
        self.note                             <- map["note"]
        self.flags                            <- map["flags"]
        
        super.mapping( map )
    }
    
}
