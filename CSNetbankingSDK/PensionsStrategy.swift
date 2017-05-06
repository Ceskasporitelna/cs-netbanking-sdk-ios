//
//  PensionsStrategy.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class PensionsStrategy: WebApiEntity
{
    /**
     * Conservative strategy share. Value in percentage, e.g. 0,5 will be displayed as 0,5 %.
     */
    public var conservative:                             Double?
    
    /**
     * Balanced strategy share. Value in percentage, e.g. 0,5 will be displayed as 0,5 %.
     */
    public var balanced:                                 Double?
    
    /**
     * Dynamic strategy share. Value in percentage, e.g. 0,5 will be displayed as 0,5 %.
     */
    public var dynamic:                                  Double?
    
    /**
     * State bonds strategy share. Value in percentage, e.g. 0,5 will be displayed as 0,5 %.
     */
    public var stateBonds:                               Double?
    
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
        self.conservative                   <- map["conservative"]
        self.balanced                       <- map["balanced"]
        self.dynamic                        <- map["dynamic"]
        self.stateBonds                     <- map["stateBonds"]
        
        super.mapping( map )
    }
}
