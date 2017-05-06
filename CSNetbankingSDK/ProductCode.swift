//
//  ProductCode.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let RufoOrderValue               = "RUFO_ORDER"
fileprivate let RufoIncreaseValue            = "RUFO_INCREASE"
fileprivate let UfoOrderValue                = "UFO_ORDER"
fileprivate let UfoIncreaseValue             = "UFO_INCREASE"
fileprivate let PiMobilePaymentsValue        = "PI-MOBILEPAYMENTS"

//==============================================================================
public enum ProductCode: Transformable
{
    /**
     * Rufo order product code.
     */
    case rufoOrder
    
    /**
     * Rufo increase product code.
     */
    case rufoIncrease
    
    /**
     * Ufo order product code.
     */
    case ufoOrder
    
    /**
     * Ufo increase product code.
     */
    case ufoIncrease
    
    /**
     * Pi mobilepayments product code.
     */
    case piMobilePayments
    
    /**
     * Other product code.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .rufoOrder:
            return RufoOrderValue
        case .rufoIncrease:
            return RufoIncreaseValue
        case .ufoOrder:
            return UfoOrderValue
        case .ufoIncrease:
            return UfoIncreaseValue
        case .piMobilePayments:
            return PiMobilePaymentsValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ProductCode
    {
        switch string {
        case RufoOrderValue:
            return .rufoOrder
        case RufoIncreaseValue:
            return .rufoIncrease
        case UfoOrderValue:
            return .ufoOrder
        case UfoIncreaseValue:
            return .ufoIncrease
        case PiMobilePaymentsValue:
            return .piMobilePayments
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ProductCode, String>
    {
        return TransformOf<ProductCode, String>(
            fromJSON: { (value: String?) -> ProductCode? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: ProductCode?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
