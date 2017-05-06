//
//  SecurityResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class SecurityResponse: WebApiEntity
{
    /**
     * Product id
     */
    public internal (set) var id:                                      String!
    
    /**
     * Account identification number of security portfolio (MUIN)
     */
    public internal (set) var accountno:                               String!
    
    /**
     * Alias for security portfolio. Max. 50 characters.
     */
    public internal (set) var alias:                                   String?
    
    /**
     * Description - Securities portfolio Account name, Name of principal account holder
     */
    public internal (set) var description:                             String!
    
    /**
     * Account balance value
     */
    public internal (set) var balance:                                 Amount!
    
    /**
     * Array of securities sub accounts
     */
    public internal (set) var subSecAccounts:                         [SubSecAccount]?
    
    /**
     * Convenience property to obtain the resource.
     */
    public var securityResource: SecurityResource? {
        guard let result = self.resource as? SecurityResource else {
            assert(false, "Wrong type of resource, must be SecurityResource!")
            return nil
        }
        return result
    }
    
    /**
     * Convenience getter for getting security's transactions resource
     */
    //--------------------------------------------------------------------------
    public var transactions: SecurityTransactionsResource {
        return self.securityResource!.transactions
    }
    
    /**
     * Convenience method for getting security detail right from the list
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<SecurityResponse>) -> () )
    {
        self.securityResource!.get(callback)
    }
    
    /**
     * Convenience method for updating security's details
     */
    //--------------------------------------------------------------------------
    public func update(_ request : SecurityRequest, callback: @escaping (_ result:CoreResult<SignableSecurityResponse>)->Void)
    {
        self.securityResource!.update(request, callback: callback)
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id           = String()
        self.accountno    = String()
        self.description  = String()
        self.balance      = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- map["id"]
        self.accountno                        <- map["accountno"]
        self.alias                            <- map["alias"]
        self.description                      <- map["description"]
        self.balance                          <- map["balance"]
        self.subSecAccounts                   <- map["subSecAccounts"]
        
        super.mapping( map )
    }
}
