//
//  InsuranceBeneficiaryType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let PersonValue          = "PERSON"

//==============================================================================
public enum InsuranceBeneficiaryType: Transformable
{
    /**
     * Person insurance beneficiary type.
     */
    case person
    
    /**
     * Other insurance beneficiary type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .person:
            return PersonValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> InsuranceBeneficiaryType
    {
        switch string {
        case PersonValue:
            return .person
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<InsuranceBeneficiaryType, String>
    {
        return TransformOf<InsuranceBeneficiaryType, String>(
            fromJSON: { (value: String?) -> InsuranceBeneficiaryType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: InsuranceBeneficiaryType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
