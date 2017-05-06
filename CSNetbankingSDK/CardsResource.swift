//
//  CardsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 31/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Represents list of payment cards (either debet or credit) for current user. Every card was issued for current user or belongs to one of his accounts.
 */
//==============================================================================
public class CardsResource: NetbankingResource, PaginatedListEnabled, HasInstanceResource
{
    /**
     * List of all cards
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: CardsParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<CardResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "cards", parameters: parameters.toDictionary(nil), transform: nil, callback: callback )
    }
    
    /**
     * Get a resource for card with a given id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> CardResource
    {
        return CardResource(id: id, path: self.path, client: self.client);
    }
    
}
