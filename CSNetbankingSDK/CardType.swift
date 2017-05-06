//
//  CardType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let BankCard = "BANK_CARD"
fileprivate let Credit   = "CREDIT"

//==============================================================================
public enum CardType: Transformable
{
    /**
     * Bank card card type.
     */
    case bankCard
    
    /**
     * Credit card type.
     */
    case credit
    
    /**
     * Other card type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .bankCard:
            return BankCard
        case .credit:
            return Credit
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardType
    {
        switch string {
        case BankCard:
            return .bankCard
        case Credit:
            return .credit
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardType, String>
    {
        return TransformOf<CardType, String>(
            fromJSON: { (value: String?) -> CardType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
    
}
