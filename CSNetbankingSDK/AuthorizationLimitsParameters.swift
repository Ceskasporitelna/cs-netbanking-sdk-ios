//
//  AuthorizationLimitsParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class AuthorizationLimitsParameters: Parameters
{
    /**
     * Channel for which limits are requested. Example: George
     */
    public var channel: String!
    
    //--------------------------------------------------------------------------
    public init(channel: String)
    {
        super.init()
        self.channel = channel
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params = super.toDictionary(existingParams)
        params ["channel"] = self.channel as AnyObject?
        return params
    }
}
