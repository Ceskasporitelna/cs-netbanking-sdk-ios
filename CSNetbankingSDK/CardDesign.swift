//
//  CardDesign.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ProductPromotionValue         = "PRODUCT_PROMOTION"
fileprivate let PluginPromotionValue          = "PLUGIN_PROMOTION"
fileprivate let InfoCardValue                 = "INFOCARD"
fileprivate let ShowCardValue                 = "SHADOWCARD"

//==============================================================================
public enum CardDesign: Transformable
{
    /**
     * Product promotion card design.
     */
    case productPromotion
    
    /**
     * Plugin promotion card design.
     */
    case pluginPromotion
    
    /**
     * Infocard card design.
     */
    case infoCard
    
    /**
     * Shadowcard card design.
     */
    case showCard
    
    /**
     * Other card design.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .productPromotion:
            return ProductPromotionValue
        case .pluginPromotion:
            return PluginPromotionValue
        case .infoCard:
            return InfoCardValue
        case .showCard:
            return ShowCardValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardDesign
    {
        switch string {
        case ProductPromotionValue:
            return .productPromotion
        case PluginPromotionValue:
            return .pluginPromotion
        case InfoCardValue:
            return .infoCard
        case ShowCardValue:
            return .showCard
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardDesign, String>
    {
        return TransformOf<CardDesign, String>(
            fromJSON: { (value: String?) -> CardDesign? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardDesign?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
