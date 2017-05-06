//
//  CardAction.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ReissuePin                 = "REISSUE_PIN"
fileprivate let LockCard                   = "LOCK_CARD"
fileprivate let UnlockCard                 = "UNLOCK_CARD"
fileprivate let ReplaceCard                = "REPLACE_CARD"
fileprivate let ActivateCard               = "ACTIVATE_CARD"
fileprivate let SetAutomaticReplacementOn  = "SET_AUTOMATIC_REPLACEMENT_ON"
fileprivate let SetAutomaticReplacementOff = "SET_AUTOMATIC_REPLACEMENT_OFF"

//==============================================================================
public enum CardAction: Transformable
{
    /**
     * Reissue pin card action.
     */
    case reissuePin
    
    /**
     * Lock card card action.
     */
    case lockCard
    
    /**
     * Unlock card card action.
     */
    case unlockCard
    
    /**
     * Replace card card action.
     */
    case replaceCard
    
    /**
     * Activate card card action.
     */
    case activateCard
    
    /**
     * Set automatic replacement on card action.
     */
    case setAutomaticReplacementOn
    
    /**
     * Set automatic replacement off card action.
     */
    case setAutomaticReplacementOff
    
    /**
     * Other card action.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .reissuePin:
            return ReissuePin
        case .lockCard:
            return LockCard
        case .unlockCard:
            return UnlockCard
        case .replaceCard:
            return ReplaceCard
        case .activateCard:
            return ActivateCard
        case .setAutomaticReplacementOn:
            return SetAutomaticReplacementOn
        case .setAutomaticReplacementOff:
            return SetAutomaticReplacementOff
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CardAction
    {
        switch string {
        case ReissuePin:
            return .reissuePin
        case LockCard:
            return .lockCard
        case UnlockCard:
            return .unlockCard
        case ReplaceCard:
            return .replaceCard
        case ActivateCard:
            return .activateCard
        case SetAutomaticReplacementOn:
            return .setAutomaticReplacementOn
        case SetAutomaticReplacementOff:
            return .setAutomaticReplacementOff
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CardAction, String>
    {
        return TransformOf<CardAction, String>(
            fromJSON: { (value: String?) -> CardAction? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CardAction?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
