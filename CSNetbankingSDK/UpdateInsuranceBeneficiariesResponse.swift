//
//  UpdateInsuranceBeneficiariesResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 22/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class UpdateInsuranceBeneficiariesResponse: WebApiEntity
{
    /**
     * Beneficiaries.
     */
    public var beneficiaries:               [InsuranceBeneficiary]!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.beneficiaries = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.beneficiaries             <- map["beneficiaries"]
        
        super.mapping( map )
    }
}
