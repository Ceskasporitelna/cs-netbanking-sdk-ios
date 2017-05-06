//
//  ContractStrategyGroup.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let StrategyValue        = "STRATEGY"
fileprivate let InvestmentValue      = "INVESTMENT_MANAGEMENT"

//==============================================================================
public enum ContractStrategyGroup: Transformable
{
    /**
     * Chosen strategy group.
     */
    case strategy
    
    /**
     * Investment management contract strategy group.
     */
    case investmentManagement
    
    /**
     * Other contract strategy group.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .strategy:
            return StrategyValue
        case .investmentManagement:
            return InvestmentValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ContractStrategyGroup
    {
        switch string {
        case StrategyValue:
            return .strategy
        case InvestmentValue:
            return .investmentManagement
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ContractStrategyGroup, String>
    {
        return TransformOf<ContractStrategyGroup, String>(
            fromJSON: { (value: String?) -> ContractStrategyGroup? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ContractStrategyGroup?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
