//
//  SecurityResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class SecurityResource: NetbankingInstanceResource, GetEnabled, UpdateEnabled
{
    /**
     * Returns security transactions resource
     */
    //--------------------------------------------------------------------------
    public var transactions: SecurityTransactionsResource {
        return SecurityTransactionsResource(path: self.path + "/transactions", client: self.client);
    }
    
    /**
     * Get a single securities account with all its details. Securities account represents virtual account which holds securities titles and its shares (funds, bonds, etc.).
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<SecurityResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Allows to change a limited set of securities account-settings of one specific contract. Currently only the field alias can be changed. Change only to alias field must not be signed, but response is ready also for signing process.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : SecurityRequest, callback: @escaping (_ result:CoreResult<SignableSecurityResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
