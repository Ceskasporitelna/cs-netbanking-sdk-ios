//
//  InsuranceServiceState.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ActivatedValue          = "ACTIVATED"
fileprivate let ActiveValue             = "ACTIVE"
fileprivate let InactiveValue           = "INACTIVE"

//==============================================================================
public enum InsuranceServiceState: Transformable
{
    /**
     * Activated insurance service state.
     */
    case activated
    
    /**
     * Active insurance service state.
     */
    case active
    
    /**
     * Inactive insurance service state.
     */
    case inactive
    
    /**
     * Other insurance service state.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .activated:
            return ActivatedValue
        case .active:
            return ActiveValue
        case .inactive:
            return InactiveValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> InsuranceServiceState
    {
        switch string {
        case ActivatedValue:
            return .activated
        case ActiveValue:
            return .active
        case InactiveValue:
            return .inactive
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<InsuranceServiceState, String>
    {
        return TransformOf<InsuranceServiceState, String>(
            fromJSON: { (value: String?) -> InsuranceServiceState? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: InsuranceServiceState?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
