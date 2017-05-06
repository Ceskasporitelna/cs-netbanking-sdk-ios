//
//  PensionResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class PensionResponse: WebApiEntity
{
    /**
     * Product unique identifier.
     */
    public internal (set) var id:                                        String!
    
    /**
     * User defined account name. Max. 50 characters.
     */
    public internal (set) var alias:                                      String?

    /**
     * Name of the contract owner.
     */
    public internal (set) var owner:                                      String?
    
    /**
     * Date when contract was signed.
     */
    public internal (set) var signingDate:                                Date?
    
    /**
     * First day of contract validity.
     */
    public internal (set) var validFrom:                                  Date?
    
    /**
     * Last day of contract validity.
     */
    public internal (set) var validTo:                                    Date?
    
    /**
     * Pension contract number.
     */
    public internal (set) var agreementNumber:                            String!
    
    /**
     * Contract status. Possible values: ACTIVE, TERMINATED, PENSION_PAYMENT, I
     * NTERRUPTED, PAYMENTS_SUSPENDED, PAYMENTS_DEFFERED, SETTLED, REPEALED, NEGOTIATED.
     */
    public internal (set) var status:                                     PensionStatus!
    
    /**
     * Product account info.
     */
    public internal (set) var productAccount:                             ProductAccount!
    
    /**
     * Localized product name.
     */
    public internal (set) var productI18N:                                String!
    
    /**
     * Identification of the product type.
     */
    public internal (set) var product:                                    String!
    
    /**
     * Identification of the product group. Possible values are SUPPLEMENTARY_INSURANCE, PENSION_SAVINGS and SUPPLEMENTARY_SAVINGS.
     */
    public internal (set) var subtype:                                    PensionSubtype!
    
    /**
     * Birth number of the product owner.
     */
    public internal (set) var birthNumber:                                String!
    
    /**
     * Amount of already paid benefits.
     */
    public internal (set) var paidBenefits:                               Amount!
    
    /**
     * Pension strategy info.
     */
    public internal (set) var strategy:                                   PensionsStrategy?
    
    /**
     * Pension related flags.
     */
    public internal (set) var pensionAgreed:                              PensionAgreed?
    
    /**
     * Saving times.
     */
    public internal (set) var savingTime:                                 SavingTime?
    
    /**
     * Contribution attributes.
     */
    public internal (set) var contribution:                               Contribution?
    
    /**
     * Supplementary attributes.
     */
    public internal (set) var supplementary:                              Supplementary?
    
    /**
     * Beneficiary attributes.
     */
    public internal (set) var beneficiaries:                              [PensionBeneficiaries]?
    
    /**
     * Other pension related flags.
     */
    public internal (set) var flags:                                      [String]?
    
    /**
     * Convenience property to obtain the resource.
     */
    public var pensionsContractResource: PensionsContractResource? {
        guard let result = self.resource as? PensionsContractResource else {
            assert(false, "Wrong type of resource, must be PensionsContractResource!")
            return nil
        }
        return result
    }
    
    /**
     * Convenience get method for fetching Pensions detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<PensionResponse>) -> Void)
    {
        self.pensionsContractResource!.get(callback)
    }
    
    /**
     * Convenience update method for updating Pension
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdatePensionRequest, callback: @escaping (_ result:CoreResult<UpdatePensionResponse>)->Void)
    {
        request.id = self.id
        self.pensionsContractResource!.update(request, callback: callback)
    }
    
    /**
     * Convenience getter for getting Pensions transactions resource
     */
    //--------------------------------------------------------------------------
    public var transactions: PensionsContractsTransactionsResource {
        return self.pensionsContractResource!.transactions
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.agreementNumber   = String()
        self.status            = .other(value: "")
        self.productAccount    = ProductAccount()
        self.productI18N       = String()
        self.product           = String()
        self.subtype           = .other(value: "")
        self.birthNumber       = String()
        self.paidBenefits      = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                                        <- map["id"]
        self.alias                                     <- map["alias"]
        self.owner                                     <- map["owner"]
        self.signingDate                               <- (map["signingDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.validFrom                                 <- (map["validFrom"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.validTo                                   <- (map["validTo"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.agreementNumber                           <- map["agreementNumber"]
        self.status                                    <- (map["status"], PensionStatus.transform())
        self.productAccount                            <- map["productAccount"]
        self.productI18N                               <- map["productI18N"]
        self.product                                   <- map["product"]
        self.subtype                                   <- (map["subtype"], PensionSubtype.transform())
        self.birthNumber                               <- map["birthNumber"]
        self.paidBenefits                              <- map["paidBenefits"]
        self.strategy                                  <- map["strategy"]
        self.pensionAgreed                             <- map["pensionAgreed"]
        self.savingTime                                <- map["savingTime"]
        self.contribution                              <- map["contribution"]
        self.supplementary                             <- map["supplementary"]
        self.beneficiaries                             <- map["beneficiaries"]
        self.flags                                     <- map["flags"]
        
        super.mapping( map )
    }
}
