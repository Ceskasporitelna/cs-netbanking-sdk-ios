//
//  TimeOfCharging.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ImmediatelyValue      = "IMMEDIATELY"
fileprivate let AccountStatementValue = "ACCOUNT_STATEMENT"
fileprivate let UnknownValue          = "UNKNOWN"

//==============================================================================
public enum TimeOfCharging: Transformable
{
    /**
     * Immediately time of charging.
     */
    case immediately
    
    /**
     * Account statement time of charging.
     */
    case accountStatement
    
    /**
     * Unknown time of charging.
     */
    case unknown
    
    /**
     * Other time of charging.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .immediately:
            return ImmediatelyValue
        case .accountStatement:
            return AccountStatementValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> TimeOfCharging
    {
        switch string {
        case ImmediatelyValue:
            return .immediately
        case AccountStatementValue:
            return .accountStatement
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<TimeOfCharging, String>
    {
        return TransformOf<TimeOfCharging, String>(
            fromJSON: { (value: String?) -> TimeOfCharging? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: TimeOfCharging?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
