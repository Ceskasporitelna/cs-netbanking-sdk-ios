//
//  FundListResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 27/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class FundListResponse: WebApiEntity
{
    /**
     * Total invested amount into all funds in CZK.
     */
    public internal (set) var totalInvestedAmount:                            Amount!
    
    /**
     * Shows, whether a investment program is active for life insurance product. The field can be either blank or filled with 2 values - INVESTMENT_MANAGEMENT or CONSEQ
     */
    public internal (set) var investmentProgram:                              String?
    
    /**
     * Array of flags for funds.
     */
    public internal (set) var flags:                                          [String]?
    
    /**
     * Array of funds.
     */
    public internal (set) var funds:                                          [Fund]!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.totalInvestedAmount = Amount()
        self.funds               = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.totalInvestedAmount                     <- map["totalInvestedAmount"]
        self.investmentProgram                       <- map["investmentProgram"]
        self.flags                                   <- map["flags"]
        self.funds                                   <- map["funds"]
        
        super.mapping( map )
    }
}
