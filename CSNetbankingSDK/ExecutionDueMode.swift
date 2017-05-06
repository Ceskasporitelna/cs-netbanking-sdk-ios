//
//  ExecutionDueMode.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let DueDayOfMonth     = "DUE_DAY_OF_MONTH"
fileprivate let DueLastDayOfMonth = "DUE_LAST_DAY_OF_MONTH"

//==============================================================================
public enum ExecutionDueMode: Transformable
{
    /**
     * Specific number of day in the month is defined
     */
    case dueDayOfMonth
    
    /**
     * Order is executed on last day of particular month
     */
    case dueLastDayOfMonth
    
    /**
     * Other execution due mode.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .dueDayOfMonth:
            return DueDayOfMonth
        case .dueLastDayOfMonth:
            return DueLastDayOfMonth
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ExecutionDueMode
    {
        switch string {
        case DueDayOfMonth:
            return .dueDayOfMonth
        case DueLastDayOfMonth:
            return .dueLastDayOfMonth
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ExecutionDueMode, String>
    {
        return TransformOf<ExecutionDueMode, String>(
            fromJSON: { (value: String?) -> ExecutionDueMode? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ExecutionDueMode?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
