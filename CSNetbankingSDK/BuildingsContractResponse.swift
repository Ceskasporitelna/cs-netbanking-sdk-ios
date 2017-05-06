//
//  BuildingsContractResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class BuildingsContractResponse: WebApiEntity
{
    /**
     * Building saving identifier.
     */
    public internal (set) var id:                               String!
    
    /**
     * User-specific alias of the contract. Max. 50 characters.
     */
    public internal (set) var alias:                            String?

    /**
     * Building saving account number.
     */
    public internal (set) var accountno:                        AccountNumber!
    
    /**
     * Type of the account. Possible values are BUILD_SAVING and BUILD_LOAN.
     */
    public internal (set) var type:                             BuildingAccountType!
    
    /**
     * Product code.
     */
    public internal (set) var product:                          String!
    
    /**
     * Product name.
     */
    public internal (set) var productI18N:                      String!
    
    /**
     * Building savings account balance. For loans outstanding debt is served
     */
    public internal (set) var balance:                          Amount!
    
    /**
     * Status of the contract. Possible values are ACTIVE and CLOSED.
     */
    public internal (set) var status:                           BuildingsContractStatus!
    
    /**
     * Debtor. Will only by set for loans.
     */
    public internal (set) var contractHolders:                  [String]?
    
    /**
     * Basic credit interest rate, used for building saving deposits. Value in percentage, e.g. 1,5 will be displayed as 1,5%.
     */
    public internal (set) var creditInterestRate:               Double?
    
    /**
     * Basic debit interest rate, used for building loan. Value in percentage, e.g. 9,5 will be displayed as 9,5%.
     */
    public internal (set) var debitInterestRate:                Double?
    
    /**
     * Target saving.
     */
    public internal (set) var saving:                           BuildingsContractSaving?
    
    /**
     * Saving loan.
     */
    public internal (set) var loan:                             BuildingsContractSavingLoan?
    
    /**
     * List of flags.
     */
    public internal (set) var flags:                            [String]?
    
    /**
     * Convenience property to obtain the resource.
     */
    public var contractResource: BuildingsContractResource? {
        guard let result = self.resource as? BuildingsContractResource else {
            assert(false, "Wrong type of resource, must be BuildingsContractResource!")
            return nil
        }
        return result
    }
    
    
    /**
     * Convenience get method for fetching contracts detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<BuildingsContractResponse>) -> () )
    {
        self.contractResource!.get(callback)
    }
    
    /**
     * Convenience update method for updating contract
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateBuildingsContractRequest, callback: @escaping (_ result:CoreResult<UpdateBuildingsContractResponse>)->Void)
    {
        self.contractResource!.update(request, callback: callback)
    }
    
    /**
     * Convenience getter for contracts services
     */
    //--------------------------------------------------------------------------
    public var services: BuildingsContractsServicesResource {
        return self.contractResource!.services
    }
    
    /**
     * Convenience getter for contracts transactions
     */
    //--------------------------------------------------------------------------
    public var transactions: ContractsTransactionsResource {
        return self.contractResource!.transactions
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        
        self.accountno     = AccountNumber()
        self.type          = .other(value: "")
        self.product       = String()
        self.productI18N   = String()
        self.balance       = Amount()
        self.status        = .other(value: "")
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
        self.accountno                <- map["accountno"]
        self.type                     <- (map["type"], BuildingAccountType.transform())
        self.product                  <- map["product"]
        self.productI18N              <- map["productI18N"]
        self.balance                  <- map["balance"]
        self.status                   <- (map["status"], BuildingsContractStatus.transform())
        self.contractHolders          <- map["contractHolders"]
        self.creditInterestRate       <- map["creditInterestRate"]
        self.debitInterestRate        <- map["debitInterestRate"]
        self.saving                   <- map["saving"]
        self.loan                     <- map["loan"]
        self.flags                    <- map["flags"]
        
        super.mapping( map )
    }

}
