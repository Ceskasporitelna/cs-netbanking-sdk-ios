//
//  ButtonDesign.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let DefaultValue              = "DEFAULT"
fileprivate let BorderValue               = "BORDER"
fileprivate let PrimaryValue              = "PRIMARY"
fileprivate let SuccessValue              = "SUCCESS"
fileprivate let InfoValue                 = "INFO"
fileprivate let WarningValue              = "WARNING"
fileprivate let DangerValue               = "DANGER"
fileprivate let LinkValue                 = "LINK"
fileprivate let GreyValue                 = "GREY"

//==============================================================================
public enum ButtonDesign: Transformable
{
    /**
     * Default button design.
     */
    case defaultType
    
    /**
     * Border button design.
     */
    case borderType
    
    /**
     * Primary button design.
     */
    case primaryType
    
    /**
     * Success button design.
     */
    case successType
    
    /**
     * Info button design.
     */
    case infoType
    
    /**
     * Warning button design.
     */
    case warningType
    
    /**
     * Danger button design.
     */
    case dangerType
    
    /**
     * Link button design.
     */
    case linkType
    
    /**
     * Grey button design.
     */
    case greyType
    
    /**
     * Other button design.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .defaultType:
            return DefaultValue
        case .borderType:
            return BorderValue
        case .primaryType:
            return PrimaryValue
        case .successType:
            return SuccessValue
        case .infoType:
            return InfoValue
        case .warningType:
            return WarningValue
        case .dangerType:
            return DangerValue
        case .linkType:
            return LinkValue
        case .greyType:
            return GreyValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ButtonDesign
    {
        switch string {
        case DefaultValue:
            return .defaultType
        case BorderValue:
            return .borderType
        case PrimaryValue:
            return .primaryType
        case SuccessValue:
            return .successType
        case InfoValue:
            return .infoType
        case WarningValue:
            return .warningType
        case DangerValue:
            return .dangerType
        case LinkValue:
            return .linkType
        case GreyValue:
            return .greyType
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ButtonDesign, String>
    {
        return TransformOf<ButtonDesign, String>(
            fromJSON: { (value: String?) -> ButtonDesign? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ButtonDesign?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
