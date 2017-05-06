//
//  Interval.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let OnceValue              = "ONCE"
fileprivate let MonthlyValue           = "MONTHLY"
fileprivate let QuarterlyValue         = "QUARTERLY"
fileprivate let HalfyearlyValue        = "HALFYEARLY"
fileprivate let YearlyValue            = "YEARLY"
fileprivate let UnknownValue           = "UNKNOWN"

//==============================================================================
public enum Interval: Transformable
{
    /**
     * Once interval.
     */
    case once
    
    /**
     * Monthly interval.
     */
    case monthly
    
    /**
     * Quarterly interval.
     */
    case quarterly
    
    /**
     * Halfyearly interval.
     */
    case halfyearly
    
    /**
     * Yearly interval.
     */
    case yearly
    
    /**
     * Unknown interval.
     */
    case unknown
    
    /**
     * Other interval.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .once:
            return OnceValue
        case .monthly:
            return MonthlyValue
        case .quarterly:
            return QuarterlyValue
        case .halfyearly:
            return HalfyearlyValue
        case .yearly:
            return YearlyValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> Interval
    {
        switch string {
        case OnceValue:
            return .once
        case MonthlyValue:
            return .monthly
        case QuarterlyValue:
            return .quarterly
        case HalfyearlyValue:
            return .halfyearly
        case YearlyValue:
            return .yearly
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<Interval, String>
    {
        return TransformOf<Interval, String>(
            fromJSON: { (value: String?) -> Interval? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: Interval?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
