//
//  PaymentCategory.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let DomesticValue               = "DOMESTIC"
fileprivate let OwnTransferValue            = "OWN_TRANSFER"
fileprivate let SepaValue                   = "SEPA"
fileprivate let InternationalValue          = "INTERNATIONAL"

//==============================================================================
public enum PaymentCategory: Transformable
{
    /**
     * Domestic order category.
     */
    case domestic
    
    /**
     * Own transfer order category.
     */
    case ownTransfer
    
    /**
     * Sepa order category.
     */
    case sepa
    
    /**
     * International order category.
     */
    case international
    
    /**
     * Other order category.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .domestic:
            return DomesticValue
        case .ownTransfer:
            return OwnTransferValue
        case .sepa:
            return SepaValue
        case .international:
            return InternationalValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PaymentCategory
    {
        switch string {
        case DomesticValue:
            return .domestic
        case OwnTransferValue:
            return .ownTransfer
        case SepaValue:
            return .sepa
        case InternationalValue:
            return .international
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PaymentCategory, String>
    {
        return TransformOf<PaymentCategory, String>(
            fromJSON: { (value: String?) -> PaymentCategory? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PaymentCategory?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
