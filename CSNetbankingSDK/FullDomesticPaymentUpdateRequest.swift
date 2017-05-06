//
//  FullDomesticPaymentUpdateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class FullDomesticPaymentUpdateRequest: DomesticPaymentUpdateRequest
{
    /**
     * Internal identifier of payment order. Note that after signing of the order the id could change.
     * Mandatory, will be set in the resource.
     */
    public internal (set) var id:                           String?
    
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
        self.id                        <- map["id"]
        
        super.mapping( map )
    }
    
    
}
