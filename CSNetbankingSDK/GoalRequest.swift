//
//  GoalRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 04/09/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class GoalRequest: WebApiEntity
{
    /**
     * Saving goal name. Must be non-empty and unique among goals of one client. Mandatory.
     */
    public var name:                                         String?
    
    /**
     * Price of the saving goal. Mandatory.
     */
    public var price:                                        Amount?
    
    /**
     * Maximal date (deadline) of the saving goal completion. Mandatory.
     */
    public var deadline:                                     Date?
    
    /**
     * Flag of the completed goal. Mandatory.
     */
    public var completed:                                    Bool?
    
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
        self.name                 <- map["name"]
        self.price                <- map["price"]
        
        let transform = TransformOf<Date, NSNumber>(
            fromJSON: { (value: NSNumber?) -> Date? in
                if let value = value {
                    return Date.init(timeIntervalSince1970: value.doubleValue)
                }
                return nil
            },
            toJSON: { (value: Date?) -> NSNumber? in
                if let value = value {
                    return NSNumber(value: value.timeIntervalSince1970)
                }
                return nil
        })
        self.deadline             <- (map["deadline"], transform)
        self.completed            <- map["completed"]
        
        super.mapping( map )
    }
    
}
