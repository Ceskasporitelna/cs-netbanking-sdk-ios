//
//  SecureSettingsStatus.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Ok           = "OK"
fileprivate let NotActivated = "NOT_ACTIVATED"

//==============================================================================
public enum SecureSettingsStatus: Transformable
{
    /**
     * Ok secure settings status.
     */
    case ok
    
    /**
     * Not activated secure settings status.
     */
    case notActivated
    
    /**
     * Other secure settings status.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .ok:
            return Ok
        case .notActivated:
            return NotActivated
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> SecureSettingsStatus
    {
        switch string {
        case Ok:
            return .ok
        case NotActivated:
            return .notActivated
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<SecureSettingsStatus, String>
    {
        return TransformOf<SecureSettingsStatus, String>(
            fromJSON: { (value: String?) -> SecureSettingsStatus? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: SecureSettingsStatus?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
