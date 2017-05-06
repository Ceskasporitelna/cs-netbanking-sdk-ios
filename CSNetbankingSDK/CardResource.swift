//
//  CardResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 31/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class CardResource: NetbankingInstanceResource, GetEnabled, UpdateEnabled
{
    
    /**
     * Issue various actions on a single card. Currently supported actions are:
     * reissue pin, lock card, unlock card, activate card, set automatic card 
     * replacement on, set automatic card replacement off, replacement card request.
     */
    //--------------------------------------------------------------------------
    public var actions: CardActionsResource {
        return CardActionsResource( path: self.path + "/states", client: self.client )
    }
    
    /**
     * Allows to add or change a client's personal note and mark/star the card transaction as favorite/important for one specific transaction
     */
    //--------------------------------------------------------------------------
    public var transactions: CardTransactionsResource {
        return CardTransactionsResource( path: self.path + "/transactions", client: self.client )
    }
    
    /**
     * Get current delivery settings
     */
    //--------------------------------------------------------------------------
    public var delivery: CardDeliveryResource {
        return CardDeliveryResource( path: self.path + "/delivery", client: self.client )
    }
    
    /**
     * Get information about different limits
     */
    //--------------------------------------------------------------------------
    public var limits: CardLimitsResource {
        return CardLimitsResource( path: self.path + "/card-limits", client: self.client )
    }
    
    /**
     * Account resource for listing statements
     */
    //--------------------------------------------------------------------------
    public var accounts: AccountsResource {
        return AccountsResource( path: self.path + "/mainaccount", client: self.client )
    }
    
    /**
     * Resource for paying up credit card debt
     */
    //--------------------------------------------------------------------------
    public var transfer: CardTransferResource {
        return CardTransferResource( path: self.path + "/transfer", client: self.client )
    }
    
    /**
     * Get the 3D secure online shopping status
     */
    //--------------------------------------------------------------------------
    public var secure3D: CardSecure3DResource {
        return CardSecure3DResource( path: self.path + "/secure-online-shopping", client: self.client )
    }
    
    /**
     * Get detail of the card
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<CardResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback);
    }
    
    /**
     * Update card's alias
     */
    //--------------------------------------------------------------------------
    public func update(_ request : ChangeCardSettingsRequest, callback: @escaping (_ result:CoreResult<ChangeCardSettingsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }

}
