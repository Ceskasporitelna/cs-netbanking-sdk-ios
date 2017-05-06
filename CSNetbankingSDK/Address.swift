//
//  Address.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class Address: WebApiEntity
{
    /**
     * Street of the address.
     */
    public internal (set) var street:                                   String?
    
    /**
     * Number which is unique in street. Not all localities have streets.
     */
    public internal (set) var streetNumber:                             String?
    
    /**
     * Number which is unique in locality/town/village.
     */
    public internal (set) var buildingApartment:                        String?
    
    /**
     * Zip code of the address.
     */
    public internal (set) var zipCode:                                  String?
    
    /**
     * City
     */
    public internal (set) var city:                                     String!
    
    /**
     * Address country.
     */
    public internal (set) var country:                                  String!
    
    /**
     * Address description
     */
    public internal (set) var description:                              String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.city    = String()
        self.country = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.street                              <- map["street"]
        self.streetNumber                        <- map["streetNumber"]
        self.buildingApartment                   <- map["buildingApartment"]
        self.zipCode                             <- map["zipCode"]
        self.city                                <- map["city"]
        self.country                             <- map["country"]
        self.description                         <- map["description"]
        
        super.mapping( map )
    }
}

