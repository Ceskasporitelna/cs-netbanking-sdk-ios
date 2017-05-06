//
//  CardDeliveryMode.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Branch        = "BRANCH"
fileprivate let Home          = "HOME"
fileprivate let OtherBranch   = "OTHER_BRANCH"
fileprivate let AddressAbroad = "ADDRESS_ABROAD"

//==============================================================================
public enum CardDeliveryMode: Transformable
{
    /**
     * Branch card delivery mode.
     */
    case branch
    
    /**
     * Home card delivery mode.
     */
    case home
    
    /**
     * Other branch card delivery mode.
     */
    case otherBranch
    
    /**
     * Address abroad card delivery mode.
     */
    case addressAbroad
    
    /**
     * Other card delivery mode.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .branch:
            return Branch
        case .home:
            return Home
        case .otherBranch:
            return OtherBranch
        case .addressAbroad:
            return AddressAbroad
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardDeliveryMode
    {
        switch string {
        case Branch:
            return .branch
        case Home:
            return .home
        case OtherBranch:
            return .otherBranch
        case AddressAbroad:
            return .addressAbroad
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardDeliveryMode, String>
    {
        return TransformOf<CardDeliveryMode, String>(
            fromJSON: { (value: String?) -> CardDeliveryMode? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardDeliveryMode?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
