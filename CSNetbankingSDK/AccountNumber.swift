//
//  AccountNumber.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Domestic account number provides information about account number.
 *
 * Account number comes in two flavors IBAN (IBAN plus optional BIC)
 * identification local account number (BBAN) plus mandatory bank code plus optional country code
 * (in case iban is available along with the local account number optional fields cz-iban and cz-bic are provided)
 * This is due to fact, that using of IBAN format was not adopted in all the Erste group countries.
 * Some applications of ACCOUNTNO are restricted to one of the two
 * flavors only. F.i. when posting new SEPA payment orders sender and receiver accounts must be
 * specified by IBAN format only, or when posting new Domestic payment in CSAS BBAN format should be used.
 * However when requesting existing transactions the receiver account may be returned in
 * format BBAN or IBAN (for SEPA payments). Therefore the ACCOUNTNO object may in some cases
 * only contain IBAN, only local BBAN, or both.
 */

//==============================================================================
public class AccountNumber: WebApiEntity
{
    /**
     * Account number with possible prefix. Format is "XXXXXX-NNNNNNNNNN" 
     * if prefix is not null or "000000". If prefix is not provided then format is "NNNNNNNNNN" without leading zeros.
     */
    public var number:                            String!
    
    /**
     * Bank Code
     */
    public var bankCode:                          String!
    
    /**
     * Code of the Country - 2 characters; mandatoryfor international orders.
     */
    public var countryCode:                       String?
    
    /**
     * Local IBAN
     */
    public var czIBAN:                            String?
    
    /**
     * Local BIC
     */
    public var czBIC:                             String?
    
    /**
     * IBAN
     */
    public var iban:                              String?
    
    /**
     * BIC
     */
    public var bic:                               String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.number   = String()
        self.bankCode = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.number                 <- map["number"]
        self.bankCode               <- map["bankCode"]
        self.countryCode            <- map["countryCode"]
        self.czIBAN                 <- map["cz-iban"]
        self.czBIC                  <- map["cz-bic"]
        self.iban                   <- map["iban"]
        self.bic                    <- map["bic"]
        
        super.mapping( map )
    }
}
