//
//  InsuranceBeneficiary.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class InsuranceBeneficiary: WebApiEntity
{
    /**
     * Type of beneficiary
     */
    public var type:                       InsuranceBeneficiaryType!
    
    /**
     * Name of the beneficiary.
     */
    public var name:                       String?
    
    /**
     * Birthdate of the beneficiary.
     */
    public var birthdate:                  Date?
    
    /**
     * Percentage of the insurance contract determined to beneficiary 
     * or distributed by law. Value in percentage, e.g. 63 will be displayed as 63 %.
     */
    public var percentage:                 Double?
    
    /**
     * Attribute returns unstructured information about distribution among beneficiaries 
     * in a single string in 2 cases: 1) Distribution have never been changed 
     * (after modifying the distribution - information will be returned ina structured form); 2) 
     * BE did not cut up unstructured format.
     */
    public var unstructuredInfo:           String?
    
    /**
     * List of flags.
     */
    public var flags:                      [String]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.type = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.type                      <- (map["type"], InsuranceBeneficiaryType.transform())
        self.name                      <- map["name"]
        self.birthdate                 <- (map["birthdate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.percentage                <- map["percentage"]
        self.unstructuredInfo          <- map["unstructuredInfo"]
        self.flags                     <- map["flags"]
        
        super.mapping( map )
    }

}
