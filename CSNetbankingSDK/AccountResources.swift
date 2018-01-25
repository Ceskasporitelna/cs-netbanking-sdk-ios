//
//  AccountResources.swift
//  CSNetbankingSDK
//
//  Created by Marty on 07/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

/**
 * Get detail of the individual account and additional information about it
 */
//==============================================================================
public class AccountResource:  NetbankingInstanceResource, GetEnabled, UpdateEnabled
{
    
    /**
     * Get information about the account's balance
     */
    //--------------------------------------------------------------------------
    public var balance: AccountBalanceResource {
        return AccountBalanceResource( path: self.path + "/balance", client: self.client );
    }
    
    /**
     * Get information about the account's services
     */
    //--------------------------------------------------------------------------
    public var services: AccountServicesResource {
        return AccountServicesResource( path: self.customPath + "/services", client: self.client );
    }
    
    /**
     * Get information about the account's statements
     */
    //--------------------------------------------------------------------------
    public var statements: AccountStatementsResource {
        return AccountStatementsResource( path: self.path + "/statements", client: self.client )
    }
    
    /**
     * Get information about the account's transactions
     */
    //--------------------------------------------------------------------------
    public var transactions: AccountTransactionsResource {
        return AccountTransactionsResource( path: self.path + "/transactions", client: self.client )
    }
    
    /**
     * Get information about the account's transactions history
     */
    //--------------------------------------------------------------------------
    public var transactionsHistory: AccountTransactionsHistoryResource {
        return AccountTransactionsHistoryResource( path: self.customPath + "/transactions", client: self.client )
    }
    
    /**
     * Get information about the account's reservations
     */
    //--------------------------------------------------------------------------
    public var reservations: AccountReservationsResource {
        return AccountReservationsResource( path: self.path + "/reservations", client: self.client )
    }
    
    /**
     * Revolve a loan
     */
    //--------------------------------------------------------------------------
    public var transfer: AccountTransferResource {
        return AccountTransferResource( path: self.customPath + "/transfer", client: self.client )
    }
    
    /**
     * Get information about the account's repayments
     */
    //--------------------------------------------------------------------------
    public var repayments: AccountRepaymentsResource {
        return AccountRepaymentsResource( path: self.customPath + "/repayments", client: self.client )
    }
    
    /**
     * Get information about the account's subaccounts
     */
    //--------------------------------------------------------------------------
    public var subAccounts: AccountSubAccountsResource {
        return AccountSubAccountsResource( path: self.customPath + "/subaccounts", client: self.client )
    }
    
    /**
     * Get standing orders resource
     */
    //--------------------------------------------------------------------------
    public var standingOrders: AccountStandingOrdersResource {
        return AccountStandingOrdersResource( path: self.path + "/standingorders", client: self.client )
    }
    
    /**
     * Get direct debits resource
     */
    //--------------------------------------------------------------------------
    public var directDebits: AccountDirectDebitsResource {
        return AccountDirectDebitsResource( path: self.customPath + "/directdebits", client: self.client )
    }
    
    /**
     * Get account detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<MainAccountResponse>) -> () )
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
    
    /**
     * Update account's settings.
     */
    //--------------------------------------------------------------------------
    public func update(_ request : ChangeAccountSettingsRequest, callback: @escaping (_ result:CoreResult<ChangeAccountSettingsResponse>)->Void)
    {
        ResourceUtils.CallUpdate(self, payload: request, transform: nil, callback: callback)
    }
}

