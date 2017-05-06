//
//  ContractStrategyType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ConservativeValue     = "CONSERVATIVE"
fileprivate let ProgressiveValue      = "PROGRESSIVE"
fileprivate let BalancedValue         = "BALANCED"
fileprivate let ControlValue          = "CONTROL"
fileprivate let ActualSettingValue    = "ACTUAL_SETTING"

//==============================================================================
public enum ContractStrategyType: Transformable
{
    /**
     * Conservative contract strategy type.
     */
    case conservative
    
    /**
     * Progressive contract strategy type.
     */
    case progressive
    
    /**
     * Balanced contract strategy type.
     */
    case balanced
    
    /**
     * Control contract strategy type.
     */
    case control
    
    /**
     * Actual setting contract strategy type.
     */
    case actualSetting
    
    /**
     * Other contract strategy type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .conservative:
            return ConservativeValue
        case .progressive:
            return ProgressiveValue
        case .balanced:
            return BalancedValue
        case .control:
            return ControlValue
        case .actualSetting:
            return ActualSettingValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ContractStrategyType
    {
        switch string {
        case ConservativeValue:
            return .conservative
        case ProgressiveValue:
            return .progressive
        case BalancedValue:
            return .balanced
        case ControlValue:
            return .control
        case ActualSettingValue:
            return .actualSetting
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ContractStrategyType, String>
    {
        return TransformOf<ContractStrategyType, String>(
            fromJSON: { (value: String?) -> ContractStrategyType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ContractStrategyType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
