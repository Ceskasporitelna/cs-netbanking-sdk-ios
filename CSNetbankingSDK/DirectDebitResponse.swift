//
//  DirectDebitResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 02/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Direct debit.
 */

//==============================================================================
public class DirectDebitResponse: WebApiEntity
{
    /**
     * Order number of the direct debit approval. It is unique per approval. Several versions of an approval have the same order number.
     */
    public internal (set) var number:                                           String?
    
    /**
     * Type of the approval. Possible values are DIRECT_DEBIT or SIPO.
     */
    public internal (set) var type:                                             DirectDebitType!
    
    /**
     * Name of the direct debit receiver.
     */
    public internal (set) var receiverName:                                     String?
    
    /**
     * Account number of the receiver.
     */
    public internal (set) var receiver:                                         AccountNumber!
    
    /**
     * Approval name chosen by the user.
     */
    public internal (set) var alias:                                            String?
    
    /**
     * Limit for the single direct debit.
     */
    public internal (set) var limit:                                            Amount?
    
    /**
     * Limit for the whole period.
     */
    public internal (set) var limitSum:                                         Amount?
    
    /**
     * Limit for the number of direct debits for the period.
     */
    public internal (set) var numberLimit:                                      Double?
    
    /**
     * Beginning date for the approval.
     */
    public internal (set) var startDate:                                        Date!
    
    /**
     * End date for the approval.
     */
    public internal (set) var endDate:                                          Date?
    
    /**
     * Symbols structure for Variable symbol, Specific symbol, Constant symbol.
     */
    public internal (set) var symbols:                                          Symbols?
    
    /**
     * The order of the month in the period when direct debits are acceptable. This must he null for period at least one month.
     */
    public internal (set) var dueMonth:                                         Int?
    
    /**
     * The number of the day in month. From this day direct debits are acceptable. This can be not null only for period longer then one month.
     */
    public internal (set) var dayFrom:                                          Int?
    
    /**
     * The number of the day in month. To this day direct debits are acceptable.
     */
    public internal (set) var dayTo:                                            Int?
    
    /**
     * Unique identifier for version of the direct debit approval.
     */
    public internal (set) var versionId:                                        Int?
    
    /**
     * Date when the version comes into use.
     */
    public internal (set) var versionValidityDate:                              Date?
    
    /**
     * Number of period cycles in one period.
     */
    public internal (set) var periodicity:                                      Int!
    
    /**
     * Unit of the period cycle. Possible values are HALFYEARLY, MONTHLY, QUARTERLY, YEARLY, DAILY, WEEKLY, OTHER.
     */
    public internal (set) var periodCycle:                                      PeriodCycle!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.type                 = .other(value:"")
        self.receiver             = AccountNumber()
        self.startDate            = Date()
        self.periodicity          = Int()
        self.periodCycle          = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.number                        <- map["number"]
        self.type                          <- (map["type"], DirectDebitType.transform())
        self.receiverName                  <- map["receiverName"]
        self.receiver                      <- map["receiver"]
        self.alias                         <- map["alias"]
        self.limit                         <- map["limit"]
        self.limitSum                      <- map["limitSum"]
        self.numberLimit                   <- map["numberLimit"]
        self.startDate                     <- (map["startDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.endDate                       <- (map["endDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.symbols                       <- map["symbols"]
        self.dueMonth                      <- map["dueMonth"]
        self.dayFrom                       <- map["dayFrom"]
        self.dayTo                         <- map["dayTo"]
        self.versionId                     <- map["versionId"]
        self.versionValidityDate           <- (map["versionValidityDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.periodicity                   <- map["periodicity"]
        self.periodCycle                   <- (map["periodCycle"], PeriodCycle.transform())
        
        super.mapping( map )
    }
}
