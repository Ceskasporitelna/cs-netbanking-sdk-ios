//
//  ActionType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ShopProductValue      = "SHOPPRODUCT"
fileprivate let ShowUrlValue          = "SHOWURL"
fileprivate let HideValue             = "HIDE"

//==============================================================================
public enum ActionType: Transformable
{
    /**
     * Shopproduct action type.
     */
    case shopProduct
    
    /**
     * Showurl action type.
     */
    case showUrl
    
    /**
     * Hide action type.
     */
    case hide
    
    /**
     * Other action type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .shopProduct:
            return ShopProductValue
        case .showUrl:
            return ShowUrlValue
        case .hide:
            return HideValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ActionType
    {
        switch string {
        case ShopProductValue:
            return .shopProduct
        case ShowUrlValue:
            return .showUrl
        case HideValue:
            return .hide
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ActionType, String>
    {
        return TransformOf<ActionType, String>(
            fromJSON: { (value: String?) -> ActionType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: ActionType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
