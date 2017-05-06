//
//  InsuranceServiceGroup.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let RiskSportsValue          = "RISK_SPORTS"
fileprivate let ServiceValue             = "SERVICE"

//==============================================================================
public enum InsuranceServiceGroup: Transformable
{
    /**
     * Risk sports service group.
     */
    case riskSports
    
    /**
     * Service service group.
     */
    case service
    
    /**
     * Other service group.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .riskSports:
            return RiskSportsValue
        case .service:
            return ServiceValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> InsuranceServiceGroup
    {
        switch string {
        case RiskSportsValue:
            return .riskSports
        case ServiceValue:
            return .service
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<InsuranceServiceGroup, String>
    {
        return TransformOf<InsuranceServiceGroup, String>(
            fromJSON: { (value: String?) -> InsuranceServiceGroup? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: InsuranceServiceGroup?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
