//
//  GoalResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/11/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class GoalResponse: WebApiEntity
{
    /**
     * Saving goal name. Must be non-empty and unique among goals of one client.
     */
    public internal (set) var name:                                         String!
    
    /**
     * Price of the saving goal.
     */
    public internal (set) var price:                                        Amount!
    
    /**
     * Maximal date (deadline) of the saving goal completion.
     */
    public internal (set) var deadline:                                     Date!
    
    /**
     * Flag of the completed goal.
     */
    public internal (set) var completed:                                    Bool!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.name      = String()
        self.price     = Amount()
        self.deadline  = Date()
        self.completed = Bool()
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
