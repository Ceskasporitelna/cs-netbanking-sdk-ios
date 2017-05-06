//
//  CardsTransactionsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class CardTransactionsResource: NetbankingResource, HasInstanceResource
{
    
    /**
     * Returns CardTransactionResource for a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> CardTransactionResource
    {
        return CardTransactionResource(id: id, path: self.path, client: self.client)
    }
    
    /**
     * Export transactions to PDF
     */
    //--------------------------------------------------------------------------
    public func export( _ parameters: ExportTransactionsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        let customResource = CardTransactionsResource(path: self.customPath, client: self.client)
        ResourceUtils.CallDownload(method: .POST, resource: customResource, pathSuffix: "export", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }
}
