//
//  PaymentLimitResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 22/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PaymentLimitResponse: WebApiEntity
{
    /**
     * Authorization method type for which is limit defined. ENUM: tac, tan, sms, gridCard, eok, displayCard, mToken. Other local authorization type has to be defined.
     */
    public internal(set) var authorizationType:                        AuthorizationType!
    
    /**
     * ID of the channel for which is limit defined. ENUM: netBanking, mobileBanking, homeBanking, thirdParty, and unknown - remaining limit amount valid for all channels, not particulary defined.
     */
    public internal(set) var channelId:                                ChannelId!
    
    /**
     * ID of the application for which is limit defined. ENUM: George, InternetBanking and unknown - remaining limit amount valid for all applications, not particulary defined.
     */
    public internal(set) var applicationId:                            ApplicationId!
    
    /**
     * Remaining Daily amount which can be transferred using particular authorization method and channel (_embedded AMOUNT type).
     */
    public internal(set) var remainingAmount:                          Amount!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.authorizationType = .other(value: "")
        self.channelId         = .other(value: "")
        self.applicationId     = .other(value: "")
        self.remainingAmount   = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.authorizationType                <- (map["authorizationType"], AuthorizationType.transform())
        self.channelId                        <- (map["channelId"], ChannelId.transform())
        self.applicationId                    <- (map["applicationId"], ApplicationId.transform())
        self.remainingAmount                  <- map["remainingAmount"]
        
        super.mapping( map )
    }
}
