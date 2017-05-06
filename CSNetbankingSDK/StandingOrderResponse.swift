//
//  StandingOrderResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 01/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class StandingOrderResponse: WebApiEntity
{
    /**
     * Either STANDING_ORDER (there is fixed amount specified which is transferred in defined times)
     * or SWEEP_ORDER (there is specified limit, amount over limit/to limit is transferred in defined times).
     */
    public internal(set) var type:                                           StandingOrderType!
    
    /**
     * Relevant only for sweep orders. Either SWEEP_OVER_LIMIT (amount over limit is transferred from account) or SWEEP_UNDER_LIMIT (amount to limit is transferred to account).
     */
    public internal(set) var subtype:                                        StandingOrderSubtype?
    
    /**
     * Alias name of standing order entered by user for his better orientation in standing order list.
     */
    public internal(set) var alias:                                          String?
    
    /**
     * Name of the standing order receiver.
     */
    public internal(set) var receiverName:                                   String?
    
    /**
     * Receiver account number. In case of SWEEP_UNDER_LIMIT this is actually sender.
     */
    public internal(set) var receiver:                                       AccountNumber!
    
    /**
     * Message for payee set during payment order creation. It is used to identify transaction on receiver side.
     */
    public internal(set) var senderReference:                                String?
    
    /**
     * The amount of the order in case of standing order. The limit amount in case of sweep order.
     */
    public internal(set) var amount:                                         Amount!
    
    /**
     * Date when the next order is set to be executed. This includes weekends and banking holidays.
     */
    public internal(set) var nextExecutionDate:                              Date?
    
    /**
     * Date when the last order will be processed. Only applicable in combination with executionMode .
     */
    public internal(set) var lastExecutionDate:                              Date?
    
    /**
     * The execution mode defines when or how standing/sweep order will be cancelled, processed the last time. Possible values: UNTIL_DATE (standing order is valid until specific date - field lastExecutionDate), UNTIL_CANCELLATION (standing order is valid forever and must be cancelled by client), AFTER_MAX_ITERATION_EXCEEDED (certain count of executions is specified - field maxIterations) or MAX_AMOUNT_EXCEEDED (maximum amount which can be transferred for this order is specified, if next iteration would exceed this amount it is not executed - field maxAmount).
     */
    public internal(set) var executionMode:                                  ExecutionMode!
    
    /**
     * The execution due mode defines how the date when order should be executed is specified. Possible values: DUE_DAY_OF_MONTH (specific number of day in the month is defined) or DUE_LAST_DAY_OF_MONTH (order is executed on last day of particular month).
     */
    public internal(set) var executionDueMode:                               ExecutionDueMode!
    
    /**
     * Execution interval defines how often order is executed. Possible values: DAILY, WEEKLY, MONTHLY, BI_MONTHLY, QUARTERLY, HALFYEARLY, YEARLY, IRREGULAR.
     */
    public internal(set) var executionInterval:                              ExecutionInterval!
    
    /**
     * Value represents order number of the day within particular period when the standing order will be reqularly executed. Possible values: 1-7 (for WEEKLY interval), 1-28 for STANDING_ORDER, 1-27 for type SWEEP_ORDER (for MONTHLY, QUARTERLY, HALFYEARLY and YEARLY - for intervals longer then month also intervalDueMonth is applicable). Field is not relevant for other execution intervals.
     */
    public internal(set) var intervalDueDay:                                 Double?
    
    /**
     * Due date month in execution interval of standing order processing. Represents order number of the month in particular period. Possible values: 1-2 for BI_MONTHLY, 1-3 for QUARTERLY, 1-6 for HALFYEARLY, 1-12 for YEARLY. Field is not relevant for other execution intervals.
     */
    public internal(set) var intervalDueMonth:                               Double?
    
    /**
     * Variable, Constant and Specific symbols.
     */
    public internal(set) var symbols:                                        Symbols?
    
    /**
     * Standing order respectively sweep order identifier.
     */
    public internal(set) var number:                                 String!
    
    /**
     * Represents the status of the order. Only possible value so far is OK.
     */
    public internal(set) var status:                                 String!
    
    /**
     * Maximum number of iterations - processing of the standing order. Only applicable in combination with executionMode.
     */
    public internal(set) var maxIterations:                          Double!
    
    /**
     * Maximum amount to be transferred using the standing order. Only applicable in combination with executionMode.
     */
    public internal(set) var maxAmount:                              Amount!
    
    /**
     * Date and time since the order is valid from.
     */
    public internal(set) var startDate:                              Date!
    
    /**
     * Array of execution dates (DATEs) when payments will be executed from this standing order since today until today + 30 days.
     */
    public internal(set) var scheduledExecutionDates:                [Date]?
    
    /**
     * Date when the next order will be really executed taking into account weekends and holidays.
     */
    public internal(set) var realExecutionDate:                      Date?
    
    /**
     * TODO:
     */
    public internal(set) var standingOrderBreak:                     StandingOrderBreak?
    
    /**
     * List of months where there is no payment (only applicable with interval IRREGULAR). Possible values: JANUARY, FEBRUARY, MARCH, APRIL, MAY, JUNE, JULY, AUGUST, SEPTEMBER, OCTOBER, NOVEMBER, DECEMBER
     */
    public internal(set) var stoppages:                              [StoppageMonth]?
    
    /**
     * Array of optional Flag values to Standing Order. Possible flags: deletable.
     */
    public internal(set) var flags:                                  [String]?
    
    public var accountStandingOrderResource: AccountStandingOrderResource {
        return (self.resource as! AccountStandingOrderResource)
    }
    
    /**
     * Convience method for getting standing order detail.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<StandingOrderResponse>) -> () )
    {
        self.accountStandingOrderResource.get(callback)
    }
    
    /**
     * This call removes existing standing/sweep order. No more payments for the order are executed after the change has been signed.
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<SignableStandingOrderResponse>)->Void)
    {
        self.accountStandingOrderResource.delete(callback)
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.type                = .other(value:"")
        self.receiver            = AccountNumber()
        self.amount              = Amount()
        self.executionMode       = .other(value:"")
        self.executionDueMode    = .other(value:"")
        self.executionInterval   = .other(value:"")
        self.number              = String()
        self.status              = String()
        self.maxIterations       = Double()
        self.maxAmount           = Amount()
        self.startDate           = Date()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.type                             <- (map["type"], StandingOrderType.transform())
        self.subtype                          <- (map["subtype"], StandingOrderSubtype.transform())
        self.alias                            <- map["alias"]
        self.receiverName                     <- map["receiverName"]
        self.receiver                         <- map["receiver"]
        self.senderReference                  <- map["senderReference"]
        self.amount                           <- map["amount"]
        self.nextExecutionDate                <- (map["nextExecutionDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.lastExecutionDate                <- (map["lastExecutionDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.executionMode                    <- (map["executionMode"], ExecutionMode.transform())
        self.executionDueMode                 <- (map["executionDueMode"], ExecutionDueMode.transform())
        self.executionInterval                <- (map["executionInterval"], ExecutionInterval.transform())
        self.intervalDueDay                   <- map["intervalDueDay"]
        self.intervalDueMonth                 <- map["intervalDueMonth"]
        self.symbols                          <- map["symbols"]
        self.number                           <- map["number"]
        self.status                           <- map["status"]
        self.maxIterations                    <- map["maxIterations"]
        self.maxAmount                        <- map["maxAmount"]
        self.startDate                        <- (map["startDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.scheduledExecutionDates          <- (map["scheduledExecutionDates"], DateMapHelper(dateFormat: CSNetbanking.DateFormat).transformArray())
        self.realExecutionDate                <- (map["realExecutionDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.standingOrderBreak               <- map["break"]
        self.stoppages                        <- (map["stoppages"], StoppageMonth.transformArray())
        self.flags                            <- map["flags"]
        
        super.mapping( map )
    }

}
