//
//  CardTransferType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let DebtRepayment = "DEBT_REPAYMENT"

//==============================================================================
public enum CardTransferType: Transformable
{
    /**
     * Debt repayment card transfer type.
     */
    case debtRepayment
    
    /**
     * Other card transfer type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .debtRepayment:
            return DebtRepayment
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardTransferType
    {
        switch string {
        case DebtRepayment:
            return .debtRepayment
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardTransferType, String>
    {
        return TransformOf<CardTransferType, String>(
            fromJSON: { (value: String?) -> CardTransferType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardTransferType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
