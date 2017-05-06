//
//  CardResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.

import CSCoreSDK

// MARK: -
//==============================================================================
public class CardResponse: WebApiEntity
{
    /**
     * Unique product id
     */
    public internal(set) var id:                                       String!
    
    /**
     * Users product name. Max. 50 characters.
     */
    public internal(set) var alias:                                    String?
    
    /**
     * Product owner
     */
    public internal(set) var owner:                                    String!
    
    /**
     * Card number
     */
    public internal(set) var number:                                   String!
    
    /**
     * Card sequence number. The number distinguishing between separate cards (different plastic cards) with the same Primary Account Number (PAN)
     */
    public internal(set) var sequenceNumber:                           String!
    
    /**
     * Localized product name.
     */
    public internal(set) var productI18N:                              String!
    
    /**
     * Internal product code
     */
    public internal(set) var productCode:                              String?
    
    /**
     * Expiration date of particular plastic card
     */
    public internal(set) var expiryDate:                               Date?
    
    /**
     * Date from which this particular plastic card is valid
     */
    public internal(set) var validFromDate:                            Date?
    
    /**
     * Current state of card. Possible values: ACTIVE, INACTIVE (issued card not activated yet), TEMPORARY_BLOCKED.
     */
    public internal(set) var state:                                    CardState!
    
    /**
     * Type of card: credit, debit/bankcard. Possible Values: BANK_CARD (used for debit card too), CREDIT
     */
    public internal(set) var type:                                     CardType!
    
    /**
     * Credit card provider/issuer: Erste Bank or external bank. Possible Values: ERSTE_BANK, EXTERNAL
     */
    public internal(set) var provider:                                 CardProvider!
    
    /**
     * Indicates reason for locking the card. Possible Values: THEFT, LOSS, FRAUD, OTHER
     */
    public internal(set) var lockReason:                               LockReason?
    
    /**
     * Card characteristics. Possible values: MAIN, AUTHORIZED
     */
    public internal(set) var characteristic:                           CardCharacteristic?
    
    /**
     * For credit card: Loan limit for card (shadow) account.
     */
    public internal(set) var limit:                                    Amount?
    
    /**
     * Disposable balance of current account linked to debit/bank card or Available balance of credit card (disposable balance of shadow account). Not available for all cards or states (locked, closed, unknown).
     */
    public internal(set) var balance:                                  Amount?
    
    /**
     * Total outstanding/owed amount for credit card (the last known value).
     */
    public internal(set) var outstandingAmount:                        Amount?
    
    /**
     * Minimal installment repayment amount for credit card (at previous cycle end date).
     */
    public internal(set) var minimalMonthlyAmount:                     Amount?
    
    /**
     * Installment repayment due date.
     */
    public internal(set) var installmentDueDate:                       Date?
    
    /**
     * Information about the main account.
     */
    public internal(set) var mainAccount:                              CardMainAccount?
    
    /**
     * Information about the main account's limits.
     */
    public internal(set) var czOverallCardAccountLimits:               CardAccountLimits?
    
    /**
     * Indicates how a client receives their card and pin. Possible values: BRANCH, HOME, OTHER_BRANCH, ADDRESS_ABROAD.
     */
    public internal(set) var cardDeliveryMode:                         CardDeliveryMode?
    
    /**
     * Array of optional features valid for given card.
     */
    public internal(set) var features:                                [String]?
    
    /**
     * Array of optional Flag values depends on Card type.
     */
    public internal(set) var flags:                                   [String]?
    
    
    public var cardResource: CardResource {
        return (self.resource.client as! NetbankingClient).cards.withId(self.id as AnyObject)
    }
    
    /**
     * Convenience method for getting detail of the card right from the list
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping ((_ result: CoreResult<CardResponse>) -> Void))
    {
        self.cardResource.get(callback)
    }
    
    /**
     * Convenience method for updating card's settings
     */
    //--------------------------------------------------------------------------
    public func update(_ request : ChangeCardSettingsRequest, callback: @escaping (_ result:CoreResult<ChangeCardSettingsResponse>)->Void)
    {
        self.cardResource.update(request, callback: callback)
    }
    
    /**
     * Convenience getter for getting card's delivery resource
     */
    //--------------------------------------------------------------------------
    public var delivery: CardDeliveryResource {
        return self.cardResource.delivery
    }
    
    /**
     * Convenience getter for getting card's transactions resource
     */
    //--------------------------------------------------------------------------
    public var transactions: CardTransactionsResource {
        return self.cardResource.transactions
    }
    
    /**
     * Convenience getter for getting card's actions resource
     */
    //--------------------------------------------------------------------------
    public var actions: CardActionsResource {
        return self.cardResource.actions
    }
    
    /**
     * Convenience getter for getting card's limits resource
     */
    //--------------------------------------------------------------------------
    public var limits: CardLimitsResource {
        return self.cardResource.limits
    }
    
    /**
     * Convenience getter for getting card's 3D Secure resource
     */
    //--------------------------------------------------------------------------
    public var secure3D: CardSecure3DResource {
        return self.cardResource.secure3D
    }
    
    /**
     * Convenience getter for getting card's transfer resource
     */
    //--------------------------------------------------------------------------
    public var transfer: CardTransferResource {
        return self.cardResource.transfer
    }
    
    /**
     * Convenience getter for getting card's accounts resource
     */
    //--------------------------------------------------------------------------
    public var accounts: AccountsResource {
        return self.cardResource.accounts
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id               = String()
        self.owner            = String()
        self.number           = String()
        self.sequenceNumber   = String()
        self.productI18N      = String()
        self.state            = .other(value:"")
        self.type             = .other(value:"")
        self.provider         = .other(value:"")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- map["id"]
        self.alias                            <- map["alias"]
        self.owner                            <- map["owner"]
        self.number                           <- map["number"]
        self.sequenceNumber                   <- map["sequenceNumber"]
        self.productI18N                      <- map["productI18N"]
        self.productCode                      <- map["productCode"]
        self.expiryDate                       <- (map["expiryDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.validFromDate                    <- (map["validFromDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.state                            <- (map["state"], CardState.transform())
        self.type                             <- (map["type"], CardType.transform())
        self.provider                         <- (map["provider"], CardProvider.transform())
        self.lockReason                       <- (map["lockReason"], LockReason.transform())
        self.characteristic                   <- (map["characteristic"], CardCharacteristic.transform())
        self.limit                            <- map["limit"]
        self.balance                          <- map["balance"]
        self.outstandingAmount                <- map["outstandingAmount"]
        self.minimalMonthlyAmount             <- map["minimalMonthlyAmount"]
        self.installmentDueDate               <- (map["installmentDueDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        self.mainAccount                      <- map["mainAccount"]
        self.czOverallCardAccountLimits       <- map["cz-overallCardAccountLimits"]
        self.cardDeliveryMode                 <- (map["cardDeliveryMode"], CardDeliveryMode.transform())
        self.features                         <- map["features"]
        self.flags                            <- map["flags"]
        
        super.mapping( map )
    }

}



