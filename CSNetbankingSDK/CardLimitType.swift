//
//  CardLimitType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Atm      = "ATM"
fileprivate let Pos      = "POS"
fileprivate let Internet = "INTERNET"

//==============================================================================
public enum CardLimitType: Transformable
{
    /**
     * Atm card limit type.
     */
    case atm
    
    /**
     * Pos card limit type.
     */
    case pos
    
    /**
     * Internet card limit type.
     */
    case internet
    
    /**
     * Other card limit type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .atm:
            return Atm
        case .pos:
            return Pos
        case .internet:
            return Internet
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardLimitType
    {
        switch string {
        case Atm:
            return .atm
        case Pos:
            return .pos
        case Internet:
            return .internet
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardLimitType, String>
    {
        return TransformOf<CardLimitType, String>(
            fromJSON: { (value: String?) -> CardLimitType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardLimitType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
