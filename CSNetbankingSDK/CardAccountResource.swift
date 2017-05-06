//
//  CardAccountResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class CardAccountResource: NetbankingInstanceResource
{
    /**
     * Get statements of the account
     */
    //--------------------------------------------------------------------------
    public var statements: CardStatementsResource {
        return CardStatementsResource(path: self.path + "/statements", client: self.client)
    }
}
