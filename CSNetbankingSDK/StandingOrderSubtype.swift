//
//  StandingOrderSubtype.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let SweepOverLimit  = "SWEEP_OVER_LIMIT"
fileprivate let SweepUnderLimit = "SWEEP_UNDER_LIMIT"

//==============================================================================
public enum StandingOrderSubtype: Transformable
{
    /**
     * Amount over limit is transferred from account
     */
    case sweepOverLimit
    
    /**
     * Amount to limit is transferred to account
     */
    case sweepUnderLimit
    
    /**
     * Other standing order subtype.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .sweepOverLimit:
            return SweepOverLimit
        case .sweepUnderLimit:
            return SweepUnderLimit
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> StandingOrderSubtype
    {
        switch string {
        case SweepOverLimit:
            return .sweepOverLimit
        case SweepUnderLimit:
            return .sweepUnderLimit
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<StandingOrderSubtype, String>
    {
        return TransformOf<StandingOrderSubtype, String>(
            fromJSON: { (value: String?) -> StandingOrderSubtype? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: StandingOrderSubtype?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
