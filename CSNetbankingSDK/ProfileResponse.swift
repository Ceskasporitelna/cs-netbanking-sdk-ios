//
//  ProfileResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class ProfileResponse: WebApiEntity
{
    /**
     * customer's id a.k.a cluid
     */
    public internal(set) var customerId:                            String!
    
    /**
     * number of institute
     */
    public internal(set) var instituteId:                           Int!
    
    /**
     * user's first name
     */
    public internal(set) var firstName:                             String!
    
    /**
     * user's last name
     */
    public internal(set) var lastName:                              String!
    
    /**
     * user's name used for salutation
     */
    public internal(set) var salutation:                            String?
    
    /**
     * Has the customer approved §107 telecommunication act. Possible values: ACCEPTED, NOT_ACCEPTED, UNKNOWN.
     */
    public internal(set) var marketingInfoAcceptance:               MarketingInfoAcceptance!
    
    /**
     * user's gender. Possible values: MALE, FEMALE, UNKNOWN.
     */
    public internal(set) var gender:                                Gender!
    
    /**
     * Date and time of the last login of customer. Common last login for all client applications - George, QC, etc.
     */
    public internal(set) var lastLogin:                             Date?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.customerId               = String()
        self.instituteId              = Int()
        self.firstName                = String()
        self.lastName                 = String()
        self.marketingInfoAcceptance  = .other(value: "")
        self.gender                   = .other(value: "")

    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.customerId              <- map["customerId"]
        self.instituteId             <- map["instituteId"]
        self.firstName               <- map["firstname"]
        self.lastName                <- map["lastname"]
        self.salutation              <- map["salutation"]
        self.marketingInfoAcceptance <- (map["marketingInfoAcceptance"], MarketingInfoAcceptance.transform())
        self.gender                  <- (map["gender"], Gender.transform())
        self.lastLogin               <- (map["lastlogin"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        
        super.mapping( map )
    }
}


