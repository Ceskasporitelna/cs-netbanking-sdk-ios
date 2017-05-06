//
//  SubAccountResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the subaccount
 */
//==============================================================================
public class SubAccountResource: NetbankingInstanceResource
{
    /**
     * Get information about the subaccount's statements
     */
    //--------------------------------------------------------------------------
    public var statements: SubAccountStatementsResource {
        return SubAccountStatementsResource( path: self.path + "/statements", client: self.client )
    }
}

