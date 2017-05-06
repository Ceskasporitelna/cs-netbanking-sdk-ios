//
//  CardsStatementsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 05/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//


import CSCoreSDK

/**
 * The type Statements resource. This resource provides list of statements for account or card account.
 */
//==============================================================================
public class CardStatementsResource: NetbankingResource, OptionalPaginatedListEnabled
{
    /**
     * Ordered and sorted list of all statements
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: StatementsParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<StatementResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey: "statements", parameters: parameters?.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Download PDF with statements. Returns path to downloaded file in the callback, when success.
     */
    //--------------------------------------------------------------------------
    public func download(_ parameters: DownloadStatementsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        ResourceUtils.CallDownload( method: .POST, resource: self, pathSuffix: "signed/download", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }
}
