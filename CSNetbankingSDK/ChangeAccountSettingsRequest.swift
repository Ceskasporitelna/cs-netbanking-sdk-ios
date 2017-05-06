//
//  ChangeAccountSettingsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Change account settings request is used to update alias for account.
 */

//==============================================================================
public class ChangeAccountSettingsRequest: WebApiEntity
{
    /**
     * Account indentifier. Mandatory.
     */
    public internal(set) var  accountId:           String?
    
    /**
     * User defined account name. Max. 50 characters
     */
    public var  alias:                             String?
    
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
        self.accountId               <- map["accountId"]
        self.alias                   <- map["alias"]
        
        super.mapping( map )
    }

}
