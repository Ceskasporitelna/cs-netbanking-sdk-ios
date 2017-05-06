//
//  CardSecure3DResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 06/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get the 3D secure online shopping status
 */
//==============================================================================
public class CardSecure3DResource: NetbankingResource, GetEnabled
{
    /**
     * Returns 3D secure online shopping status
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<SecureSettingsResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback);
    }
}
