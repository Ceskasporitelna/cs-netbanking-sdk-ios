//
//  LoyaltyState.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let RegisteredValue                    = "REGISTERED"
fileprivate let UnregisteredValue                  = "UNREGISTERED"
fileprivate let DeactivatedFromFscsValue           = "DEACTIVATED_FROM_FSCS"

//==============================================================================
public enum LoyaltyState: Transformable
{
    /**
     * Registered loyalty state.
     */
    case registered
    
    /**
     * Unregistered loyalty state.
     */
    case unregistered
    
    /**
     * Deactivated from fscs loyalty state.
     */
    case deacivatedFromFscs
    
    /**
     * Other loyalty state.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .registered:
            return RegisteredValue
        case .unregistered:
            return UnregisteredValue
        case .deacivatedFromFscs:
            return DeactivatedFromFscsValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> LoyaltyState
    {
        switch string {
        case RegisteredValue:
            return .registered
        case UnregisteredValue:
            return .unregistered
        case DeactivatedFromFscsValue:
            return .deacivatedFromFscs
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<LoyaltyState, String>
    {
        return TransformOf<LoyaltyState, String>(
            fromJSON: { (value: String?) -> LoyaltyState? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: LoyaltyState?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
