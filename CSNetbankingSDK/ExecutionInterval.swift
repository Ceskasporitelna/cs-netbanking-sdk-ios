//
//  ExecutionInterval.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Daily      = "DAILY"
fileprivate let Weekly     = "WEEKLY"
fileprivate let Monthly    = "MONTHLY"
fileprivate let BiMonthly  = "BI_MONTHLY"
fileprivate let Quarterly  = "QUARTERLY"
fileprivate let Halfyearly = "HALFYEARLY"
fileprivate let Yearly     = "YEARLY"
fileprivate let Irregular  = "IRREGULAR"

//==============================================================================
public enum ExecutionInterval: Transformable
{
    /**
     * Daily execution interval.
     */
    case daily
    
    /**
     * Weekly execution interval.
     */
    case weekly
    
    /**
     * Monthly execution interval.
     */
    case monthly
    
    /**
     * Bi monthly execution interval.
     */
    case biMonthly
    
    /**
     * Quarterly execution interval.
     */
    case quarterly
    
    /**
     * Half-yearly execution interval.
     */
    case halfyearly
    
    /**
     * Yearly execution interval.
     */
    case yearly
    
    /**
     * Irregular execution interval.
     */
    case irregular
    
    /**
     * Other execution interval.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .daily:
            return Daily
        case .weekly:
            return Weekly
        case .monthly:
            return Monthly
        case .biMonthly:
            return BiMonthly
        case .quarterly:
            return Quarterly
        case .halfyearly:
            return Halfyearly
        case .yearly:
            return Yearly
        case .irregular:
            return Irregular
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ExecutionInterval
    {
        switch string {
        case Daily:
            return .daily
        case Weekly:
            return .weekly
        case Monthly:
            return .monthly
        case BiMonthly:
            return .biMonthly
        case Quarterly:
            return .quarterly
        case Halfyearly:
            return .halfyearly
        case Yearly:
            return .yearly
        case Irregular:
            return .irregular
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ExecutionInterval, String>
    {
        return TransformOf<ExecutionInterval, String>(
            fromJSON: { (value: String?) -> ExecutionInterval? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ExecutionInterval?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }

}
