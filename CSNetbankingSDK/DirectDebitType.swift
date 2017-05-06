//
//  DirectDebitType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let DirectDebitValue = "DIRECT_DEBIT"
fileprivate let SipoValue        = "SIPO"

//==============================================================================
public enum DirectDebitType: Transformable
{
    /**
     * Direct debit direct debit type.
     */
    case directDebit
    
    /**
     * Sipo direct debit type.
     */
    case sipo
    
    /**
     * Other direct debit type.
     */
    case other(value : String)
    
    public var value : String {
        switch self {
        case .directDebit:
            return DirectDebitValue
        case .sipo:
            return SipoValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> DirectDebitType
    {
        switch string {
        case DirectDebitValue:
            return .directDebit
        case SipoValue:
            return .sipo
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<DirectDebitType, String>
    {
        return TransformOf<DirectDebitType, String>(
            fromJSON: { (value: String?) -> DirectDebitType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: DirectDebitType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
