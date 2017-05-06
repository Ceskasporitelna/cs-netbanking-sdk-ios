//
//  TemplateResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class TemplateResponse: WebApiEntity
{
    /**
     * template ID
     */
    public internal (set) var id:                                       String!
    
    /**
     * name defined by user
     */
    public internal (set) var name:                                     String?
    
    /**
     * Order category. Possible values: DOMESTIC, INTERNATIONAL
     */
    public internal (set) var orderCategory:                            OrderCategory?
    
    /**
     * Receiver account number.
     */
    public internal (set) var receiver:                                 AccountNumber!
    
    /**
     * Convenience property to obtain the resource.
     */
    public var templateResource: TemplateResource {
        return (self.resource.client as! NetbankingClient).templates.withId(self.id as AnyObject)
    }
    
    /**
     * Convenience method for fetching templates detail
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<TemplateResponse>) -> ())
    {
        self.templateResource.get(callback)
    }

    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id       = String()
        self.receiver = AccountNumber()
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
        self.name                     <- map["name"]
        self.orderCategory            <- (map["orderCategory"], OrderCategory.transform())
        self.receiver                 <- map["receiver"]
        
        super.mapping( map )
    }
}
