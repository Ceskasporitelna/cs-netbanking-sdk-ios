//
//  InsuranceDetailResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class InsuranceDetailResponse: InsuranceResponse
{
    /**
     * Additional description of insurance product, additional charges, index applied to insurance contract
     */
    public internal (set) var description:                        String?
    
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
        self.description              <- map["description"]
        
        super.mapping( map )
    }

}
