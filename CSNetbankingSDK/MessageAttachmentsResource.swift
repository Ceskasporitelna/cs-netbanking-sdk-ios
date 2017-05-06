//
//  MessageAttachmentsResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class MessageAttachmentsResource: NetbankingResource, HasInstanceResource
{
    /**
     * Get the resource of attachments
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> MessageAttachmentResource
    {
        return MessageAttachmentResource(id: id, path: self.path, client: self.client);
    }
}
