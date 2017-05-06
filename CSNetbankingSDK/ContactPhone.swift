//
//  ContactPhone.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContactPhone: WebApiEntity
{
    /**
     * Phone type. ENUM: PRIVATE, COMPANY, UNKNOWN
     */
    public internal (set) var type:                                          ContactPhoneType!
    
    /**
     * Localized name of phone type.
     */
    public internal (set) var typeI18N:                                      String!
    
    /**
     * Country calling code as international phone number prefix. E.g.: "0043" or "+43", "00420" or "+420", "00421" or "+421"
     */
    public internal (set) var countryCallingCode:                            String!
    
    /**
     * Phone number
     */
    public internal (set) var phoneNumber:                                   String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.type                 = .other(value: "")
        self.typeI18N             = String()
        self.countryCallingCode   = String()
        self.phoneNumber          = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.type                     <- (map["type"], ContactPhoneType.transform())
        self.typeI18N                 <- map["typeI18N"]
        self.countryCallingCode       <- map["countryCallingCode"]
        self.phoneNumber              <- map["phoneNumber"]
        
        super.mapping( map )
    }
}
