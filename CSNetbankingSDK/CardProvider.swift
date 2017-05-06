//
//  CardProvider.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ErsteBank = "ERSTE_BANK"
fileprivate let External  = "EXTERNAL"

//==============================================================================
public enum CardProvider: Transformable
{
    /**
     * Erste bank card provider.
     */
    case ersteBank
    
    /**
     * External card provider.
     */
    case external
    
    /**
     * Other card provider.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .ersteBank:
            return ErsteBank
        case .external:
            return External
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardProvider
    {
        switch string {
        case ErsteBank:
            return .ersteBank
        case External:
            return .external
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardProvider, String>
    {
        return TransformOf<CardProvider, String>(
            fromJSON: { (value: String?) -> CardProvider? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardProvider?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
