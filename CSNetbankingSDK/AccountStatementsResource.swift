//
//  AccountStatementsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the account's statements
 */
//==============================================================================
public class AccountStatementsResource: NetbankingResource, PaginatedListEnabled
{
    /**
     * Fetches the statements and returns them in a callback ordered and sorted.
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: StatementsParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<StatementResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"statements", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Downloads signed statements file
     */
    //--------------------------------------------------------------------------
    public func signedDownload( _ parameters: DownloadStatementsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        ResourceUtils.CallDownload( method: .POST, resource: self, pathSuffix: "signed/download", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }
    
    /**
     * Downloads statements file. Returns path to downloaded file in the callback, when success.
     */
    //--------------------------------------------------------------------------
    public func download( _ parameters: DownloadStatementsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        ResourceUtils.CallDownload( method: .POST, resource: self, pathSuffix: "download", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }
}

