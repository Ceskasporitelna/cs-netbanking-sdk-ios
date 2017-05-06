//
//  InsurancesContractBeneficiariesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractBeneficiariesResource: NetbankingResource, UpdateEnabled
{
    /**
     * Returns list of beneficiaries related to the insurance contract.
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<InsuranceBeneficiaryList>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Change beneficiaries and distribution of insurance among beneficiaries.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateInsuranceBeneficiariesRequest, callback: @escaping (_ result:CoreResult<UpdateInsuranceBeneficiariesResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}

