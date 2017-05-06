//
//  InsureeResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class InsureeResponse: WebApiEntity
{
    /**
     * Unique ID of the person related to the insurance contract. 
     * ID is hashed combination of contract number and birthnumber of the person: contractNumber_birthnumber.
     */
    public internal (set) var id:                                   String!
    
    /**
     * Type of person related to the insurance contract. 3 possible values: POLICYHOLDER, INSURED_PERSON, CHILD.
     */
    public internal (set) var type:                                 String!
    
    /**
     * Name of the person related to the insurance contract.
     */
    public internal (set) var name:                                 String!
    
    /**
     * Contact address.
     */
    public internal (set) var addresses:                            [ContactAddress]!
    
    /**
     * Birthnumber of the person related to the insurance contract.
     */
    public internal (set) var birthNumber:                          String!
    
    /**
     * Phone number of the person related to the insurance contract.
     */
    public internal (set) var phoneNumber:                          String?
    
    /**
     * Email address of the person related to the insurance contract.
     */
    public internal (set) var email:                                String?
    
    /**
     * Insuree risks.
     */
    public internal (set) var risks:                                [Risk]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id           = String()
        self.type         = String()
        self.name         = String()
        self.addresses    = []
        self.birthNumber  = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                         <- map["id"]
        self.type                       <- map["type"]
        self.name                       <- map["name"]
        self.addresses                  <- map["addresses"]
        self.birthNumber                <- map["birthnumber"]
        self.phoneNumber                <- map["phoneNumber"]
        self.email                      <- map["email"]
        self.risks                      <- map["risks"]
        
        super.mapping( map )
    }
}
