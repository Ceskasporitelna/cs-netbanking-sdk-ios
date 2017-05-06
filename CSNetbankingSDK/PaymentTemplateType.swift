//
//  PaymentTemplateType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let OrdinaryValue                = "ORDINARY"
fileprivate let ExtraordinaryValue           = "EXTRAORDINARY"

//==============================================================================
public enum PaymentTemplateType: Transformable
{
    /**
     * Ordinary payment template type.
     */
    case ordinary
    
    /**
     * Extraordinary payment template type.
     */
    case extraordinary
    
    /**
     * Other payment template type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .ordinary:
            return OrdinaryValue
        case .extraordinary:
            return ExtraordinaryValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PaymentTemplateType
    {
        switch string {
        case OrdinaryValue:
            return .ordinary
        case ExtraordinaryValue:
            return .extraordinary
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PaymentTemplateType, String>
    {
        return TransformOf<PaymentTemplateType, String>(
            fromJSON: { (value: String?) -> PaymentTemplateType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PaymentTemplateType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
