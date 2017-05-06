//
//  CardActionRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class CardActionRequest: WebApiEntity
{
    /**
     * Action which should be issued. Possible values are "REISSUE_PIN", "LOCK_CARD", 
     * "UNLOCK_CARD", "REPLACE_CARD", "ACTIVATE_CARD", "SET_AUTOMATIC_REPLACEMENT_ON", 
     * "SET_AUTOMATIC_REPLACEMENT_OFF".
     * Mandatory.
     */
    public var action:                                                 CardAction?
    
    /**
     * Reason why card should be locked. Possible values are "THEFT" and "LOSS". Relevant only for action "LOCK_CARD". Optional.
     */
    public var lockReason:                                             LockReason?
    
    /**
     * Information about the confirmation. Optional.
     */
    public var confirmations:                                          [Confirmation]?
    
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
        self.action                           <- (map["action"], CardAction.transform())
        self.lockReason                       <- (map["lockReason"], LockReason.transform())
        self.confirmations                    <- map["confirmations"]
        
        super.mapping( map )
    }
    
}
