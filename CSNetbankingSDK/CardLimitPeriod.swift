//
//  CardLimitPeriod.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let OneD     = "1D"
fileprivate let TwoD     = "2D"
fileprivate let ThreeD   = "3D"
fileprivate let FiveD    = "5D"
fileprivate let SevenD   = "7D"
fileprivate let TenD     = "10D"
fileprivate let FifteenD = "15D"
fileprivate let ThirdtyD = "30D"

//==============================================================================
public enum CardLimitPeriod: Transformable
{
    /**
     * One day card limit period.
     */
    case oneD
    
    /**
     * Two days card limit period.
     */
    case twoD
    
    /**
     * Three days card limit period.
     */
    case threeD
    
    /**
     * Five days card limit period.
     */
    case fiveD
    
    /**
     * Seven days card limit period.
     */
    case sevenD
    
    /**
     * Ten days card limit period.
     */
    case tenD
    
    /**
     * Fifteen days card limit period.
     */
    case fifteenD
    
    /**
     * Thirty days card limit period.
     */
    case thirdtyD
    
    /**
     * Other card limit period.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .oneD:
            return OneD
        case .twoD:
            return TwoD
        case .threeD:
            return ThreeD
        case .fiveD:
            return FiveD
        case .sevenD:
            return SevenD
        case .tenD:
            return TenD
        case .fifteenD:
            return FifteenD
        case .thirdtyD:
            return ThirdtyD
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardLimitPeriod
    {
        switch string {
        case OneD:
            return .oneD
        case TwoD:
            return .twoD
        case ThreeD:
            return .threeD
        case FiveD:
            return .fiveD
        case SevenD:
            return .sevenD
        case TenD:
            return .tenD
        case FifteenD:
            return .fifteenD
        case ThirdtyD:
            return .thirdtyD
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardLimitPeriod, String>
    {
        return TransformOf<CardLimitPeriod, String>(
            fromJSON: { (value: String?) -> CardLimitPeriod? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardLimitPeriod?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }

}
