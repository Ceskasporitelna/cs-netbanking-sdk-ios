//
//  DisplayTypeKind.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let OverviewCardValue         = "OVERVIEW_CARD"

//==============================================================================
public enum DisplayTypeKind: Transformable
{
    /**
     * Overview card display type kind.
     */
    case overviewCard
    
    /**
     * Other display type kind.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .overviewCard:
            return OverviewCardValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> DisplayTypeKind
    {
        switch string {
        case OverviewCardValue:
            return .overviewCard
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<DisplayTypeKind, String>
    {
        return TransformOf<DisplayTypeKind, String>(
            fromJSON: { (value: String?) -> DisplayTypeKind? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: DisplayTypeKind?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
