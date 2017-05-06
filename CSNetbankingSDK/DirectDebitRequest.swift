//
//  DirectDebitRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 21/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * The type Direct debit.
 */

//==============================================================================
public class DirectDebitRequest: WebApiEntity
{
    /**
     * Order number of the direct debit approval. It is unique per approval. Several versions of an approval have the same order number. Optional.
     */
    public var number:                                           String?
    
    /**
     * Type of the approval. Possible values are DIRECT_DEBIT or SIPO. Mandatory.
     */
    public var type:                                             DirectDebitType?
    
    /**
     * Name of the direct debit receiver. Optional.
     */
    public var receiverName:                                     String?
    
    /**
     * Account number of the receiver. Mandatory.
     */
    public var receiver:                                         AccountNumber?
    
    /**
     * Approval name chosen by the user. Optional.
     */
    public var alias:                                            String?
    
    /**
     * Limit for the single direct debit. Optional.
     */
    public var limit:                                            Amount?
    
    /**
     * Limit for the whole period. Optional.
     */
    public var limitSum:                                         Amount?
    
    /**
     * Limit for the number of direct debits for the period. Optional.
     */
    public var numberLimit:                                      Double?
    
    /**
     * Beginning date for the approval. Mandatory.
     */
    public var startDate:                                        Date?
    
    /**
     * End date for the approval. Optional.
     */
    public var endDate:                                          Date?
    
    /**
     * Symbols structure for Variable symbol, Specific symbol, Constant symbol.
     */
    public var symbols:                                          Symbols?
    
    /**
     * The order of the month in the period when direct debits are acceptable. This must he null for period at least one month.
     */
    public var dueMonth:                                         Int?
    
    /**
     * The number of the day in month. From this day direct debits are acceptable. This can be not null only for period longer then one month.
     */
    public var dayFrom:                                          Int?
    
    /**
     * The number of the day in month. To this day direct debits are acceptable.
     */
    public var dayTo:                                            Int?
    
    /**
     * Unique identifier for version of the direct debit approval.
     */
    public var versionId:                                        Int?
    
    /**
     * Date when the version comes into use.
     */
    public var versionValidityDate:                              Date?
    
    /**
     * Number of period cycles in one period. Mandatory.
     */
    public var periodicity:                                      Int?
    
    /**
     * Unit of the period cycle. Possible values are HALFYEARLY, MONTHLY, QUARTERLY, YEARLY, DAILY, WEEKLY, OTHER. Mandatory.
     */
    public var periodCycle:                                      PeriodCycle?
    
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
