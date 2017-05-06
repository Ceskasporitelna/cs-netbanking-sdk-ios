//
//  AccountReservationsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 09/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get information about the account's reservations
 */
//==============================================================================
public class AccountReservationsResource: NetbankingResource, OptionalPaginatedListEnabled
{
    /**
     * Fetches the reservations and returns them in a callback.
     */
    //--------------------------------------------------------------------------
    public func list(_ parameters: ListParameters? = nil, callback: @escaping (_ result: CoreResult<PaginatedListResponse<ReservationResponse>>) -> Void)
    {
        ResourceUtils.CallPaginatedList( self, itemJSONKey:"reservations", parameters: parameters?.toDictionary(nil), transform: nil, callback: callback )
    }
}
