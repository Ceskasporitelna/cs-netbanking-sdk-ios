//
//  BuildingsContractResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class BuildingsContractResource: NetbankingInstanceResource, GetEnabled, UpdateEnabled
{
    /**
     * Get buildings contracts services resource
     */
    //--------------------------------------------------------------------------
    public var services: BuildingsContractsServicesResource {
        return BuildingsContractsServicesResource( path: self.customPath + "/services", client: self.client )
    }
    
    /**
     * Get buildings contracts transactions resource
     */
    //--------------------------------------------------------------------------
    public var transactions: ContractsTransactionsResource {
        return ContractsTransactionsResource( path: self.customPath + "/transactions", client: self.client )
    }
    
    /**
     * Resource represents one building saving product identified by it's identifier. It can be building saving or loan from building saving.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<BuildingsContractResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Allows to change a limited set of building savings contract-settings of 
     * one specific contract. Currently only the field alias can be changed. 
     * Change only to alias field must not be signed, but response is ready also for signing process.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateBuildingsContractRequest, callback: @escaping (_ result:CoreResult<UpdateBuildingsContractResponse>)->Void)
    {
        request.id = self.id as? String
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }

}
