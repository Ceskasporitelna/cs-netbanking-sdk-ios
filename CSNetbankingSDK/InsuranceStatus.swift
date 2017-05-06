//
//  InsuranceStatus.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ActiveValue          = "ACTIVE"
fileprivate let ClosedValue          = "CLOSED"


//==============================================================================
public enum InsuranceStatus: Transformable
{
    /**
     * Active insurance status.
     */
    case active
    
    /**
     * Closed insurance status.
     */
    case closed
    
    /**
     * Other insurance status.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .active:
            return ActiveValue
        case .closed:
            return ClosedValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> InsuranceStatus
    {
        switch string {
        case ActiveValue:
            return .active
        case ClosedValue:
            return .closed
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<InsuranceStatus, String>
    {
        return TransformOf<InsuranceStatus, String>(
            fromJSON: { (value: String?) -> InsuranceStatus? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: InsuranceStatus?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
