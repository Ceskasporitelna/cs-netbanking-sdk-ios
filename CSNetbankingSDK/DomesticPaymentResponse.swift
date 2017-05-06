//
//  DomesticPaymentResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 21/04/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class DomesticPaymentResponse: PaymentResponse
{
    /**
     Signing URL without the `/sign/{id}` part.
     */
    override public var signUrl: String {
        
        guard let idComponent = self.id else {
            assert(false,"id must not be nil!")
            return ""
        }
        
        if ( self.resource.path.contains("/domestic/")) {
            return UrlUtils.urlFromBasePath(self.resource.path, relativePath:"../../\(idComponent)")!
        }
        else {
            return UrlUtils.urlFromBasePath(self.resource.path, relativePath:"../\(idComponent)")!
        }
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        super.mapping( map )
    }
}
