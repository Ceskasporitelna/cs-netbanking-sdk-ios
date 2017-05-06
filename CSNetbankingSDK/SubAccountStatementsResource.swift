//
//  SubAccountStatementsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 06/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the subaccount
 */
//==============================================================================
public class SubAccountStatementsResource: NetbankingResource, PaginatedListEnabled
{
    /**
     * Returns all subaccount's statements in a promise
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: ListParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<StatementResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"statements", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Downloads statements file
     */
    //--------------------------------------------------------------------------
    public func download( _ parameters: DownloadStatementsParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        ResourceUtils.CallDownload( method: .POST, resource: self, pathSuffix: "download", parameters: parameters.toDictionary(nil), contentType: "application/pdf", callback: callback)
    }

}
