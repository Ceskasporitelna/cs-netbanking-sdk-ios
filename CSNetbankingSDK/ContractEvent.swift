//
//  ContractEvent.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ContractEvent: WebApiEntity
{
    /**
     * Insurance event number
     */
    public internal (set) var number:                         String!
    
    /**
     * Creation date of the insurance event.
     */
    public internal (set) var creationDate:                   Date!
    
    /**
     * State of the event. Possible values: REPORTED, ATTACHING_DOCS, IN_SOLUTION, CLOSED
     */
    public internal (set) var state:                          ContractEventState!
    
    /**
     * Substate of the event.
     */
    public internal (set) var substate:                       String?
    
    /**
     * Date that relates to the insurance substate.
     */
    public internal (set) var substateDate:                   Date?
    
    /**
     * Substate information with text and date.
     */
    public internal (set) var substateInfo:                    String?
    
    /**
     * Total amount for the insurance event
     */
    public internal (set) var amount:                          Amount!
    
    /**
     * The date when thi event has been reported
     */
    public internal (set) var processingDate:                  Date?
    
    /**
     * List of indemnities related to the insurance event.
     */
    public internal (set) var indemnities:                     [ContractEventIndemnity]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.number        = String()
        self.creationDate  = Date()
        self.state         = .other(value: "")
        self.amount        = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.number                     <- map["number"]
        self.creationDate               <- (map["creationDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.state                      <- (map["state"], ContractEventState.transform())
        self.substate                   <- map["substate"]
        self.substateDate               <- (map["substateDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.substateInfo               <- map["substateInfo"]
        self.amount                     <- map["amount"]
        self.processingDate             <- (map["processingDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.indemnities                <- map["indemnities"]
        
        super.mapping( map )
    }
}
