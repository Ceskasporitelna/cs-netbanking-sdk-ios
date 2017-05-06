//
//  SavingGoal.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 17/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let Electronics        = "ELECTRONICS"
fileprivate let WhiteGoods         = "WHITE_GOODS"
fileprivate let Holidays           = "HOLIDAYS"
fileprivate let SportEquipment     = "SPORT_EQUIPMENT"
fileprivate let Furniture          = "FURNITURE"
fileprivate let CarsAndAccessories = "CARS_AND_ACCESSORIES"
fileprivate let HobbiesAndGarden   = "HOBBIES_AND_GARDEN"
fileprivate let GiftsAndParties    = "GIFTS_AND_PARTIES"
fileprivate let Health             = "HEALTH"
fileprivate let Studies            = "STUDIES"
fileprivate let Housing            = "HOUSING"
fileprivate let Personal           = "PERSONAL"

/**
 * The enum Saving goal.
 */

//==============================================================================
public enum SavingGoal: Transformable
{
    /**
     * Electronics saving goal.
     */
    case electronics
    
    /**
     * White goods saving goal.
     */
    case whiteGoods
    
    /**
     * Holidays saving goal.
     */
    case holidays
    
    /**
     * Sport equipment saving goal.
     */
    case sportEquipment
    
    /**
     * Furniture saving goal.
     */
    case furniture
    
    /**
     * Cars and accessories saving goal.
     */
    case carsAndAccessories
    
    /**
     * Hobbies and garden saving goal.
     */
    case hobbiesAndGarden
    
    /**
     * Gifts and parties saving goal.
     */
    case giftsAndParties
    
    /**
     * Health saving goal.
     */
    case health
    
    /**
     * Studies saving goal.
     */
    case studies
    
    /**
     * Housing saving goal.
     */
    case housing
    
    /**
     * Personal saving goal.
     */
    case personal
    
    /**
     * Other saving goal.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .electronics:
            return Electronics
        case .whiteGoods:
            return WhiteGoods
        case .holidays:
            return Holidays
        case .sportEquipment:
            return SportEquipment
        case .furniture:
            return Furniture
        case .carsAndAccessories:
            return CarsAndAccessories
        case .hobbiesAndGarden:
            return HobbiesAndGarden
        case .giftsAndParties:
            return GiftsAndParties
        case .health:
            return Health
        case .studies:
            return Studies
        case .housing:
            return Housing
        case .personal:
            return Personal
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> SavingGoal
    {
        switch string {
        case Electronics:
            return .electronics
        case WhiteGoods:
            return .whiteGoods
        case Holidays:
            return .holidays
        case SportEquipment:
            return .sportEquipment
        case Furniture:
            return .furniture
        case CarsAndAccessories:
            return .carsAndAccessories
        case HobbiesAndGarden:
            return .hobbiesAndGarden
        case GiftsAndParties:
            return .giftsAndParties
        case Health:
            return .health
        case Studies:
            return .studies
        case Housing:
            return .housing
        case Personal:
            return .personal
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<SavingGoal, String>
    {
        return TransformOf<SavingGoal, String>(
            fromJSON: { (value: String?) -> SavingGoal? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: SavingGoal?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
