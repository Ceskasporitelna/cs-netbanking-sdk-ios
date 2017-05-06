//
//  PaymentState.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let OpenValue              = "OPEN"
fileprivate let SpooledValue           = "SPOOLED"
fileprivate let CancelledValue         = "CANCELLED"
fileprivate let ClosedValue            = "CLOSED"
fileprivate let DeletedValue           = "DELETED"

//==============================================================================
public enum PaymentState: Transformable
{
    /**
     * Open state.
     */
    case open
    
    /**
     * Spooled state.
     */
    case spooled
    
    /**
     * Cancelled state.
     */
    case cancelled
    
    /**
     * Closed state.
     */
    case closed
    
    /**
     * Deleted state.
     */
    case deleted
    
    /**
     * Other state.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .open:
            return OpenValue
        case .spooled:
            return SpooledValue
        case .cancelled:
            return CancelledValue
        case .closed:
            return ClosedValue
        case .deleted:
            return DeletedValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PaymentState
    {
        switch string {
        case OpenValue:
            return .open
        case SpooledValue:
            return .spooled
        case CancelledValue:
            return .cancelled
        case ClosedValue:
            return .closed
        case DeletedValue:
            return .deleted
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PaymentState, String>
    {
        return TransformOf<PaymentState, String>(
            fromJSON: { (value: String?) -> PaymentState? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PaymentState?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
