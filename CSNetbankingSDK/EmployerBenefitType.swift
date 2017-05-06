//
//  EmployerBenefitType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let WholePremiumValue              = "WHOLE_PREMIUM"
fileprivate let PartlyPaidPremiumValue         = "PARTLY_PAID_PREMIUM"
fileprivate let ExtraordinaryPaymentsValue     = "EXTRAORDINARY_PAYMENTS"

//==============================================================================
public enum EmployerBenefitType: Transformable
{
    /**
     * Whole premium employer benefit type.
     */
    case wholePremium
    
    /**
     * Partly paid premium employer benefit type.
     */
    case partlyPaidPremium
    
    /**
     * Extraordinary payments employer benefit type.
     */
    case extraordinaryPayments
    
    /**
     * Other employer benefit type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .wholePremium:
            return WholePremiumValue
        case .partlyPaidPremium:
            return PartlyPaidPremiumValue
        case .extraordinaryPayments:
            return ExtraordinaryPaymentsValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> EmployerBenefitType
    {
        switch string {
        case WholePremiumValue:
            return .wholePremium
        case PartlyPaidPremiumValue:
            return .partlyPaidPremium
        case ExtraordinaryPaymentsValue:
            return .extraordinaryPayments
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<EmployerBenefitType, String>
    {
        return TransformOf<EmployerBenefitType, String>(
            fromJSON: { (value: String?) -> EmployerBenefitType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: EmployerBenefitType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
