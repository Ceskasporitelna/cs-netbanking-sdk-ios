//
//  ContactAddressType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let PermanentResidenceValue   = "PERMANENT_RESIDENCE"
fileprivate let SecondaryResidenceValue   = "SECONDARY_RESIDENCE"
fileprivate let CompanyResidenceValue     = "COMPANY_RESIDENCE"
fileprivate let UnknownValue              = "UNKNOWN"

//==============================================================================
public enum ContactAddressType: Transformable
{
    /**
     * Permanent residence contact address type.
     */
    case permanentResidence
    
    /**
     * Secondary residence contact address type.
     */
    case secondaryResidence
    
    /**
     * Company residence contact address type.
     */
    case companyResidence
    
    /**
     * Unknown contact address type.
     */
    case unknown
    
    /**
     * Other contact address type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .permanentResidence:
            return PermanentResidenceValue
        case .secondaryResidence:
            return SecondaryResidenceValue
        case .companyResidence:
            return CompanyResidenceValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ContactAddressType
    {
        switch string {
        case PermanentResidenceValue:
            return .permanentResidence
        case SecondaryResidenceValue:
            return .secondaryResidence
        case CompanyResidenceValue:
            return .companyResidence
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ContactAddressType, String>
    {
        return TransformOf<ContactAddressType, String>(
            fromJSON: { (value: String?) -> ContactAddressType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: ContactAddressType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
