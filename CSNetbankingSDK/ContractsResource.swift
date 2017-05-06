//
//  ContractsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class ContractsResource: NetbankingResource
{
    /**
     * Get buildings contracts resource
     */
    //--------------------------------------------------------------------------
    public var buildings: BuildingsContractsResource {
        return BuildingsContractsResource(path: self.path + "/buildings", client: self.client)
    }
    
    /**
     * Get insurances contracts resource
     */
    //--------------------------------------------------------------------------
    public var insurances: InsurancesContractsResource {
        return InsurancesContractsResource(path: self.path + "/insurances", client: self.client)
    }
    
    /**
     * Get pensions contracts resource
     */
    //--------------------------------------------------------------------------
    public var pensions: PensionsContractsResource {
        return PensionsContractsResource(path: self.customPath + "/pensions", client: self.client)
    }
    
    /**
     * Get loyalty contracts resource
     */
    //--------------------------------------------------------------------------
    public var loyalty: LoyaltyContractsResource {
        return LoyaltyContractsResource(path: self.customPath + "/loyalty", client: self.client)
    }
}
