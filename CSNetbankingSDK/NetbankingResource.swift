//
//  NetbankingEntity.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 31/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class NetbankingResource: Resource
{
    public var customPath: String {
        if let range = self.path.range(of: "/my/" ) {
            return String(self.path[..<range.lowerBound]) + "/cz" + String(self.path[range.lowerBound...])
        }
        else {
            return self.path
        }
    }
    
    //--------------------------------------------------------------------------
    override public init(path : String, client : WebApiClient)
    {
        super.init(path: path, client: client)
    }

}
