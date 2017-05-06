//
//  ServiceResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Service provides information about Service.
 */
//==============================================================================
public class ServiceResponse: WebApiEntity
{
    /**
     * Service indentifier
     */
    public internal(set) var  id:                                  String!
    
    /**
     * Localized name of the service.
     */
    public internal(set) var  nameI18N:                            String!
    
    /**
     * Information about service group. There is an icon defined for every group.
     */
    public internal(set) var  iconGroup:                           String!
    
    /**
     * Service is active from date.
     */
    public internal(set) var  dateFrom:                            Date?
    
    /**
     * Service will be active till date.
     */
    public internal(set) var  dateTo:                              Date?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id          = String()
        self.nameI18N    = String()
        self.iconGroup   = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                      <- map["id"]
        self.nameI18N                <- map["nameI18N"]
        self.iconGroup               <- map["iconGroup"]
        self.dateFrom                <- (map["dateFrom"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.dateTo                  <- (map["dateTo"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        
        super.mapping( map )
    }

}
