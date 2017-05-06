//
//  Format.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let PdfA4 = "PDF_A4"

//==============================================================================
public enum Format: Transformable
{
    /**
     * Pdf A4 format.
     */
    case pdfA4
    
    /**
     * Other format.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .pdfA4:
            return PdfA4
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> Format
    {
        switch string {
        case PdfA4:
            return .pdfA4
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<Format, String>
    {
        return TransformOf<Format, String>(
            fromJSON: { (value: String?) -> Format? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: Format?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
