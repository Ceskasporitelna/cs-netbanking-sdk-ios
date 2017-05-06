//
//  InsurancesContractTransferResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractTransferResource: NetbankingResource, UpdateEnabled
{
    /**
     * Creates insurance transfer - premium payment, extra deposit or recommended deposit.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateContractTrasferRequest, callback: @escaping (_ result:CoreResult<UpdateContractTrasferResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
