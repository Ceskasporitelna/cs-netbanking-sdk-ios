//
//  LockReason.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Theft = "THEFT"
fileprivate let Loss  = "LOSS"
fileprivate let Fraud = "FRAUD"

//==============================================================================
public enum LockReason: Transformable
{
    /**
     * Theft lock reason.
     */
    case theft
    
    /**
     * Loss lock reason.
     */
    case loss
    
    /**
     * Fraud lock reason.
     */
    case fraud
    
    /**
     * Other lock reason.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .theft:
            return Theft
        case .loss:
            return Loss
        case .fraud:
            return Fraud
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> LockReason
    {
        switch string {
        case Theft:
            return .theft
        case Loss:
            return .loss
        case Fraud:
            return .fraud
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<LockReason, String>
    {
        return TransformOf<LockReason, String>(
            fromJSON: { (value: String?) -> LockReason? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: LockReason?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
