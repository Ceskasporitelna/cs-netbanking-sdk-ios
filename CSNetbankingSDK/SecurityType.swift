//
//  SecurityType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let BondValue              = "BOND"
fileprivate let ShareValue             = "SHARE"
fileprivate let FundValue              = "FUND"
fileprivate let IpoValue               = "IPO"
fileprivate let OptionValue            = "OPTION"
fileprivate let IndexValue             = "INDEX"
fileprivate let CertificateValue       = "CERTIFICATE"
fileprivate let InvestmentValue        = "INVESTMENT"
fileprivate let KnockoutValue          = "KNOCKOUT"
fileprivate let UnknownValue           = "UNKNOWN"


//==============================================================================
public enum SecurityType: Transformable
{
    /**
     * Bond security type.
     */
    case bond
    
    /**
     * Share security type.
     */
    case share
    
    /**
     * Fund security type.
     */
    case fund
    
    /**
     * Ipo security type.
     */
    case ipo
    
    /**
     * Option security type.
     */
    case option
    
    /**
     * Index security type.
     */
    case index
    
    /**
     * Certificate security type.
     */
    case certificate
    
    /**
     * Investment security type.
     */
    case investment
    
    /**
     * Knockout security type.
     */
    case knockout
    
    /**
     * Unknown security type.
     */
    case unknown
    
    /**
     * Other security type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .bond:
            return BondValue
        case .share:
            return ShareValue
        case .fund:
            return FundValue
        case .ipo:
            return IpoValue
        case .option:
            return OptionValue
        case .index:
            return IndexValue
        case .certificate:
            return CertificateValue
        case .investment:
            return InvestmentValue
        case .knockout:
            return KnockoutValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> SecurityType
    {
        switch string {
        case BondValue:
            return .bond
        case ShareValue:
            return .share
        case FundValue:
            return .fund
        case IpoValue:
            return .ipo
        case OptionValue:
            return .option
        case IndexValue:
            return .index
        case CertificateValue:
            return .certificate
        case InvestmentValue:
            return .investment
        case KnockoutValue:
            return .knockout
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<SecurityType, String>
    {
        return TransformOf<SecurityType, String>(
            fromJSON: { (value: String?) -> SecurityType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: SecurityType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
