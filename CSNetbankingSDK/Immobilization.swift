//
//  Immobilization.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class Immobilization: WebApiEntity
{
    /**
     * Immobilization secures the loan agreement with this contract number
     */
    public internal (set) var contractNumber:                              String!
    
    /**
     * immobilization partner - third party name
     */
    public internal (set) var partner:                                     String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.contractNumber = String()
        self.partner        = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.contractNumber         <- map["contractNumber"]
        self.partner                <- map["partner"]
        
        super.mapping( map )
    }
}
