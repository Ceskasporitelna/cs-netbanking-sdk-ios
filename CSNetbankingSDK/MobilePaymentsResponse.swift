//
//  MobilePaymentsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 22/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//


import CSCoreSDK

// MARK: -
//==============================================================================
public class MobilePaymentsResponse: MobilePaymentsRequest, Signable
{
    /**
     * Infomation about the signing
     */
    public internal(set) var signInfo:                   SignInfo?
    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                                  SigningObject?
    
    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                                  String {
        return self.resource.path
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init();
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.signInfo                         <- map["signInfo"]
        
        super.mapping( map )
    }
    
}
