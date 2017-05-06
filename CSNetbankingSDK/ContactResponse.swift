//
//  ContactResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContactResponse: WebApiEntity
{
    /**
     * Contact ID
     */
    public internal (set) var id:                             String!
    
    /**
     * Type of contact. ENUM values: ADDRESS, PHONE, EMAIL, FAX.
     */
    public internal (set) var type:                           ContactType!
    
    /**
     * Contact flags
     */
    public internal (set) var flags:                          [String]?
    
    /**
     * Contact address
     */
    public internal (set) var address:                        ContactAddress?
    
    /**
     * Contact phone
     */
    public internal (set) var phone:                          ContactPhone?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id   = String()
        self.type = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                       <- map["id"]
        self.type                     <- (map["type"], ContactType.transform())
        self.flags                    <- map["flags"]
        self.address                  <- map["address"]
        self.phone                    <- map["phone"]
        
        super.mapping( map )
    }
    
}
