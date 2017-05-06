//
//  InsuranceTransferType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 17/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let PayPremium         = "PAY_PREMIUM"
fileprivate let ExtraDeposit       = "EXTRA_DEPOSIT"
fileprivate let RecommendedDeposit = "RECOMMENDED_DEPOSIT"

/**
 * Type of the transfer. Possible values are PAY_PREMIUM, EXTRA_DEPOSIT, RECOMMENDED_DEPOSIT.
 */
//==============================================================================
public enum InsuranceTransferType: Transformable
{
    /**
     * Pay premium insurance transfer type.
     */
    case payPremium
    
    /**
     * Extra deposit insurance transfer type.
     */
    case extraDeposit
    
    /**
     * Recommended deposit insurance transfer type.
     */
    case recommendedDeposit
    
    /**
     * Other insurance transfer type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .payPremium:
            return PayPremium
        case .extraDeposit:
            return ExtraDeposit
        case .recommendedDeposit:
            return RecommendedDeposit
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> InsuranceTransferType
    {
        switch string {
        case PayPremium:
            return .payPremium
        case ExtraDeposit:
            return .extraDeposit
        case RecommendedDeposit:
            return .recommendedDeposit
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<InsuranceTransferType, String>
    {
        return TransformOf<InsuranceTransferType, String>(
            fromJSON: { (value: String?) -> InsuranceTransferType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: InsuranceTransferType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
        
}
