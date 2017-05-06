//
//  AccountTransactionsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountTransactionsResource: NetbankingResource, HasInstanceResource
{
    /**
     * Returns individual AccountsTransactionResource with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> AccountTransactionResource
    {
        return AccountTransactionResource( id: id, path: self.path, client: self.client);
    }
    
    /**
     * Exports transaction history into signed pdf
     */
    //--------------------------------------------------------------------------
    public func export( _ parameters: ExportTransactionsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        let customResource = AccountTransactionsResource(path: self.customPath, client: self.client)
        ResourceUtils.CallDownload(method: .POST, resource: customResource, pathSuffix: "export", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }
    
}
