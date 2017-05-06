//
//  AuthorizationTokenResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AuthorizationTokenResource: NetbankingResource, DeleteEnabled
{
    /**
     * Invalidate authorization token.
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<NetbankingEmptyResponse>)->Void)
    {
        ResourceUtils.CallDelete(self, pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
