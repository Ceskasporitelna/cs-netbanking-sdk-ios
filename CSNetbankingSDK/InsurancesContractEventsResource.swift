//
//  InsurancesContractEventsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractEventsResource: NetbankingResource, ListEnabled
{
    /**
     * Returns list of events for the life insurance
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<ContractEvent>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "events", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
