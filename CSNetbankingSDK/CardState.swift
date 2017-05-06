//
//  CardState.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Active           = "ACTIVE"
fileprivate let Inactive         = "INACTIVE"
fileprivate let TemporaryBlocked = "TEMPORARY_BLOCKED"

//==============================================================================
public enum CardState: Transformable
{
    /**
     * Active card state.
     */
    case active
    
    /**
     * Inactive card state.
     */
    case inactive
    
    /**
     * Temporary blocked card state.
     */
    case temporaryBlocked
    
    /**
     * Other card state.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .active:
            return Active
        case .inactive:
            return Inactive
        case .temporaryBlocked:
            return TemporaryBlocked
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardState
    {
        switch string {
        case Active:
            return .active
        case Inactive:
            return .inactive
        case TemporaryBlocked:
            return .temporaryBlocked
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardState, String>
    {
        return TransformOf<CardState, String>(
            fromJSON: { (value: String?) -> CardState? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardState?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
