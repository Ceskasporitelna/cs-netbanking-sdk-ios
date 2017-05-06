//
//  ProductAccount.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class ProductAccount: WebApiEntity
{
    /**
     * Account balance.
     */
    public var amount:                              Amount!
    
    /**
     * Date of the account balance validity.
     */
    public var date:                                Date!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.amount = Amount()
        self.date   = Date()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.amount                         <- map["amount"]
        self.date                           <- (map["date"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        
        super.mapping( map )
    }

}
