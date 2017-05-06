//
//  ReservationType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let CashWithdrawalValue = "CASH_WITHDRAWAL"
fileprivate let PaymentValue        = "PAYMENT"
fileprivate let CardPaymentValue    = "CARD_PAYMENT"
fileprivate let OtherValue          = "OTHER"

//==============================================================================
public enum ReservationType: Transformable
{
    /**
     * Cash withdrawal reservation type.
     */
    case cashWithdrawal
    
    /**
     * Payment reservation type.
     */
    case payment
    
    /**
     * Card payment reservation type.
     */
    case cardPayment
    
    /**
     * Other reservation type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .cashWithdrawal:
            return CashWithdrawalValue
        case .payment:
            return PaymentValue
        case .cardPayment:
            return CardPaymentValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ReservationType
    {
        switch string {
        case CashWithdrawalValue:
            return .cashWithdrawal
        case PaymentValue:
            return .payment
        case CardPaymentValue:
            return .cardPayment
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ReservationType, String>
    {
        return TransformOf<ReservationType, String>(
            fromJSON: { (value: String?) -> ReservationType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ReservationType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
