//
//  AuthorizationLimitResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class AuthorizationLimitResponse: WebApiEntity
{
    /**
     * Internal ID for limit definition for authorization type, channel, application. 
     * If internal ID doesn't exist, ID could be generated using authorizationType, channelId and applicationId values.
     */
    public internal (set) var id:                                               String!
    
    /**
     * Authorization method type for which is limit defined. ENUM: tac, tan, sms, 
     * gridCard, eok, displayCard, mToken other local authorization type has to be defined.
     */
    public internal (set) var authorizationType:                                AuthorizationType!
    
    /**
     * ID of the channel for which is limit defined. ENUM: netBanking, mobileBanking, 
     * homeBanking, thirdParty, and unknown - limit valid for all channels, not particulary defined.
     */
    public internal (set) var channelId:                                        ChannelId!
    
    /**
     * ID of the application for which is limit defined. ENUM: George, 
     * InternetBanking and unknown - limit valid for all applications, not particulary defined.
     */
    public internal (set) var applicationId:                                    ApplicationId!
    
    /**
     * Daily limit for particular authorization method (_embedded AMOUNT type)
     */
    public internal (set) var dailyLimit:                                       Amount?
    
    /**
     * Transaction limit for particular authorization method.
     */
    public internal (set) var transactionLimit:                                 Amount?
    
    /**
     * Maximal daily limit for authorization method defined by bank.
     */
    public internal (set) var maxBankLimit:                                     Amount?
    
    /**
     * Convenience method for fetching authorization limit detail.
     */
    public var authorizationLimitResource: AuthorizationLimitResource {
        return (self.resource.client as! NetbankingClient).authorizationLimits.withId(self.id as AnyObject)
    }
    
    /**
     * Convenience method for fetching authorization limit detail.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<AuthorizationLimitResponse>) -> ())
    {
        self.authorizationLimitResource.get(callback)
    }

    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id                 = String()
        self.authorizationType  = .other(value: "")
        self.channelId          = .other(value: "")
        self.applicationId      = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                   <- map["id"]
        self.authorizationType    <- (map["authorizationType"], AuthorizationType.transform())
        self.channelId            <- (map["channelId"], ChannelId.transform())
        self.applicationId        <- (map["applicationId"], ApplicationId.transform())
        self.dailyLimit           <- map["dailyLimit"]
        self.transactionLimit     <- map["transactionLimit"]
        self.maxBankLimit         <- map["maxBankLimit"]
        
        super.mapping( map )
    }
    
}
