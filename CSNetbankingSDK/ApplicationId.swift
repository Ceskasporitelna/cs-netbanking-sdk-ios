//
//  ApplicationId.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let GeorgeValue              = "GEORGE"
fileprivate let AtmPaymentValue          = "ATM_PAYMENT"
fileprivate let AtmOtherValue            = "ATM_OTHER"
fileprivate let GsmValue                 = "GSM"
fileprivate let BranchFeValue            = "BRANCH_FE"
fileprivate let PostOfficeValue          = "POST_OFFICE"
fileprivate let InternetBankingValue     = "INTERNET_BANKING"
fileprivate let TelephoneBankerValue     = "TELEPHONE_BANKER"
fileprivate let CollectionBoxValue       = "COLLECTION_BOX"
fileprivate let VideoBankerValue         = "VIDEO_BANKER"
fileprivate let UnknownValue             = "UNKNOWN"


//==============================================================================
public enum ApplicationId: Transformable
{
    /**
     * George application id.
     */
    case george
    
    /**
     * Atm payment applicationl id.
     */
    case atmPayment
    
    /**
     * Atm other applicationl id.
     */
    case atmOther
    
    /**
     * Gsm applicationl id.
     */
    case gsm
    
    /**
     * Branch fe applicationl id.
     */
    case branchFe
    
    /**
     * Post office applicationl id.
     */
    case postOffice
    
    /**
     * Internet banking application id.
     */
    case internetBanking

    /**
     * Telephone banker applicationl id.
     */
    case telephoneBanker
    
    /**
     * Collection box applicationl id.
     */
    case collectionBox
    
    /**
     * Video banker applicationl id.
     */
    case videoBanker
    
    /**
     * Unknown application id.
     */
    case unknown
    
    /**
     * Other application id.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .george:
            return GeorgeValue
        case .atmPayment:
            return AtmPaymentValue
        case .atmOther:
            return AtmOtherValue
        case .gsm:
            return GsmValue
        case .branchFe:
            return BranchFeValue
        case .postOffice:
            return PostOfficeValue
        case .internetBanking:
            return InternetBankingValue
        case .telephoneBanker:
            return TelephoneBankerValue
        case .collectionBox:
            return CollectionBoxValue
        case .videoBanker:
            return VideoBankerValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ApplicationId
    {
        switch string {
        case GeorgeValue:
            return .george
        case AtmPaymentValue:
            return .atmPayment
        case AtmOtherValue:
            return .atmOther
        case GsmValue:
            return .gsm
        case BranchFeValue:
            return .branchFe
        case PostOfficeValue:
            return .postOffice
        case InternetBankingValue:
            return .internetBanking
        case TelephoneBankerValue:
            return .telephoneBanker
        case CollectionBoxValue:
            return .collectionBox
        case VideoBankerValue:
            return .videoBanker
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ApplicationId, String>
    {
        return TransformOf<ApplicationId, String>(
            fromJSON: { (value: String?) -> ApplicationId? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ApplicationId?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
