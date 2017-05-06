//
//  DomesticPaymentUpdateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 21/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class DomesticPaymentUpdateRequest: DomesticPaymentCreateRequest
{
    /**
     * Status of the payment order (details above), State of payment order presented to user on FE). Possible values: public, SPOOLED, CANCELLED, CLOSED and DELETED
     */
    public var state:                                    PaymentState?
    
    /**
     * State detail of payment order provided based on BE technical states.
     */
    public var stateDetail:                              String?
    
    /**
     * Indicator whether state (stateDetail value) of payment order is OK from user point of view. For mapping between stateDetail and stateOk indicator values see table below.
     */
    public var stateOk:                                  Bool?
    
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
        self.state                            <- (map["state"], PaymentState.transform())
        self.stateDetail                      <- map["stateDetail"]
        self.stateOk                          <- map["stateOk"]
        
        super.mapping( map )
    }
}
