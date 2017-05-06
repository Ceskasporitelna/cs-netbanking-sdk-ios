//
//  AccountsTransferType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let RevolvingLoanDisbursement = "REVOLVING_LOAN_DISBURSEMENT"

//==============================================================================
public enum AccountsTransferType: Transformable
{
    /**
     * Revolving loan disbursement transfer type.
     */
    case revolvingLoanDisbursement
    
    /**
     * Other transfer type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .revolvingLoanDisbursement:
            return RevolvingLoanDisbursement
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> AccountsTransferType
    {
        switch string {
        case RevolvingLoanDisbursement:
            return .revolvingLoanDisbursement
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<AccountsTransferType, String>
    {
        return TransformOf<AccountsTransferType, String>(
            fromJSON: { (value: String?) -> AccountsTransferType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: AccountsTransferType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
