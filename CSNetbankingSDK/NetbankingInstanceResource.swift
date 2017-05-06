//
//  NetbankingInstanceResource.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 31/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class NetbankingInstanceResource: InstanceResource
{
    public var customPath: String {
        if let range = self.path.range(of: "/my/" ) {
            return self.path.substring(to: range.lowerBound ) + "/cz" + self.path.substring(from: range.lowerBound)
        }
        else {
            return self.path
        }
    }
    
    //--------------------------------------------------------------------------
    override public init(id : Any!,path : String, client : WebApiClient)
    {
        super.init(id: id, path: path, client: client)
    }
   
}
