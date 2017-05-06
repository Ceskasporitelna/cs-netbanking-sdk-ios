//
//  StandingOrderType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let StandingOrderValue = "STANDING_ORDER"
fileprivate let SweepOrderValue    = "SWEEP_ORDER"

//==============================================================================
public enum StandingOrderType: Transformable
{
    /**
     * Standing order - there is fixed amount specified which is transferred in defined times
     */
    case standingOrder
    
    /**
     * Sweep order - there is specified limit, amount over limit/to limit is transferred in defined
     * times
     */
    case sweepOrder
    
    /**
     * Other standing order type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .standingOrder:
            return StandingOrderValue
        case .sweepOrder:
            return SweepOrderValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> StandingOrderType
    {
        switch string {
        case StandingOrderValue:
            return .standingOrder
        case SweepOrderValue:
            return .sweepOrder
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<StandingOrderType, String>
    {
        return TransformOf<StandingOrderType, String>(
            fromJSON: { (value: String?) -> StandingOrderType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: StandingOrderType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
