//
//  MessageResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class MessageResponse: WebApiEntity
{
    /**
     * Message identifier.
     */
    public internal (set) var id:                    String!
    
    /**
     * Name of the message sender. For example source system of the message.
     */
    public internal (set) var from:                  String!
    
    /**
     * Message subject.
     */
    public internal (set) var subject:               String!
    
    /**
     * Date when message was sent/generated.
     */
    public internal (set) var date:                  Date!
    
    /**
     * Body of the message. Body is html code. It is up to FE application to properly display it.
     */
    public internal (set) var body:                  String!
    
    /**
     * Array of message attachments.
     */
    public internal (set) var attachments:           [MessageAttachment]!
    
    /**
     * Array of flags for messages.
     */
    public internal (set) var flags:                 [String]?
    
    /**
     * Convenience property to obtain the resource.
     */
    public var messageResource: MessageResource {
        return (self.resource.client as! NetbankingClient).messages.withId(self.id as AnyObject)
    }
    
    /**
     * Convenience get method for fetching message detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<MessageResponse>) -> () )
    {
        self.messageResource.get(callback)
    }
    
    /**
     * Convenience update method for updating message
     */
    //--------------------------------------------------------------------------
    public func update(_ request : UpdateMessageRequest, callback: @escaping (_ result:CoreResult<NetbankingEmptyResponse>)->Void)
    {
        self.messageResource.update(request, callback: callback)
    }
    
    /**
     * Convenience delete method for deleting message
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<NetbankingEmptyResponse>)->Void)
    {
        self.messageResource.delete(callback)
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id          = String()
        self.from        = String()
        self.subject     = String()
        self.date        = Date()
        self.body        = String()
        self.attachments = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                       <- map["id"]
        self.from                     <- map["from"]
        self.subject                  <- map["subject"]
        self.date                     <- (map["date"], CustomDateFormatTransform(formatString: CSNetbanking.DateTimeFormat))
        self.body                     <- map["body"]
        self.attachments              <- map["attachments"]
        self.flags                    <- map["flags"]
        
        super.mapping( map )
    }

}
