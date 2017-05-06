//
//  PaymentOrderType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let PaymentOutValue               = "PAYMENT_OUT"
fileprivate let DirectDebitInValue            = "DIRECT_DEBIT_IN"

//==============================================================================
public enum PaymentOrderType: Transformable
{
    /**
     * Payment out order type.
     */
    case paymentOut
    
    /**
     * Direct debit in order type.
     */
    case directDebitIn
    
    /**
     * Other order type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .paymentOut:
            return PaymentOutValue
        case .directDebitIn:
            return DirectDebitInValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PaymentOrderType
    {
        switch string {
        case PaymentOutValue:
            return .paymentOut
        case DirectDebitInValue:
            return .directDebitIn
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PaymentOrderType, String>
    {
        return TransformOf<PaymentOrderType, String>(
            fromJSON: { (value: String?) -> PaymentOrderType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PaymentOrderType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
