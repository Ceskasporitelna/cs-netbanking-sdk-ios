//
//  BuildingAccountType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let BuildingSavingValue          = "BUILD_SAVING"
fileprivate let BuildLoanValue               = "BUILD_LOAN"


//==============================================================================
public enum BuildingAccountType: Transformable
{
    /**
     * Build saving building account type.
     */
    case buildSaving
    
    /**
     * Build loan building account type.
     */
    case buildLoan
    
    /**
     * Other building account type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .buildSaving:
            return BuildingSavingValue
        case .buildLoan:
            return BuildLoanValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> BuildingAccountType
    {
        switch string {
        case BuildingSavingValue:
            return .buildSaving
        case BuildLoanValue:
            return .buildLoan
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<BuildingAccountType, String>
    {
        return TransformOf<BuildingAccountType, String>(
            fromJSON: { (value: String?) -> BuildingAccountType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: BuildingAccountType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
