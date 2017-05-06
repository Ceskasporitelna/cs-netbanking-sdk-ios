//
//  AuthorizationLimitsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AuthorizationLimitsResource: NetbankingResource, ParametrizedListEnabled, HasInstanceResource
{
    /**
     * Return all user local specific payment order entry limits for for all user active authorization methods and channels/applications used in country.
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: AuthorizationLimitsParameters, callback: @escaping (_ result: CoreResult<ListResponse<AuthorizationLimitResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "limits", pathSuffix: nil, parameters: parameters.toDictionary(nil), transform: nil, callback: callback)
    }
    
    /**
     * Get the resource of authorization limit with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> AuthorizationLimitResource
    {
        return AuthorizationLimitResource(id: id, path: self.path, client: self.client);
    }
}
