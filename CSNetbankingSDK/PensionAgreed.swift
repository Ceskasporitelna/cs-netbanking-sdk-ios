//
//  PensionAgreed.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class PensionAgreed: WebApiEntity
{
    /**
     * Indication whether old-age pension has been agreed.
     */
    public internal (set) var oldAge:                            Bool?
    
    /**
     * Indication whether disability pension has been agreed.
     */
    public internal (set) var disability:                        Bool?
    
    /**
     * Indication whether early-retirement pension has been agreed.
     */
    public internal (set) var earlyRetirement:                   Bool?
    
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
        self.oldAge                   <- map["oldAge"]
        self.disability               <- map["disability"]
        self.earlyRetirement          <- map["earlyRetirement"]
        
        super.mapping( map )
    }
}
