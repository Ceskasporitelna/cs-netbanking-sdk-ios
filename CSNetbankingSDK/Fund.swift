//
//  Fund.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class Fund: WebApiEntity
{
    /**
     * Unique code of fund.
     */
    public var code:                                      String!
    
    /**
     * Name of fund.
     */
    public var name:                                      String!
    
    /**
     * Current value invested into fund in CZK
     */
    public var investedAmount:                            Amount!
    
    /**
     * Current value invested into fund in %.
     */
    public var investedShare:                             Double!
    
    /**
     * The rate at which the savings component of the premium will be invested in selected funds.Value in percentage, e.g. 63 will be displayed as 63 %.
     */
    public var allocation:                                Double!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.code            = String()
        self.name            = String()
        self.investedAmount  = Amount()
        self.investedShare   = Double()
        self.allocation      = Double()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.code                          <- map["code"]
        self.name                          <- map["name"]
        self.investedAmount                <- map["investedAmount"]
        self.investedShare                 <- map["investedShare"]
        self.allocation                    <- map["allocation"]
        
        super.mapping( map )
    }
}
