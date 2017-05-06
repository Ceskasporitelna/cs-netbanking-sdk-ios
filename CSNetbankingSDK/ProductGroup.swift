//
//  ProductGroup.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let BondsAndMoreValue           = "BONDS_AND_MORE"
fileprivate let GuaranteeOfPrincipalValue   = "GUARANTEE_OF_PRINCIPAL"
fileprivate let NoGuaranteeOfPrincipalValue = "NO_GUARANTEE_OF_PRINCIPAL"
fileprivate let RealEstateValue             = "REAL_ESTATE"
fileprivate let SharesValue                 = "SHARES"
fileprivate let StockAndMixedValue          = "STOCK_AND_MIXED"
fileprivate let InvestmentValue             = "INVESTMENT"
fileprivate let KnockOutValue               = "KNOCK_OUT"
fileprivate let UnknownValue                = "UNKNOWN"


//==============================================================================
public enum ProductGroup: Transformable
{
    /**
     * Bonds and more product group.
     */
    case bondsAndMore
    
    /**
     * Guarantee of principal product group.
     */
    case guaranteeOfPrincipal
    
    /**
     * No guarantee of principal product group.
     */
    case noGuaranteeOfPrincipal
    
    /**
     * Real estate product group.
     */
    case realEstate
    
    /**
     * Shares product group.
     */
    case shares
    
    /**
     * Stock and mixed product group.
     */
    case stockAndMixed
    
    /**
     * Investment product group.
     */
    case investment
    
    /**
     * Knock out product group.
     */
    case knockOut
    
    /**
     * Unknown product group.
     */
    case unknown
    
    /**
     * Other product group.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .bondsAndMore:
            return BondsAndMoreValue
        case .guaranteeOfPrincipal:
            return GuaranteeOfPrincipalValue
        case .noGuaranteeOfPrincipal:
            return NoGuaranteeOfPrincipalValue
        case .realEstate:
            return RealEstateValue
        case .shares:
            return SharesValue
        case .stockAndMixed:
            return StockAndMixedValue
        case .investment:
            return InvestmentValue
        case .knockOut:
            return KnockOutValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ProductGroup
    {
        switch string {
        case BondsAndMoreValue:
            return .bondsAndMore
        case GuaranteeOfPrincipalValue:
            return .guaranteeOfPrincipal
        case NoGuaranteeOfPrincipalValue:
            return .noGuaranteeOfPrincipal
        case RealEstateValue:
            return .realEstate
        case SharesValue:
            return .shares
        case StockAndMixedValue:
            return .stockAndMixed
        case InvestmentValue:
            return .investment
        case KnockOutValue:
            return .knockOut
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ProductGroup, String>
    {
        return TransformOf<ProductGroup, String>(
            fromJSON: { (value: String?) -> ProductGroup? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: ProductGroup?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
