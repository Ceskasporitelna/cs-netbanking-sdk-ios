//
//  Info.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class Info: WebApiEntity
{
    /**
     * Message for payee set during payment order creation. It is used to identify transaction on receiver side. Array of texts 4x35.
     */
    public var text4x35:                                 [String]?
    
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
        self.text4x35                         <- map["text4x35"]
        
        super.mapping( map )
    }
    
}
