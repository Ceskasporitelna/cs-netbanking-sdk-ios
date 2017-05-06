//
//  CSNetbanking.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 23/05/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation


//------------------------------------------------------------------------------
public class CSNetbanking: NSObject
{
    public static let BundleIdentifier = "cz.applifting.CSNetbankingSDK"
    public static let DateTimeFormat   = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    public static let DateFormat       = "yyyy-MM-dd"
    
    //--------------------------------------------------------------------------
    class func getBundle() -> Bundle
    {
        let bundleForThisClass = Bundle(for: CSNetbanking.classForCoder())
        if bundleForThisClass.bundleIdentifier == BundleIdentifier {
            return bundleForThisClass
        }
        else {
            return Bundle( url: bundleForThisClass.url(forResource: BundleIdentifier, withExtension: "bundle")!)!
        }
    }
    
    //--------------------------------------------------------------------------
    public class func localized( _ string: String ) -> String
    {
        return NSLocalizedString( string, tableName: nil, bundle: CSNetbanking.getBundle(), value: "", comment: "")
    }
}
