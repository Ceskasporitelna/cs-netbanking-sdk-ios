//
//  FundInfo.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class FundInfo: WebApiEntity
{
    /**
     * Unique code of fund. Mandatory.
     */
    public var code:                                  String?
    
    /**
     * Allocation. Mandatory.
     */
    public var allocation:                            Double?
 
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
        self.code                          <- map["code"]
        self.allocation                    <- map["allocation"]
        
        super.mapping( map )
    }
}
