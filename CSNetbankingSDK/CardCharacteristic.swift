//
//  CardCharacteristic.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Main       = "MAIN"
fileprivate let Authorized = "AUTHORIZED"

//==============================================================================
public enum CardCharacteristic: Transformable
{
    /**
     * Main card characteristic.
     */
    case main
    
    /**
     * Authorized card characteristic.
     */
    case authorized

    /**
     * Other card characteristic.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .main:
            return Main
        case .authorized:
            return Authorized
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardCharacteristic
    {
        switch string {
        case Main:
            return .main
        case Authorized:
            return .authorized
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardCharacteristic, String>
    {
        return TransformOf<CardCharacteristic, String>(
            fromJSON: { (value: String?) -> CardCharacteristic? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardCharacteristic?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
