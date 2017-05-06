//
//  MarketingInfoAcceptance.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let AcceptedValue         = "ACCEPTED"
fileprivate let NotAcceptedValue      = "NOT_ACCEPTED"
fileprivate let UnknownValue          = "UNKNOWN"

//==============================================================================
public enum MarketingInfoAcceptance: Transformable
{
    /**
     * Accepted marketing info acceptance.
     */
    case accepted
    
    /**
     * Not accepted marketing info acceptance.
     */
    case notAccepted
    
    /**
     * Unknown marketing info acceptance.
     */
    case unknown
    
    /**
     * Other marketing info acceptance.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .accepted:
            return AcceptedValue
        case .notAccepted:
            return NotAcceptedValue
        case .unknown:
            return UnknownValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> MarketingInfoAcceptance
    {
        switch string {
        case AcceptedValue:
            return .accepted
        case NotAcceptedValue:
            return .notAccepted
        case UnknownValue:
            return .unknown
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<MarketingInfoAcceptance, String>
    {
        return TransformOf<MarketingInfoAcceptance, String>(
            fromJSON: { (value: String?) -> MarketingInfoAcceptance? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: MarketingInfoAcceptance?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
