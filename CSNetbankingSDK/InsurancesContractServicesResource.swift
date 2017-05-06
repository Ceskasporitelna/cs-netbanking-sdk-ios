//
//  InsurancesContractServicesResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractServicesResource: NetbankingResource, ListEnabled
{
    /**
     * Returns list of services for the life insurance
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<InsuranceService>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "services", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Allows activation of risk sports insurance.
     */
    //--------------------------------------------------------------------------
    public func activateRiskSports(_ request: ActivateRiskSportsRequest, callback: @escaping (_ result:CoreResult<ActivateRiskSportsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, pathSuffix: "riskSportsActivation", payload: request, transform: nil, callback: callback)
    }
    
    /**
     * Allows deactivation of risk sports insurance.
     */
    //--------------------------------------------------------------------------
    public func deactivateRiskSports(_ request: ActivateRiskSportsRequest, callback: @escaping (_ result:CoreResult<DeactivateRiskSportsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, pathSuffix: "riskSportsDeactivation", payload: request, transform: nil, callback: callback)
    }
}
