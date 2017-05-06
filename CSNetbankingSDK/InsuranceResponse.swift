//
//  InsuranceResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class InsuranceResponse: WebApiEntity
{
    /**
     * Contract number.
     */
    public internal (set) var id:                                 String?
    
    /**
     * User-specific alias of the contract. Max. 50 characters.
     */
    public internal (set) var alias:                               String?

    /**
     * Product Type of insurance. ENUM values: LIFE (CSAS supports only this value)
     */
    public internal (set) var type:                                String!
    
    /**
     * Code of the sVersicherung product.
     */
    public internal (set) var product:                             String!
    
    /**
     * Name of the sVersicherung product (localised).
     */
    public internal (set) var productI18N:                         String!
    
    /**
     * The primary holder of the specific insurance contract.
     */
    public internal (set) var insurancePolicyHolder:               String!
    
    /**
     * Policy number
     */
    public internal (set) var policyNumber:                        String!
    
    /**
     * ENUM: ACTIVE, CLOSED
     */
    public internal (set) var status:                              InsuranceStatus!
    
    /**
     * Get life insurance info
     */
    public internal (set) var life:                                LifeDetail?
    
    /**
     * Convenience property to obtain the resource.
     */
    public var insurancesContractResource: InsurancesContractResource? {
        guard let result = self.resource as? InsurancesContractResource else {
            assert(false, "Wrong type of resource, must be InsurancesContractResource!")
            return nil
        }
        return result
    }
    
    /**
     * Convenience get method for fetching Insurance detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<InsuranceDetailResponse>) -> Void)
    {
        self.insurancesContractResource!.get(callback)
    }
    
    /**
     * Convenience update method for updating insurance
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateInsuranceRequest, callback: @escaping (_ result:CoreResult<SignableUpdateInsuranceResponse>)->Void)
    {
        self.insurancesContractResource!.update(request, callback: callback)
    }
    
    /**
     * Convenience getter for Insurance funds
     */
    //--------------------------------------------------------------------------
    public var funds: InsurancesContractFundsResource {
        return self.insurancesContractResource!.funds
    }
    
    /**
     * Convenience getter for Insurance beneficiaries
     */
    //--------------------------------------------------------------------------
    public var beneficiaries: InsurancesContractBeneficiariesResource {
        return self.insurancesContractResource!.beneficiaries
    }
    
    /**
     * Convenience getter for Insurance insurees
     */
    //--------------------------------------------------------------------------
    public var insurees: InsurancesContractInsureesResource {
        return self.insurancesContractResource!.insurees
    }
    
    /**
     * Convenience getter for Insurance payments
     */
    //--------------------------------------------------------------------------
    public var payments: InsurancesContractPaymentsResource {
        return self.insurancesContractResource!.payments
    }
    
    /**
     * Convenience getter for Insurance services
     */
    //--------------------------------------------------------------------------
    public var services: InsurancesContractServicesResource {
        return self.insurancesContractResource!.services
    }
    
    /**
     * Convenience getter for Insurance events
     */
    //--------------------------------------------------------------------------
    public var events: InsurancesContractEventsResource {
        return self.insurancesContractResource!.events
    }
    
    /**
     * Convenience getter for Insurance tax benefits
     */
    //--------------------------------------------------------------------------
    public var taxBenefits: InsurancesContractTaxBenefitsResource {
        return self.insurancesContractResource!.taxBenefits
    }
    
    /**
     * Convenience getter for Insurance strategies
     */
    //--------------------------------------------------------------------------
    public var strategies: InsurancesContractStrategiesResource {
        return self.insurancesContractResource!.strategies
    }
    
    /**
     * Convenience getter for Insurance transfer
     */
    //--------------------------------------------------------------------------
    public var transfer: InsurancesContractTransferResource {
        return self.insurancesContractResource!.transfer
    }

    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.type                   = String()
        self.product                = String()
        self.productI18N            = String()
        self.insurancePolicyHolder  = String()
        self.policyNumber           = String()
        self.status                 = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                       <- map["id"]
        self.alias                    <- map["alias"]
        self.type                     <- map["type"]
        self.product                  <- map["product"]
        self.productI18N              <- map["productI18N"]
        self.insurancePolicyHolder    <- map["insurancePolicyHolder"]
        self.policyNumber             <- map["policyNumber"]
        self.status                   <- (map["status"], InsuranceStatus.transform())
        self.life                     <- map["life"]
        
        super.mapping( map )
    }

}
