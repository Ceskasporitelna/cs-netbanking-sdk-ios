//
//  MessagesMandatoryResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class MessagesMandatoryResource: NetbankingResource, ListEnabled
{
    /**
     * Returns all mandatory messages. This call might return different messages based on appId of the caller (for example, some messages might be specific to an application). Which messages can be seen by which application can be configured on the presto server side.
     */
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<MessageResponse>>) -> Void)
    {
        ResourceUtils.CallList(self, itemJSONKey: "messages", pathSuffix: nil, parameters: nil, transform: nil, callback: callback)
    }
}
