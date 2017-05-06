//
//  InsurancesContractInsureesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractInsureesResource: NetbankingResource, ListEnabled
{
    /**
     * Returns list of insurees related to the insurance contract.
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<InsureeResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "insurees", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
    
}

