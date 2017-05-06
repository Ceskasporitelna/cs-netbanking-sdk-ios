//
//  UpdatePensionRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class UpdatePensionRequest: WebApiEntity
{
    /**
     * Product unique identifier. Mandatory.
     */
    public internal (set) var id:                      String?
    
    /**
     * User defined account name. Max. 50 characters. Optional.
     */
    public var alias:                                  String?
    
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
        self.id                                      <- map["id"]
        self.alias                                   <- map["alias"]
        
        super.mapping( map )
    }
    
}
