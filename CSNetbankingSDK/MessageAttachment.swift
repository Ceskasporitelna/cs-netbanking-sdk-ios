//
//  MessageAttachment.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class MessageAttachment: WebApiEntity
{
    /**
     * Attachment identifier.
     */
    public internal (set) var id:                                 String!
    
    /**
     * File name of the attachment.
     */
    public internal (set) var fileName:                           String!
    
    public var messageResource: MessageResource {
        return ( self.resource as! MessageResource )
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id       = String()
        self.fileName = String()
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
        self.fileName                 <- map["fileName"]
        
        super.mapping( map )
    }
    
    /**
     * Downloads attachment file. Returns path to downloaded file in the callback, when success.
     */
    //--------------------------------------------------------------------------
    public func download(_ callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        self.messageResource.attachments.withId(self.id).download(callback)
    }


}
