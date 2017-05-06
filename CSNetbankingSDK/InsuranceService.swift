//
//  InsuranceService.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class InsuranceService: WebApiEntity
{
    /**
     * indicator for FE for grouping services to boxes. Possible values: RISK_SPORTS, SERVICE
     */
    public internal (set) var group:                                       InsuranceServiceGroup!
    
    /**
     * service id
     */
    public internal (set) var id:                                          String!
    
    /**
     * service icon group
     */
    public internal (set) var iconGroup:                                   String!
    
    /**
     * service name
     */
    public internal (set) var nameI18N:                                    String!
    
    /**
     * Description of the service.
     */
    public internal (set) var descriptionI18N:                             String!
    
    /**
     * relevant only for RISK_SPORTS group. For those number of days this service can be activated this year at all.
     */
    public internal (set) var availableDays:                               Double!
    
    /**
     * Starting date of active service. Relevant for RISK_SPORTS.
     */
    public internal (set) var activeFrom:                                  Date!
    
    /**
     * Ending date of active service. Relevant for RISK_SPORTS.
     */
    public internal (set) var activeTo:                                    Date!
    
    /**
     * Amount of bonus. Relevant for NO_CLAIM_BONUS, LOYALTY_BONUS.
     */
    public internal (set) var bonusAmount:                                 Amount!
    
    /**
     * Indicates service state. Three possible values: ACTIVATED - insurance was already 
     * activated but will be active in the future. ACTIVE - insurance is active right now. 
     * INACTIVE - insurance is neither activated nor active.
     */
    public internal (set) var state:                                       InsuranceServiceState!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.group            = .other(value: "")
        self.id               = String()
        self.iconGroup        = String()
        self.nameI18N         = String()
        self.descriptionI18N  = String()
        self.availableDays    = Double()
        self.activeFrom       = Date()
        self.activeTo         = Date()
        self.bonusAmount      = Amount()
        self.state            = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.group                      <- (map["group"], InsuranceServiceGroup.transform())
        self.id                         <- map["id"]
        self.iconGroup                  <- map["iconGroup"]
        self.nameI18N                   <- map["nameI18N"]
        self.descriptionI18N            <- map["descriptionI18N"]
        self.availableDays              <- map["availableDays"]
        self.activeFrom                 <- (map["activeFrom"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.activeTo                   <- (map["activeTo"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.bonusAmount                <- map["bonusAmount"]
        self.state                      <- (map["state"], InsuranceServiceState.transform())
        
        super.mapping( map )
    }

}
