//
//  ExecutionMode.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let UntilDate                 = "UNTIL_DATE"
fileprivate let UntilCancellation         = "UNTIL_CANCELLATION"
fileprivate let AfterMaxIterationExceeded = "AFTER_MAX_ITERATION_EXCEEDED"
fileprivate let MaxAmountExceeded         = "MAX_AMOUNT_EXCEEDED"

//==============================================================================
public enum ExecutionMode: Transformable
{
    /**
     * Standing order is valid until specific date - field lastExecutionDate
     */
    case untilDate
    
    /**
     * Standing order is valid forever and must be cancelled by client
     */
    case untilCancellation
    
    /**
     * Certain count of executions is specified - field maxIterations
     */
    case afterMaxIterationExceeded
    
    /**
     * Maximum amount which can be transferred for this order is specified, if next iteration would
     * exceed this amount it is not executed - field maxAmount
     */
    case maxAmountExceeded
    
    /**
     * Other execution mode.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .untilDate:
            return UntilDate
        case .untilCancellation:
            return UntilCancellation
        case .afterMaxIterationExceeded:
            return AfterMaxIterationExceeded
        case .maxAmountExceeded:
            return MaxAmountExceeded
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ExecutionMode
    {
        switch string {
        case UntilDate:
            return .untilDate
        case UntilCancellation:
            return .untilCancellation
        case AfterMaxIterationExceeded:
            return .afterMaxIterationExceeded
        case MaxAmountExceeded:
            return .maxAmountExceeded
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ExecutionMode, String>
    {
        return TransformOf<ExecutionMode, String>(
            fromJSON: { (value: String?) -> ExecutionMode? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ExecutionMode?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
