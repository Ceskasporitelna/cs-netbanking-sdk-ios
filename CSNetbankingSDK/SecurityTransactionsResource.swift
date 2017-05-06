//
//  SecurityTransactionsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class SecurityTransactionsResource: NetbankingResource, HasInstanceResource
{
    /**
     * Get resource of security transaction with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> SecurityTransactionResource
    {
        return SecurityTransactionResource(id: id, path: self.customPath, client: self.client)
    }
    
    /**
     * Export transaction history into signed pdf.
     */
    //--------------------------------------------------------------------------
    public func export( _ parameters: ExportTransactionsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        let customResource = SecurityTransactionsResource(path: self.customPath, client: self.client)
        ResourceUtils.CallDownload(method: .POST, resource: customResource, pathSuffix: "export", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }
}
