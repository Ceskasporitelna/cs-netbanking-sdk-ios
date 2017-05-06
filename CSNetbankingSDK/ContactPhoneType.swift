//
//  ContactPhoneType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 27/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let PrivateValue    = "PRIVATE"
fileprivate let CompanyValue    = "COMPANY"
fileprivate let UnknownValue    = "UNKNOWN"

//==============================================================================
public enum ContactPhoneType: Transformable
{
    /**
     * Private contact phone type.
     */
    case privatePhone
    
    /**
     * Company contact phone type.
     */
    case companyPhone
    
    /**
     * Unknown contact phone type.
     */
    case unknownPhone
    
    /**
     * Other contact phone type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .privatePhone:
            return PrivateValue
        case .companyPhone:
            return CompanyValue
        case .unknownPhone:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ContactPhoneType
    {
        switch string {
        case PrivateValue:
            return .privatePhone
        case CompanyValue:
            return .companyPhone
        case UnknownValue:
            return .unknownPhone
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ContactPhoneType, String>
    {
        return TransformOf<ContactPhoneType, String>(
            fromJSON: { (value: String?) -> ContactPhoneType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: ContactPhoneType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
