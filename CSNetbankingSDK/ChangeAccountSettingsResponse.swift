//
//  ChangeAccountSettingsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 17/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Signed account provides information about Signed Account. 
 */
//==============================================================================
public class ChangeAccountSettingsResponse: MainAccountResponse, Signable
{
    
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
        super.mapping( map )
    }
}
