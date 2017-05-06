//
//  PaymentOrderPriority.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let UrgentValue               = "URGENT"
fileprivate let StandardValue             = "STANDARD"

//==============================================================================
public enum PaymentOrderPriority: Transformable
{
    /**
     * Urgent payment order priority.
     */
    case urgent
    
    /**
     * Standard payment order priority.
     */
    case standard
    
    /**
     * Other payment order priority.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .urgent:
            return UrgentValue
        case .standard:
            return StandardValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PaymentOrderPriority
    {
        switch string {
        case UrgentValue:
            return .urgent
        case StandardValue:
            return .standard
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PaymentOrderPriority, String>
    {
        return TransformOf<PaymentOrderPriority, String>(
            fromJSON: { (value: String?) -> PaymentOrderPriority? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PaymentOrderPriority?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
