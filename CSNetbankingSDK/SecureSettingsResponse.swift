//
//  SecureSettingsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 06/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class SecureSettingsResponse: WebApiEntity
{
    /**
     * 3D secure functionality status. Possible Values: OK, NOT_ACTIVATED
     */
    public internal (set) var status:                                   SecureSettingsStatus?
    
    /**
     * Personal Assurance Message (PAM) that user chose when activate 3D secure
     */
    public internal (set) var pam:                                      String?
    
    /**
     * Phone (used for OTP authentification) number Id coming from Contacts
     */
    public internal (set) var phoneNumber:                              String?
    
    /**
     * 3D Secure language
     */
    public internal (set) var language:                                 String?
    
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
        self.status                           <- (map["status"], SecureSettingsStatus.transform())
        self.pam                              <- map["pam"]
        self.phoneNumber                      <- map["phoneNumber"]
        self.language                         <- map["language"]
        
        super.mapping( map )
    }
    
}
