//
//  PensionStatus.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ActiveValue               = "ACTIVE"
fileprivate let TerminatedValue           = "TERMINATED"
fileprivate let PensionPaymentValue       = "PENSION_PAYMENT"
fileprivate let InterruptedValue          = "INTERRUPTED"
fileprivate let PaymentsSuspendedValue    = "PAYMENTS_SUSPENDED"
fileprivate let PaymentsDeferredValue     = "PAYMENTS_DEFERRED"
fileprivate let SettledValue              = "SETTLED"
fileprivate let RepealedValue             = "REPEALED"
fileprivate let NegotiatedValue           = "NEGOTIATED"

//==============================================================================
public enum PensionStatus: Transformable
{
    /**
     * Active pension status.
     */
    case active
    
    /**
     * Terminated pension status.
     */
    case terminated
    
    /**
     * Pension payment pension status.
     */
    case pensionPayment
    
    /**
     * Interrupted pension status.
     */
    case interrupted
    
    /**
     * Payments suspended pension status.
     */
    case paymentsSuspended
    
    /**
     * Payments deferred pension status.
     */
    case paymentsDeferred
    
    /**
     * Settled pension status.
     */
    case settled
    
    /**
     * Repealed pension status.
     */
    case repealed
    
    /**
     * Negotiated pension status.
     */
    case negotiated
    
    /**
     * Other pension status.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .active:
            return ActiveValue
        case .terminated:
            return TerminatedValue
        case .pensionPayment:
            return PensionPaymentValue
        case .interrupted:
            return InterruptedValue
        case .paymentsSuspended:
            return PaymentsSuspendedValue
        case .paymentsDeferred:
            return PaymentsDeferredValue
        case .settled:
            return SettledValue
        case .repealed:
            return RepealedValue
        case .negotiated:
            return NegotiatedValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PensionStatus
    {
        switch string {
        case ActiveValue:
            return .active
        case TerminatedValue:
            return .terminated
        case PensionPaymentValue:
            return .pensionPayment
        case InterruptedValue:
            return .interrupted
        case PaymentsSuspendedValue:
            return .paymentsSuspended
        case PaymentsDeferredValue:
            return .paymentsDeferred
        case SettledValue:
            return .settled
        case RepealedValue:
            return .repealed
        case NegotiatedValue:
            return .negotiated
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PensionStatus, String>
    {
        return TransformOf<PensionStatus, String>(
            fromJSON: { (value: String?) -> PensionStatus? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PensionStatus?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
