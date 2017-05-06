//
//  UpdateFundRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class UpdateFundRequest: WebApiEntity
{
    /**
     * Array of fund info. Mandatory.
     */
    public var funds:                [FundInfo]?
    
    /**
     * Shows, whether an investment program is active for life insurance product. 
     * The field can be either blank or filled with 2 values - INVESTMENT_MANAGEMENT or CONSEQ
     * Optional.
     */
    public var investmentProgram:    String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.funds                         <- map["funds"]
        self.investmentProgram             <- map["investmentProgram"]
        
        super.mapping( map )
    }
}
