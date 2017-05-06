//
//  ContactType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 27/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let AddressValue  = "ADDRESS"
fileprivate let PhoneValue    = "PHONE"
fileprivate let EmailValue    = "EMAIL"
fileprivate let FaxValue      = "FAX"

//==============================================================================
public enum ContactType: Transformable
{
    /**
     * Address contact type.
     */
    case address
    
    /**
     * Phone contact type.
     */
    case phone
    
    /**
     * Email contact type.
     */
    case email
    
    /**
     * Fax contact type.
     */
    case fax
    
    /**
     * Other contact type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .address:
            return AddressValue
        case .phone:
            return PhoneValue
        case .email:
            return EmailValue
        case .fax:
            return FaxValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ContactType
    {
        switch string {
        case AddressValue:
            return .address
        case PhoneValue:
            return .phone
        case EmailValue:
            return .email
        case FaxValue:
            return .fax
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ContactType, String>
    {
        return TransformOf<ContactType, String>(
            fromJSON: { (value: String?) -> ContactType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: ContactType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
