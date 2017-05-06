//
//  AuthorizationType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let TacValue                      = "TAC"
fileprivate let TanValue                      = "TAN"
fileprivate let SmsValue                      = "SMS"
fileprivate let GridCardValue                 = "GRID_CARD"
fileprivate let EokValue                      = "EOK"
fileprivate let DisplayCardValue              = "DISPLAY_CARD"
fileprivate let MTokenValue                   = "M_TOKEN"


//==============================================================================
public enum AuthorizationType: Transformable
{
    /**
     * Tac limit authorization type.
     */
    case tac
    
    /**
     * Tan limit authorization type.
     */
    case tan
    
    /**
     * Sms limit authorization type.
     */
    case sms
    
    /**
     * Grid card limit authorization type.
     */
    case gridCard
    
    /**
     * Eok limit authorization type.
     */
    case eok
    
    /**
     * Display card limit authorization type.
     */
    case displayCard
    
    /**
     * Mtoken limit authorization type.
     */
    case mToken
    
    /**
     * Other limit authorization type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .tac:
            return TacValue
        case .tan:
            return TanValue
        case .sms:
            return SmsValue
        case .gridCard:
            return GridCardValue
        case .eok:
            return EokValue
        case .displayCard:
            return DisplayCardValue
        case .mToken:
            return MTokenValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> AuthorizationType
    {
        switch string {
        case TacValue:
            return .tac
        case TanValue:
            return .tan
        case SmsValue:
            return .sms
        case GridCardValue:
            return .gridCard
        case EokValue:
            return .eok
        case DisplayCardValue:
            return .displayCard
        case MTokenValue:
            return .mToken
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<AuthorizationType, String>
    {
        return TransformOf<AuthorizationType, String>(
            fromJSON: { (value: String?) -> AuthorizationType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: AuthorizationType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
