//
//  BuildingsContractStatus.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ActiveValue          = "ACTIVE"
fileprivate let ClosedValue          = "CLOSED"


//==============================================================================
public enum BuildingsContractStatus: Transformable
{
    /**
     * Active buildings contract status.
     */
    case active
    
    /**
     * Closed buildings contract status.
     */
    case closed
    
    /**
     * Other buildings contract status.
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
    public static func enumerate(string: String) -> BuildingsContractStatus
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
    public static func transform() -> TransformOf<BuildingsContractStatus, String>
    {
        return TransformOf<BuildingsContractStatus, String>(
            fromJSON: { (value: String?) -> BuildingsContractStatus? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: BuildingsContractStatus?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
