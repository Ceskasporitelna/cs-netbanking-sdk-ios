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
        super.mapping( map )
    }
}
