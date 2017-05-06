//
//  Periodicity.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Daily      = "DAILY"
fileprivate let Weekly     = "WEEKLY"
fileprivate let BiWeekly   = "BI_WEEKLY"
fileprivate let Monthly    = "MONTHLY"
fileprivate let Quarterly  = "QUARTERLY"
fileprivate let Halfyearly = "HALFYEARLY"
fileprivate let Yearly     = "YEARLY"
fileprivate let TenYearly  = "10_YEARLY"
fileprivate let Other      = "OTHER"

//==============================================================================
public enum Periodicity: Transformable
{
    /**
     * Daily periodicity.
     */
    case daily
    
    /**
     * Weekly periodicity.
     */
    case weekly
    
    /**
     * Bi weekly periodicity.
     */
    case biWeekly
    
    /**
     * Monthly periodicity.
     */
    case monthly
    
    /**
     * Quarterly periodicity.
     */
    case quarterly
    
    /**
     * Halfyearly periodicity.
     */
    case halfyearly
    
    /**
     * Yearly periodicity.
     */
    case yearly
    
    /**
     * Ten yaerly periodicity.
     */
    case tenYearly
    
    /**
     * Other periodicity.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .daily:
            return Daily
        case .weekly:
            return Weekly
        case .biWeekly:
            return BiWeekly
        case .monthly:
            return Monthly
        case .quarterly:
            return Quarterly
        case .halfyearly:
            return Halfyearly
        case .yearly:
            return Yearly
        case .tenYearly:
            return TenYearly
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> Periodicity
    {
        switch string {
        case Daily:
            return .daily
        case Weekly:
            return .weekly
        case BiWeekly:
            return .biWeekly
        case Monthly:
            return .monthly
        case Quarterly:
            return .quarterly
        case Halfyearly:
            return .halfyearly
        case Yearly:
            return .yearly
        case TenYearly:
            return .tenYearly
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<Periodicity, String>
    {
        return TransformOf<Periodicity, String>(
            fromJSON: { (value: String?) -> Periodicity? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: Periodicity?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
