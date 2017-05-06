//
//  MobilePaymentType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let TopUpValue                    = "TOP_UP"
fileprivate let InvoiceValue                  = "INVOICE"
fileprivate let VodafonePaymentValue          = "VODAFONE_PAYMENT"
fileprivate let MobileDepositValue            = "MOBILE_DEPOSIT"
fileprivate let UnknownValue                  = "unknown"

//==============================================================================
public enum MobilePaymentType: Transformable
{
    /**
     * Top up payment type.
     */
    case topUp
    
    /**
     * Invoice payment type.
     */
    case invoice
    
    /**
     * Vodafone payment payment type.
     */
    case vodafonePayment
    
    /**
     * Mobile deposit payment type.
     */
    case mobileDeposit
    
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
        case .topUp:
            return TopUpValue
        case .invoice:
            return InvoiceValue
        case .vodafonePayment:
            return VodafonePaymentValue
        case .mobileDeposit:
            return MobileDepositValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> MobilePaymentType
    {
        switch string {
        case TopUpValue:
            return .topUp
        case InvoiceValue:
            return .invoice
        case VodafonePaymentValue:
            return .vodafonePayment
        case MobileDepositValue:
            return .mobileDeposit
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<MobilePaymentType, String>
    {
        return TransformOf<MobilePaymentType, String>(
            fromJSON: { (value: String?) -> MobilePaymentType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: MobilePaymentType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
