//
//  BundleCreateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class BundleCreateRequest: WebApiEntity
{
    /**
     * Name of the bundle.
     */
    public var name:                                   String?
    
    /**
     * Array of items in bundle. Every item represents payment order for batch sign.
     */
    public var items:                                  [BundleItem]?
    
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
        self.name                                <- map["name"]
        self.items                               <- map["items"]
        
        super.mapping( map )
    }
}

