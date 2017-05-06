//
//  SubSecAccountTitle.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class SubSecAccountTitle: WebApiEntity
{
    /**
     * Name of the security title.
     */
    public internal (set) var title:                                       String!
    
    /**
     * ISIN - identifier of the security title.
     */
    public internal (set) var isin:                                        String!
    
    /**
     * Number of securities/shares
     */
    public internal (set) var numberOfShares:                              Double!
    
    /**
     * Last Price of Securities title
     */
    public internal (set) var lastPrice:                                   Amount!
    
    /**
     * Date of securities last price evaluation
     */
    public internal (set) var lastPriceDate:                               Date!
    
    /**
     * Market value of the securities title.
     */
    public internal (set) var marketValue:                                 Amount!
    
    /**
     * Security Product Type. Possible values: BOND, SHARE, FUND, IPO, OPTION, OTHER, INDEX, CERTIFICATE, INVESTMENT,KNOCKOUT, UNKNOWN.
     */
    public internal (set) var securityType:                                SecurityType!
    
    /**
     * Security Product Group. Possible values: BONDS_AND_MORE, GUARANTEE_OF_PRINCIPAL, NO_GUARANTEE_OF_PRINCIPAL, REAL_ESTATE, SHARES, STOCK_AND_MIXED, INVESTMENT, KNOCK_OUT, UNKNOWN.
     */
    public internal (set) var productGroup:                                ProductGroup!
    
    /**
     * Localized security indication depending on security type and product group
     */
    public internal (set) var securityIndication:                          String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.title              = String()
        self.isin               = String()
        self.numberOfShares     = Double()
        self.lastPrice          = Amount()
        self.lastPriceDate      = Date()
        self.marketValue        = Amount()
        self.securityType       = .other(value: "")
        self.productGroup       = .other(value: "")
        self.securityIndication = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.title                            <- map["title"]
        self.isin                             <- map["isin"]
        self.numberOfShares                   <- map["numberOfShares"]
        self.lastPrice                        <- map["lastPrice"]
        self.lastPriceDate                    <- (map["lastPriceDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.marketValue                      <- map["marketValue"]
        self.securityType                     <- (map["securityType"], SecurityType.transform())
        self.productGroup                     <- (map["productGroup"], ProductGroup.transform())
        self.securityIndication               <- map["securityIndication"]
        
        super.mapping( map )
    }
}
