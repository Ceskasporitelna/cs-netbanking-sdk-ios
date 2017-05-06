//
//  PensionsContractResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class PensionsContractResource: NetbankingInstanceResource, GetEnabled, UpdateEnabled
{
    /**
     * Returns transactions resource for pension contract
     */
    //--------------------------------------------------------------------------
    public var transactions: PensionsContractsTransactionsResource {
        return PensionsContractsTransactionsResource(path: self.path, client: self.client)
    }
    
    /**
     * Returns detail of pension product which belongs to current user. 
     * This can be Pension Saving, Supplementary Pension Insurance and Supplementary Pension Saving.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<PensionResponse>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Allows to change a limited set of pension contract-settings of one specific contract. 
     * Currently only the field alias can be changed. Change only to alias field must not be signed, but response is ready also for signing process.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdatePensionRequest, callback: @escaping (_ result:CoreResult<UpdatePensionResponse>)->Void)
    {
        guard let idString = self.id as? String else {
            assert(false, "self.id must be of type String.")
            return
        }
        request.id = idString
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}
