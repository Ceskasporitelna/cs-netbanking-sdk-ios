//
//  OrderCategory.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let DomesticValue               = "DOMESTIC"
fileprivate let InternationalValue          = "INTERNATIONAL"

//==============================================================================
public enum OrderCategory: Transformable
{
    /**
     * Domestic order category.
     */
    case domestic
    
    /**
     * International order category.
     */
    case international
    
    /**
     * Other order category.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .domestic:
            return DomesticValue
        case .international:
            return InternationalValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> OrderCategory
    {
        switch string {
        case DomesticValue:
            return .domestic
        case InternationalValue:
            return .international
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<OrderCategory, String>
    {
        return TransformOf<OrderCategory, String>(
            fromJSON: { (value: String?) -> OrderCategory? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: OrderCategory?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
