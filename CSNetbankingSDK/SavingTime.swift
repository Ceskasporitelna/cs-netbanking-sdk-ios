//
//  SavingTime.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class SavingTime: WebApiEntity
{
    /**
     * Supplementary pension saving time.
     */
    public internal (set) var supplementary:                              Double?
    
    /**
     * Old-age pension saving time.
     */
    public internal (set) var oldAge:                                     Double?
    
    /**
     * Early-retirement saving time.
     */
    public internal (set) var earlyRetirement:                            Double?
    
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
        self.supplementary            <- map["supplementary"]
        self.oldAge                   <- map["oldAge"]
        self.earlyRetirement          <- map["earlyRetirement"]
        
        super.mapping( map )
    }
}
