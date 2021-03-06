//
//  ContractsTransactionsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class ContractsTransactionsResource: NetbankingResource, HasInstanceResource
{
    /**
     * Get contract transaction resource with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> ContractsTransactionResource
    {
        return ContractsTransactionResource(id: id, path: self.path, client: self.client)
    }
    
    /**
     * Export transaction history into signed pdf.
     * return downloaded file name when success. 
     */
    //--------------------------------------------------------------------------
    public func export( _ parameters: ExportTransactionsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        ResourceUtils.CallDownload(method: .POST, resource: self, pathSuffix: "export", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }
}
