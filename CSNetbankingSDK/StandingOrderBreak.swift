//
//  StandingOrderBreak.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 01/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class StandingOrderBreak: WebApiEntity
{
    /**
     * Start date of break period. Standing order will not be processed from this date.
     */
    public var validFromDate:                                      Date!
    
    /**
     * End date of break period. Standing order will not be processed to this date.
     */
    public var validToDate:                                        Date!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.validFromDate = Date()
        self.validToDate   = Date()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.validFromDate                <- (map["validFromDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.validToDate                  <- (map["validToDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        
        super.mapping( map )
    }
}
