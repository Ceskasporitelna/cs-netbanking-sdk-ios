//
//  NetbankingClient.swift
//  CSNetbankingSDK
//
//  Created by Marty on 07/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class NetbankingClient: WebApiClient
{
    public var profile: ProfileResource {
        return ProfileResource(path: self.pathAppendedWith("my/profile"), client: self )
    }
    
    public var logins: LastLoginsResource {
        return LastLoginsResource(path: self.pathAppendedWith("my/profile/logininfo"), client: self )
    }
    
    public var mainAccount: AccountsResource {
        return AccountsResource(path: self.pathAppendedWith("my/accounts?type=CURRENT"), client: self )
    }
    
    public var accounts: AccountsResource {
        return AccountsResource(path: self.pathAppendedWith("my/accounts"), client: self )
    }
    
    public var cards: CardsResource {
        return CardsResource(path: self.pathAppendedWith("my/cards"), client: self )
    }
    
    public var orders: OrdersResource {
        return OrdersResource(path: self.pathAppendedWith("my/orders"), client: self )
    }
    
    public var contracts: ContractsResource {
        return ContractsResource(path: self.pathAppendedWith("my/contracts"), client: self )
    }
    
    public var securities: SecuritiesResource {
        return SecuritiesResource(path: self.pathAppendedWith("my/securities"), client: self )
    }
    
    public var services: ServicesResource {
        return ServicesResource(path: self.pathAppendedWith("cz/my/services"), client: self )
    }
    
    public var phoneNumbers: PhoneNumbersResource {
        return PhoneNumbersResource(path: self.pathAppendedWith("cz/my/phone-numbers"), client: self )
    }
    
    public var settings: SettingsResource {
        return SettingsResource(path: self.pathAppendedWith("my/settings"), client: self )
    }
    
    public var contacts: ContactsResource {
        return ContactsResource(path: self.pathAppendedWith("my/contacts"), client: self )
    }
    
    public var  messages: MessagesResource {
        return MessagesResource(path: self.pathAppendedWith("my/messages"), client: self )
    }
    
    public var promotions: PromotionsResource {
        return PromotionsResource(path: self.pathAppendedWith("my/promotions"), client: self )
    }
    
    public var templates: TemplatesResource {
        return TemplatesResource(path: self.pathAppendedWith("my/templates"), client: self )
    }
    
    public var plugins: PluginsResource {
        return PluginsResource(path: self.pathAppendedWith("my/plugins"), client: self )
    }
    
    public var budgets: BudgetsResource {
        return BudgetsResource(path: self.pathAppendedWith("cz/my/budgets"), client: self )
    }
    
    public var bundles: BundlesResource {
        return BundlesResource(path: self.pathAppendedWith("my/bundles"), client: self )
    }
    
    public var goals: GoalsResource {
        return GoalsResource(path: self.pathAppendedWith("cz/my/goals"), client: self )
    }
    
    public var authorizationLimits: AuthorizationLimitsResource {
        return AuthorizationLimitsResource(path: self.pathAppendedWith("my/authorizationLimits"), client: self )
    }
    
    public var authorizationToken: AuthorizationTokenResource {
        return AuthorizationTokenResource(path: self.pathAppendedWith("auth/token/invalidate"), client: self )
    }
    
    
    //--------------------------------------------------------------------------
    public override init(config: WebApiConfiguration, apiBasePath: String)
    {
        super.init(config: config, apiBasePath: apiBasePath )
    }
    
    //--------------------------------------------------------------------------
    public convenience init( config: WebApiConfiguration )
    {
        self.init( config: config, apiBasePath: "/api/v3/netbanking" )
    }
    
    
    
}

