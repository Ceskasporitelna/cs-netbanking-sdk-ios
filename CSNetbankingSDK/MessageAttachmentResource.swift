//
//  MessageAttachmentResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class MessageAttachmentResource: NetbankingInstanceResource
{
    /**
     * Downloads attachment file. Returns path to downloaded file in the callback, when success.
     */
    //--------------------------------------------------------------------------
    public func download(_ callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        ResourceUtils.CallDownload( method: .POST, resource: self, pathSuffix: nil, parameters: nil, contentType: "application/pdf", callback: callback)
    }
}
