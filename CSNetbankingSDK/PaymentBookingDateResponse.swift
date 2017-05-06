//
//  PaymentBookingDateResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 11/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PaymentBookingDateResponse: WebApiEntity
{
    /**
     * Booking date value for provided account ID and payment order.
     */
    public internal(set) var bookingDate:                              Date!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.bookingDate = Date()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.bookingDate                      <- (map["bookingDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        
        super.mapping( map )
    }

}
