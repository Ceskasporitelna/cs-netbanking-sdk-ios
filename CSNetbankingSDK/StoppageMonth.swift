//
//  StoppageMonth.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let January   = "JANUARY"
fileprivate let February  = "FEBRUARY"
fileprivate let March     = "MARCH"
fileprivate let April     = "APRIL"
fileprivate let May       = "MAY"
fileprivate let June      = "JUNE"
fileprivate let July      = "JULY"
fileprivate let August    = "AUGUST"
fileprivate let September = "SEPTEMBER"
fileprivate let October   = "OCTOBER"
fileprivate let November  = "NOVEMBER"
fileprivate let December  = "DECEMBER"

//==============================================================================
public enum StoppageMonth: TransformableArray
{
    /**
     * JANUARY.
     */
    case january
    
    /**
     * FEBRUARY.
     */
    case february
    
    /**
     * MARCH.
     */
    case march
    
    /**
     * APRIL.
     */
    case april
    
    /**
     * MAY.
     */
    case may
    
    /**
     * JUNE.
     */
    case june
    
    /**
     * JULY.
     */
    case july
    
    /**
     * AUGUST.
     */
    case august
    
    /**
     * SEPTEMBER.
     */
    case september
    
    /**
     * OCTOBER.
     */
    case october
    
    /**
     * NOVEMBER.
     */
    case november
    
    /**
     * DECEMBER.
     */
    case december
    
    var value : String {
        switch self {
        case .january:
            return January
        case .february:
            return February
        case .march:
            return March
        case .april:
            return April
        case .may:
            return May
        case .june:
            return June
        case .july:
            return July
        case .august:
            return August
        case .september:
            return September
        case .october:
            return October
        case .november:
            return November
        case .december:
            return December
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> StoppageMonth
    {
        switch string {
        case January:
            return .january
        case February:
            return .february
        case March:
            return .march
        case April:
            return .april
        case May:
            return .may
        case June:
            return .june
        case July:
            return .july
        case August:
            return .august
        case September:
            return .september
        case October:
            return .october
        case November:
            return .november
        default:
            return .december
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<StoppageMonth, String>
    {
        return TransformOf<StoppageMonth, String>(
            fromJSON: { (value: String?) -> StoppageMonth? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: StoppageMonth?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
    
    //--------------------------------------------------------------------------
    public static func transformArray() -> TransformOf<[StoppageMonth], [String]>
    {
        return TransformOf<[StoppageMonth], [String]>(
            fromJSON: { (values: [String]?) -> [StoppageMonth]? in
                if let values = values {
                    var result: [StoppageMonth] = []
                    for value in values {
                        result.append(enumerate(string: value))
                    }
                    return result
                }
                return nil
        },
            toJSON: { (values: [StoppageMonth]?) -> [String]? in
                if let values = values {
                    var result: [String] = []
                    for value in values {
                        result.append(value.value)
                    }
                    return result
                }
                return nil
        })
    }
}
