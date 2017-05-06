//
//  InsurancesContractFundsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractFundsResource: NetbankingResource, UpdateEnabled
{
    /**
     * Returns detail of distribution of capital value into funds.
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<FundListResponse>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Change the distribution of capital value into funds.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateFundRequest, callback: @escaping (_ result:CoreResult<UpdateFundResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
    
}

