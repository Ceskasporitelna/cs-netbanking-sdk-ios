//
//  PaymentType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let OrdinaryValue                = "ORDINARY"
fileprivate let OnetimeValue                 = "ONETIME"
fileprivate let ExtraordinaryValue           = "EXTRAORDINARY"
fileprivate let FutureValue                  = "FUTURE"
fileprivate let OverdueValue                 = "OVERDUE"
fileprivate let WithdrawalValue              = "WITHDRAWAL"
fileprivate let PartiallyPaidValue           = "PARTIALLY_PAID"
fileprivate let UnknownValue                 = "UNKNOWN"

//==============================================================================
public enum PaymentType: Transformable
{
    /**
     * Ordinary payment type.
     */
    case ordinary
    
    /**
     * Onetime payment type.
     */
    case onetime
    
    /**
     * Extraordinary payment type.
     */
    case extraordinary
    
    /**
     * Future payment type.
     */
    case future
    
    /**
     * Overdue payment type.
     */
    case overdue
    
    /**
     * Withdrawal payment type.
     */
    case withdrawal
    
    /**
     * Partially paid payment type.
     */
    case partiallyPaid
    
    /**
     * Unknown payment type.
     */
    case unknown
    
    /**
     * Other payment type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .ordinary:
            return OrdinaryValue
        case .onetime:
            return OnetimeValue
        case .extraordinary:
            return ExtraordinaryValue
        case .future:
            return FutureValue
        case .overdue:
            return OverdueValue
        case .withdrawal:
            return WithdrawalValue
        case .partiallyPaid:
            return PartiallyPaidValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PaymentType
    {
        switch string {
        case OrdinaryValue:
            return .ordinary
        case OnetimeValue:
            return .onetime
        case ExtraordinaryValue:
            return .extraordinary
        case FutureValue:
            return .future
        case OverdueValue:
            return .overdue
        case WithdrawalValue:
            return .withdrawal
        case PartiallyPaidValue:
            return .partiallyPaid
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PaymentType, String>
    {
        return TransformOf<PaymentType, String>(
            fromJSON: { (value: String?) -> PaymentType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: PaymentType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
