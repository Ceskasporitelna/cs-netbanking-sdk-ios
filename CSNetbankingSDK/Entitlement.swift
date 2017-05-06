//
//  Entitlement.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let TakeOverValue = "TAKEOVER"

//==============================================================================
public enum Entitlement: Transformable
{
    /**
     * Take over entitlement.
     */
    case takeOver
    
    /**
     * Other entitlement.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .takeOver:
            return TakeOverValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> Entitlement
    {
        switch string {
        case TakeOverValue:
            return .takeOver
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<Entitlement, String>
    {
        return TransformOf<Entitlement, String>(
            fromJSON: { (value: String?) -> Entitlement? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: Entitlement?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
