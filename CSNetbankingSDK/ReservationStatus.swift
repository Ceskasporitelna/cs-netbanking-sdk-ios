//
//  ReservationStatus.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Reserved  = "RESERVED"
fileprivate let Cancelled = "CANCELLED"
fileprivate let Expired   = "EXPIRED"

//==============================================================================
public enum ReservationStatus: Transformable
{
    /**
     * Reserved reservation status.
     */
    case reserved
    
    /**
     * Cancelled reservation status.
     */
    case cancelled
    
    /**
     * Expired reservation status.
     */
    case expired
    
    /**
     * Other card transfer type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .reserved:
            return Reserved
        case .cancelled:
            return Cancelled
        case .expired:
            return Expired
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ReservationStatus
    {
        switch string {
        case Reserved:
            return .reserved
        case Cancelled:
            return .cancelled
        case Expired:
            return .expired
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ReservationStatus, String>
    {
        return TransformOf<ReservationStatus, String>(
            fromJSON: { (value: String?) -> ReservationStatus? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ReservationStatus?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
