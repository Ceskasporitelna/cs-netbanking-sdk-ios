//
//  Symbols.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class Symbols: WebApiEntity
{
    
    /**
     * variable symbol
     */
    public var variableSymbol:                           String?
    
    /**
     * constant symbol
     */
    public var constantSymbol:                           String?
    
    /**
     * specific symbol
     */
    public var specificSymbol:                           String?
    
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
        self.variableSymbol                   <- map["variableSymbol"]
        self.constantSymbol                   <- map["constantSymbol"]
        self.specificSymbol                   <- map["specificSymbol"]
        
        super.mapping( map )
    }
    
}
