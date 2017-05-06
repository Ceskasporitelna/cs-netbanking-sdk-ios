//
//  PensionBeneficiaries.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class PensionBeneficiaries: WebApiEntity
{
    /**
     * Beneficiary name.
     */
    public internal (set) var name:                               String!
    
    /**
     * Beneficiary birth date.
     */
    public internal (set) var birthDate:                          Date!
    
    /**
     * Beneficiary birth number.
     */
    public internal (set) var birthNumber:                        String!
    
    /**
     * Address where card should be sent.
     */
    public internal (set) var address:                            Address?
    
    /**
     * Beneficiary share. Value in percentage, e.g. 0,5 will be displayed as 0,5 %.
     */
    public internal (set) var share:                              Double!
    
    /**
     * Entitlement type. Possible values TAKEOVER.
     */
    public internal (set) var entitlement:                        Entitlement?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.name         = String()
        self.birthDate    = Date()
        self.birthNumber  = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.name                <- map["name"]
        self.birthDate           <- (map["birthDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.birthNumber         <- map["birthNumber"]
        self.address             <- map["address"]
        self.share               <- map["share"]
        self.entitlement         <- (map["entitlement"], Entitlement.transform())
        
        super.mapping( map )
    }
}
