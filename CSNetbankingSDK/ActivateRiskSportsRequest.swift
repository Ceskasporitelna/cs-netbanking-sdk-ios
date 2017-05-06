//
//  ActivateRiskSportsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ActivateRiskSportsRequest: WebApiEntity
{
    /**
     * Starting date of active service. Mandatory.
     */
    public var dateFrom:               Date?
    
    /**
     * Ending date of active service. Mandatory.
     */
    public var dateTo:                 Date?
    
    /**
     * Emergency phone number? Mandatory.
     */
    public var phoneNumber:            String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.dateFrom                   <- (map["dateFrom"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.dateTo                     <- (map["dateTo"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.phoneNumber                <- map["phoneNumber"]
        
        super.mapping( map )
    }

}
