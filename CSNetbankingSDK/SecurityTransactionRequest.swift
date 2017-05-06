//
//  SecurityTransactionRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class SecurityTransactionRequest: WebApiEntity
{
    /**
     * Transaction identifier. Mandatory, will be set in the resource. 
     */
    public internal (set) var id:                String?
    
    /**
     * Personal, user specific note for transaction. Max. 4 000 characters. Optional.
     */
    public var note:                            String?
    
    /**
     * List of flags. Optional.
     */
    public var flags:                           [String]?
    
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
        self.id                       <- map["id"]
        self.note                     <- map["note"]
        self.flags                    <- map["flags"]
        
        super.mapping( map )
    }
}
