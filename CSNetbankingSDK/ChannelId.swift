//
//  ChannelId.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let NetBankingValue              = "NET_BANKING"
fileprivate let MobileBankingValue           = "MOBILE_BANKING"
fileprivate let HomeBankingValue             = "HOME_BANKING"
fileprivate let ThirdPartyBankingValue       = "THIRD_PARTY"
fileprivate let BranchValue                  = "BRANCH"
fileprivate let PostOfficeValue              = "POST_OFFICE"
fileprivate let CallCentreValue              = "CALL_CENTRE"
fileprivate let VideoBankingValue            = "VIDEO_BANKING"
fileprivate let UnknownValue                 = "UNKNOWN"

//==============================================================================
public enum ChannelId: Transformable
{
    /**
     * Net banking channel id.
     */
    case netBanking
    
    /**
     * Mobile banking channel id.
     */
    case mobileBanking
    
    /**
     * Home banking channel id.
     */
    case homeBanking
    
    /**
     * Third party channel id.
     */
    case thirdParty
    
    /**
     * Branch channel id.
     */
    case branch
    
    /**
     * Post office channel id.
     */
    case postOffice
    
    /**
     * Call centre channel id.
     */
    case callCentre
    
    /**
     * Video banking channel id.
     */
    case videoBanking
    
    /**
     * Unknown channel id.
     */
    case unknown
    
    /**
     * Other channel id.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .netBanking:
            return NetBankingValue
        case .mobileBanking:
            return MobileBankingValue
        case .homeBanking:
            return HomeBankingValue
        case .thirdParty:
            return ThirdPartyBankingValue
        case .branch:
            return BranchValue
        case .postOffice:
            return PostOfficeValue
        case .callCentre:
            return CallCentreValue
        case .videoBanking:
            return VideoBankingValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ChannelId
    {
        switch string {
        case NetBankingValue:
            return .netBanking
        case MobileBankingValue:
            return .mobileBanking
        case HomeBankingValue:
            return .homeBanking
        case ThirdPartyBankingValue:
            return .thirdParty
        case BranchValue:
            return .branch
        case PostOfficeValue:
            return .postOffice
        case CallCentreValue:
            return .callCentre
        case VideoBankingValue:
            return .videoBanking
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ChannelId, String>
    {
        return TransformOf<ChannelId, String>(
            fromJSON: { (value: String?) -> ChannelId? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ChannelId?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
