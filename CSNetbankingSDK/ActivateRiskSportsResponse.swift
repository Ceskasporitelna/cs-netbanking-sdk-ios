//
//  ActivateRiskSportsResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ActivateRiskSportsResponse: WebApiEntity, Signable
{
    /**
     * Starting date of active service.
     */
    public internal (set) var dateFrom:                  Date!
    
    /**
     * Ending date of active service.
     */
    public internal (set) var dateTo:                    Date!
    
    /**
     * Emergency phone number?
     */
    public internal (set) var phoneNumber:               String!

    
    public var policyNumber:                             String!
    
    /**
     * Infomation about the signing
     */
    public var signInfo:                                 SignInfo?
    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                                  SigningObject?
    
    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                                  String {
        return self.resource.path
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.policyNumber = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.dateFrom                    <- (map["dateFrom"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.dateTo                      <- (map["dateTo"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.phoneNumber                 <- map["phoneNumber"]
        self.policyNumber                <- map["policyNumber"]
        self.signInfo                    <- map["signInfo"]
        
        super.mapping( map )
    }
}
