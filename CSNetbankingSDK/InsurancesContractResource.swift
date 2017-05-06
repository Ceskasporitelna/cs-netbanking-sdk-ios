//
//  InsurancesContractResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class InsurancesContractResource: NetbankingInstanceResource, GetEnabled, UpdateEnabled
{
    /**
     * Returns funds resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var funds: InsurancesContractFundsResource {
        return InsurancesContractFundsResource(path: self.path + "/funds", client: self.client)
    }
    
    /**
     * Returns beneficiaries resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var beneficiaries: InsurancesContractBeneficiariesResource {
        return InsurancesContractBeneficiariesResource(path: self.path + "/beneficiaries", client: self.client)
    }
    
    /**
     * Returns insurees resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var insurees: InsurancesContractInsureesResource {
        return InsurancesContractInsureesResource(path: self.path + "/insurees", client: self.client)
    }
    
    /**
     * Returns payments resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var payments: InsurancesContractPaymentsResource {
        return InsurancesContractPaymentsResource(path: self.path + "/payments", client: self.client)
    }
    
    /**
     * Returns services resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var services: InsurancesContractServicesResource {
        return InsurancesContractServicesResource(path: self.path + "/services", client: self.client)
    }
    
    /**
     * Returns events resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var events: InsurancesContractEventsResource {
        return InsurancesContractEventsResource(path: self.path + "/events", client: self.client)
    }
    
    /**
     * Returns taxBenefits resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var taxBenefits: InsurancesContractTaxBenefitsResource {
        return InsurancesContractTaxBenefitsResource(path: self.path + "/taxBenefits", client: self.client)
    }
    
    /**
     * Returns strategies resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var strategies: InsurancesContractStrategiesResource {
        return InsurancesContractStrategiesResource(path: self.path + "/strategies", client: self.client)
    }
    
    /**
     * Returns transfer resource for insurance contract
     */
    //--------------------------------------------------------------------------
    public var transfer: InsurancesContractTransferResource {
        return InsurancesContractTransferResource(path: self.path + "/transfer", client: self.client)
    }
    
    /**
     * Returns detail of the life insurance
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<InsuranceDetailResponse>) -> Void)
    {
        ResourceUtils.CallGet(self, pathSuffix: "detail", parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Allows to change a limited set of insurance settings of one specific contract. Currently only the field alias can be changed. Change only to alias field must not be signed, but response is ready also for signing process.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateInsuranceRequest, callback: @escaping (_ result:CoreResult<SignableUpdateInsuranceResponse>)->Void)
    {
        let customPath = self.path.replacingOccurrences(of: "/cz/my/", with: "/my/")
        if let range = customPath.range(of: "/\(self.id)") {
            let customResource = InsurancesContractResource(id: self.id, path: customPath.substring(to: (range.lowerBound)), client: self.client)
            ResourceUtils.CallUpdate(customResource, payload: request, transform: nil, callback: callback)
        }
        else {
            // It should not happen ...
            assert(false, "Missing \(self.id) in path \(customPath)")
        }
    }
}
