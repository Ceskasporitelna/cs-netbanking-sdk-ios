//
//  AddNoteAndMarkTransactionRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 07/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class AddNoteAndMarkTransactionRequest: WebApiEntity
{
    /**
     * Personal, user specific note for transaction. Max. 4 000 characters. Optional.
     */
    public var note:                                                   String?

    /**
     * List of flags. Optional.
     */
    public var flags:                                                  [String]?
    
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
        self.note                             <- map["note"]
        self.flags                            <- map["flags"]
        
        super.mapping( map )
    }
    
}
