//
//  BundleResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class BundleResponse: WebApiEntity, Signable
{
    /**
     * Payment order identifier.
     */
    public internal (set) var id:                                      String!
    
    /**
     * Name of the bundle.
     */
    public internal (set) var name:                                    String!
    
    /**
     * Array of items in bundle. Every item represents payment order for batch sign.
     */
    public internal (set) var items:                                   [BundleItem]?
    
    
    /**
     * Infomation about the signing
     */
    public internal(set) var signInfo:                                 SignInfo?
    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                                                SigningObject?
    
    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                                                String {
        return self.resource.path
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id   = String()
        self.name = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                                  <- map["id"]
        self.name                                <- map["name"]
        self.items                               <- map["items"]
        self.signInfo                            <- map["signInfo"]
        
        super.mapping( map )
    }
}
