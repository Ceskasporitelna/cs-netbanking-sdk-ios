//
//  PhoneNumberUpdateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class PhoneNumberUpdateRequest: PhoneNumberCreateRequest
{
    /**
     * Phone book entry identifier. Mandatory, will be filled in the resource.
     */
    public internal (set) var id:                                String?

    
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
        self.id                               <- map["id"]
        
        super.mapping( map )
    }
    
}
