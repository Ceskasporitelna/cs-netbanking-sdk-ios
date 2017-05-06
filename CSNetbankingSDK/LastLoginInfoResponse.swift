//
//  LastLoginInfoResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class LastLoginInfoResponse: WebApiEntity
{
    /**
     * Channel of the last login.
     */
    public internal(set) var channel: String!
    
    /**
     * Date of the last login.
     */
    public internal(set) var lastLogin: Date!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.channel               = String()
        self.lastLogin             = Date()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.channel                 <- map["channel"]
        self.lastLogin               <- (map["lastlogin"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        
        super.mapping( map )
    }
}

