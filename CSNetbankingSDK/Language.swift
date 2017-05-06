//
//  Language.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let LangEn = "en"
fileprivate let LangDe = "de"
fileprivate let LangCs = "cs"
fileprivate let LangSk = "sk"
fileprivate let LangHr = "hr"
fileprivate let LangSr = "sr"
fileprivate let LangRo = "ro"
fileprivate let LangHu = "hu"
fileprivate let LangFr = "fr"

//==============================================================================
public enum Language: Transformable
{
    /**
     * En language.
     */
    case en
    
    /**
     * De language.
     */
    case de
    
    /**
     * Cs language.
     */
    case cs
    
    /**
     * Sk language.
     */
    case sk
    
    /**
     * Hr language.
     */
    case hr
    
    /**
     * Sr language.
     */
    case sr
    
    /**
     * Ro language.
     */
    case ro
    
    /**
     * Hu language.
     */
    case hu
    
    /**
     * Fr language.
     */
    case fr
    
    /**
     * Other language.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .en:
            return LangEn
        case .de:
            return LangDe
        case .cs:
            return LangCs
        case .sk:
            return LangSk
        case .hr:
            return LangHr
        case .sr:
            return LangSr
        case .ro:
            return LangRo
        case .hu:
            return LangHu
        case .fr:
            return LangFr
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> Language
    {
        switch string {
        case LangEn:
            return .en
        case LangDe:
            return .de
        case LangCs:
            return .cs
        case LangSk:
            return .sk
        case LangHr:
            return .hr
        case LangSr:
            return .sr
        case LangRo:
            return .ro
        case LangHu:
            return .hu
        case LangFr:
            return .fr
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<Language, String>
    {
        return TransformOf<Language, String>(
            fromJSON: { (value: String?) -> Language? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: Language?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }

}
