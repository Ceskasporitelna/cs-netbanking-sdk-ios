//
//  ContactAddress.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 27/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContactAddress: WebApiEntity
{
    /**
     * Address type. ENUM values: PERMANENT_RESIDENCE, SECONDARY_RESIDENCE, COMPANY_RESIDENCE, UNKNOWN
     */
    public internal (set) var type:                                  ContactAddressType!
    
    /**
     * Localized name of address type.
     */
    public internal (set) var typeI18N:                              String!
    
    /**
     * Contact address description
     */
    public internal (set) var description:                           String?
    
    /**
     * Get street of the address.
     */
    public internal (set) var street:                                String!
    
    /**
     * Get number which is unique in street. Not all localities have streets.
     */
    public internal (set) var streetNumber:                          String?
    
    /**
     * Get number which is unique in locality/town/village.
     */
    public internal (set) var buildingApartment:                     String?
    
    /**
     * Get zip code.
     */
    public internal (set) var zipCode:                               String!
    
    /**
     * Get city.
     */
    public internal (set) var city:                                  String!
    
    /**
     * Get country.
     */
    public internal (set) var country:                               String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.type         = .other(value: "")
        self.typeI18N     = String()
        self.street       = String()
        self.zipCode      = String()
        self.city         = String()
        self.country      = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.type                                    <- (map["type"], ContactAddressType.transform())
        self.typeI18N                                <- map["typeI18N"]
        self.description                             <- map["description"]
        self.street                                  <- map["street"]
        self.streetNumber                            <- map["streetNumber"]
        self.buildingApartment                       <- map["buildingApartment"]
        self.zipCode                                 <- map["zipCode"]
        self.city                                    <- map["city"]
        self.country                                 <- map["country"]
        
        super.mapping( map )
    }
}
