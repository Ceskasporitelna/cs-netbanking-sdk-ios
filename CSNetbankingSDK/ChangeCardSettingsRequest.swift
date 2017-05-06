//
//  ChangeCardSettingsRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 29/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class ChangeCardSettingsRequest: WebApiEntity
{
    /**
     * ID of the card. Mandatory. Will be set from the resource.
     */
    public internal (set) var id:                                      String?
    
    /**
     * Alias of the card
     */
    public var alias:                                                  String?
    
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
        self.id                               <- map["id"]
        self.alias                            <- map["alias"]
        
        super.mapping( map )
    }

}
