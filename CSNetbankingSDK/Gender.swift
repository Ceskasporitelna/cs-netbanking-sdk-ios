//
//  Gender.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let MaleValue             = "MALE"
fileprivate let FemaleValue           = "FEMALE"
fileprivate let UnknownValue          = "UNKNOWN"

//==============================================================================
public enum Gender: Transformable
{
    /**
     * Male gender.
     */
    case male
    
    /**
     * Female gender.
     */
    case female
    
    /**
     * Unknown gender.
     */
    case unknown
    
    /**
     * Other gender.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .male:
            return MaleValue
        case .female:
            return FemaleValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> Gender
    {
        switch string {
        case MaleValue:
            return .male
        case FemaleValue:
            return .female
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<Gender, String>
    {
        return TransformOf<Gender, String>(
            fromJSON: { (value: String?) -> Gender? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: Gender?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
