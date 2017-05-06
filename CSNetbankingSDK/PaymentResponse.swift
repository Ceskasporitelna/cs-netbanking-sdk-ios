//
//  PaymentResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 10/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PaymentResponse: WebApiEntity, Signable
{
    /**
     * Internal identifier of payment order. Note that after signing of the order the id could change.
     */
    public internal(set) var id:                                       String!
    
    /**
     * Transaction reference ID provided by BE when payment order was executed.
     */
    public internal(set) var referenceId:                              String?
    
    /**
     * Payment order category determines whether payment is domestic, SEPA, international or inside the bank (domestic, but could be different processing) or between accounts of the same user (domestic, but with better fee policy). Possible values: DOMESTIC, OWN_TRANSFER, SEPA, INTERNATIONAL.
     */
    public internal(set) var orderCategory:                            PaymentCategory!
    
    /**
     * Payment order type (outgoing payment, outgoing direct debit, incoming direct debit) determines further transaction processing in BE. Values: PAYMENT_OUT, DIRECT_DEBIT_IN
     */
    public internal(set) var orderType:                                PaymentOrderType!
    
    /**
     * sender name
     */
    public internal(set) var senderName:                               String?
    
    /**
     * sender account number
     */
    public internal(set) var sender:                                   AccountNumber!
    
    /**
     * receiver name
     */
    public internal(set) var receiverName:                             String?
    
    /**
     * Receiver IBAN in case of international payments.
     */
    public internal(set) var receiver:                                 AccountNumber!
    
    /**
     * payment amount
     */
    public internal(set) var amount:                                   Amount!
    
    /**
     * Information about the symbols
     */
    public internal(set) var symbols:                                  Symbols?
    
    /**
     * Message for payee set during payment order creation. It is used to identify transaction on receiver side. Array of texts 4x35.
     */
    public internal(set) var additionalInfo:                           Info?
    
    /**
     * Message for me set during payment order creation.
     */
    public internal(set) var senderReference:                          String?
    
    /**
     * Datetime when payment order was created/updated (the last time) by user (read-only field is automatically setup/changed by BE system based on POST/PUT request).
     */
    public internal(set) var executionDate:                            Date?
    
    /**
     * Modification date indicates the last update of payment order done by user or BE system (read-only field provided by BE).
     */
    public internal(set) var modificationDate:                         Date?
    
    /**
     * payment transfer date
     */
    public internal(set) var transferDate:                             Date?
    
    /**
     * Datetime till when payment order will be repeated on BE in the case of insufficient funds on account.
     */
    public internal(set) var expirationDate:                           Date?
    
    /**
     * Date and time which should be used for default ordering of the payment orders for display.
     */
    public internal(set) var czOrderingDate:                           Date!
    
    /**
     * Status of the payment order (details above), State of payment order presented to user on FE). Possible values: public, SPOOLED, CANCELLED, CLOSED and DELETED
     */
    public internal(set) var state:                                    PaymentState!
    
    /**
     * State detail of payment order provided based on BE technical states.
     */
    public internal(set) var stateDetail:                              PaymentStateDetail!
    
    /**
     * Indicator whether state (stateDetail value) of payment order is OK from user point of view. For mapping between stateDetail and stateOk indicator values see table below.
     */
    public internal(set) var stateOk:                                  Bool!
    
    /**
     * description of payment order, transaction type
     */
    public internal(set) var czDescription:                            String?
    
    /**
     * ID of the application via which this payment order was entered/modified the last time. Possible values: GEORGE, ATM_PAYMENT, ATM_OTHER, GSM, BRANCH_FE, POST_OFFICE, INTERNET_BANKING, TELEPHONE_BANKER, COLLECTION_BOX, VIDEO_BANKER and UNKNOWN.
     */
    public internal(set) var applicationId:                            ApplicationId?
    
    /**
     * ID of the channel via which this payment order was entered/modified the last time. 
     * Possible values: NET_BANKING, ATM, MOBILE_BANKING, ATM, BRANCH, POST_OFFICE, CALL_CENTRE, VIDEO_BANKING and UNKNOWN
     */
    public internal(set) var channelId:                                ChannelId?
    
    /**
     * Receiver's address
     */
    public internal(set) var receiverAddress:                          String?
    
    /**
     * Array of optional Flag values depends on Payment order category, type.
     */
    public internal(set) var flags:                                    [String]?
    
    /**
     * Infomation about the signing
     */
    public internal(set) var signInfo:                                 SignInfo?
    
    /**
     Signing state of the object. Can be used to get current information about signing state and initiate the signing process
     */
    public var signing:                                                SigningObject?
    
    /**
     Signing URL without the `/sign/{id}` part.
     */
    public var signUrl:                                                String {
        return "\(self.resource.path)/\(self.id)"
    }
    
    public var paymentResource: PaymentResource? {
        guard let result = self.resource as? PaymentResource else {
            assert(false, "Wrong type of resource, must be PaymentResource!")
            return nil
        }
        return result
    }
    /**
     * Convenience method for retrieving payment's detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<PaymentResponse>) -> Void)
    {
        self.paymentResource!.get(callback)
    }
    
    /**
     * Convenience method for removing payment
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<NetbankingEmptyResponse>)->Void)
    {
        self.paymentResource!.delete(callback)
    }

    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id             = String()
        self.orderCategory  = .other(value: "")
        self.orderType      = .other(value: "")
        self.sender         = AccountNumber()
        self.receiver       = AccountNumber()
        self.amount         = Amount()
        self.czOrderingDate = Date()
        self.state          = .other(value: "")
        self.stateDetail    = .other(value: "")
        self.stateOk        = Bool()
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
        self.referenceId                      <- map["referenceId"]
        self.orderCategory                    <- (map["orderCategory"], PaymentCategory.transform())
        self.orderType                        <- (map["orderType"], PaymentOrderType.transform())
        self.senderName                       <- map["senderName"]
        self.sender                           <- map["sender"]
        self.receiverName                     <- map["receiverName"]
        self.receiver                         <- map["receiver"]
        self.amount                           <- map["amount"]
        self.symbols                          <- map["symbols"]
        self.additionalInfo                   <- map["additionalInfo"]
        self.senderReference                  <- map["senderReference"]
        self.executionDate                    <- (map["executionDate"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ssZZZZZ"))
        self.modificationDate                 <- (map["modificationDate"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ssZZZZZ"))
        self.transferDate                     <- (map["transferDate"], CustomDateFormatTransform(formatString: "yyyy-MM-dd"))
        self.expirationDate                   <- (map["expirationDate"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ssZZZZZ"))
        self.czOrderingDate                   <- (map["cz-orderingDate"], CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ssZZZZZ"))
        self.state                            <- (map["state"], PaymentState.transform())
        self.stateDetail                      <- (map["stateDetail"], PaymentStateDetail.transform())
        self.stateOk                          <- map["stateOk"]
        self.czDescription                    <- map["cz-description"]
        self.applicationId                    <- (map["applicationId"], ApplicationId.transform())
        self.channelId                        <- (map["channelId"], ChannelId.transform())
        self.receiverAddress                  <- map["receiverAddress"]
        self.flags                            <- map["flags"]
        self.signInfo                         <- map["signInfo"]
        
        super.mapping( map )
    }

}
