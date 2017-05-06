//
//  PeriodOfCharging.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let MonthlyValue      = "MONTHLY"
fileprivate let NonRecurringValue = "NON_RECURRING"
fileprivate let UnknownValue      = "UNKNOWN"

//==============================================================================
public enum PeriodOfCharging: Transformable
{
    /**
     * Monthly period of charging.
     */
    case monthly
    
    /**
     * Non recurring period of charging.
     */
    case nonRecurring
    
    /**
     * Unknown period of charging.
     */
    case unknown
    
    /**
     * Other period of charging.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .monthly:
            return MonthlyValue
        case .nonRecurring:
            return NonRecurringValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PeriodOfCharging
    {
        switch string {
        case MonthlyValue:
            return .monthly
        case NonRecurringValue:
            return .nonRecurring
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PeriodOfCharging, String>
    {
        return TransformOf<PeriodOfCharging, String>(
            fromJSON: { (value: String?) -> PeriodOfCharging? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PeriodOfCharging?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
