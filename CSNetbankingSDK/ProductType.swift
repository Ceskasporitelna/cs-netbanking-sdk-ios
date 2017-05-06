//
//  ProductType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let CurrentValue = "CURRENT"
fileprivate let SavingValue  = "SAVING"
fileprivate let LoanValue    = "LOAN"

//==============================================================================
public enum ProductType: Transformable
{
    /**
     * Current product type.
     */
    case current
    
    /**
     * Saving product type.
     */
    case saving
    
    /**
     * Loan product type.
     */
    case loan
    
    /**
     * Other product type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .current:
            return CurrentValue
        case .saving:
            return SavingValue
        case .loan:
            return LoanValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ProductType
    {
        switch string {
        case CurrentValue:
            return .current
        case SavingValue:
            return .saving
        case LoanValue:
            return .loan
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ProductType, String>
    {
        return TransformOf<ProductType, String>(
            fromJSON: { (value: String?) -> ProductType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ProductType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
