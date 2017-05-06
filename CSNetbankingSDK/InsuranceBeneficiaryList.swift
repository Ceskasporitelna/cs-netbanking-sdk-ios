//
//  InsuranceBeneficiaryList.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 27/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class InsuranceBeneficiaryList: WebApiEntity
{
    public internal (set) var beneficiaries:          [InsuranceBeneficiary]?
    
    public internal (set) var flags:                  [String]?
    
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
        self.beneficiaries                           <- map["beneficiaries"]
        self.flags                                   <- map["flags"]
        
        super.mapping( map )
    }
}
