//
//  Supplementary.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class Supplementary: WebApiEntity
{
    /**
     * Email used for electronic communication.
     */
    public internal (set) var email:                             String?
    
    /**
     * Phone number used for sms communication.
     */
    public internal (set) var sms:                               String?
    
    /**
     * Indication whether maximum service is set up.
     */
    public internal (set) var maxService:                        Bool?
    
    /**
     * Indication whether optimum service is set up.
     */
    public internal (set) var optService:                        Bool?
    
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
        self.email               <- map["email"]
        self.sms                 <- map["sms"]
        self.maxService          <- map["maxService"]
        self.optService          <- map["optService"]
        
        super.mapping( map )
    }
}
