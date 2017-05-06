//
//  UpdateFundResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class UpdateFundResponse: WebApiEntity, Signable
{
    /**
     * Array of fund info.
     */
    public var funds:                                   [FundInfo]!
    
    /**
     * Shows, whether an investment program is active for life insurance product.
     * The field can be either blank or filled with 2 values - INVESTMENT_MANAGEMENT or CONSEQ
     */
    public var investmentProgram:                        String?
    
    /**
     * Infomation about the signing
     */
    public var signInfo:                                 SignInfo?
    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                                  SigningObject?
    
    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                                  String {
        return self.resource.path
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.funds = []
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
        self.signInfo <- map["signInfo"]
        super.mapping( map )
    }


}
