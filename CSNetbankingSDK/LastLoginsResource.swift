//
//  LastLoginsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Last logins resource. This resource provides Last login information and data.
 */
//==============================================================================
public class LastLoginsResource: NetbankingResource, ListEnabled
{
    /**
     * Get list of last logins. Only the last login for particular channel/application.
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<LastLoginInfoResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "lastlogin", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
