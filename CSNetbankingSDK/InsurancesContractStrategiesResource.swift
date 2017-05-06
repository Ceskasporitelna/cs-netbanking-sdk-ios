//
//  InsurancesContractStrategiesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractStrategiesResource: NetbankingResource, ListEnabled
{
    /**
     * Returns list of strategies with corresponsing funds allocation for the life insurance
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<ContractStrategyResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "strategies", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
