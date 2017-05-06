//
//  PeriodCycle.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Daily      = "DAILY"
fileprivate let Weekly     = "WEEKLY"
fileprivate let Monthly    = "MONTHLY"
fileprivate let Quarterly  = "QUARTERLY"
fileprivate let Halfyearly = "HALFYEARLY"
fileprivate let Yearly     = "YEARLY"

//==============================================================================
public enum PeriodCycle: Transformable
{
    /**
     * Daily period cycle.
     */
    case daily
    
    /**
     * Weekly period cycle.
     */
    case weekly
    
    /**
     * Monthly period cycle.
     */
    case monthly
    
    /**
     * Quarterly period cycle.
     */
    case quarterly
    
    /**
     * Halfyearly period cycle.
     */
    case halfyearly
    
    /**
     * Yearly period cycle.
     */
    case yearly
    
    /**
     * Other period cycle.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .daily:
            return Daily
        case .weekly:
            return Weekly
        case .monthly:
            return Monthly
        case .quarterly:
            return Quarterly
        case .halfyearly:
            return Halfyearly
        case .yearly:
            return Yearly
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PeriodCycle
    {
        switch string {
        case Daily:
            return .daily
        case Weekly:
            return .weekly
        case Monthly:
            return .monthly
        case Quarterly:
            return .quarterly
        case Halfyearly:
            return .halfyearly
        case Yearly:
            return .yearly
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PeriodCycle, String>
    {
        return TransformOf<PeriodCycle, String>(
            fromJSON: { (value: String?) -> PeriodCycle? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: PeriodCycle?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
