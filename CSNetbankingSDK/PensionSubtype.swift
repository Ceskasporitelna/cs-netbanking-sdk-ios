//
//  PensionSubtype.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

//SUPPLEMENTARY_INSURANCE, PENSION_SAVINGS and SUPPLEMENTARY_SAVINGS.

import Foundation
import CSCoreSDK

fileprivate let SupplementaryInsuranceValue     = "SUPPLEMENTARY_INSURANCE"
fileprivate let PensionSavingsValue             = "PENSION_SAVINGS"
fileprivate let SupplementarySavingsValue       = "SUPPLEMENTARY_SAVINGS"

//==============================================================================
public enum PensionSubtype: Transformable
{
    /**
     * Supplementary insurance pension subtype.
     */
    case supplementaryInsurance
    
    /**
     * Pension savings pension subtype.
     */
    case pensionSavings
    
    /**
     * Supplementary savings pension subtype.
     */
    case supplementarySavings
    
    /**
     * Other pension status.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .supplementaryInsurance:
            return SupplementaryInsuranceValue
        case .pensionSavings:
            return PensionSavingsValue
        case .supplementarySavings:
            return SupplementarySavingsValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PensionSubtype
    {
        switch string {
        case SupplementaryInsuranceValue:
            return .supplementaryInsurance
        case PensionSavingsValue:
            return .pensionSavings
        case SupplementarySavingsValue:
            return .supplementarySavings
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PensionSubtype, String>
    {
        return TransformOf<PensionSubtype, String>(
            fromJSON: { (value: String?) -> PensionSubtype? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PensionSubtype?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
