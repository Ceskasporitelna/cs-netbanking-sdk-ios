//
//  Contribution.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class Contribution: WebApiEntity
{
    /**
     * Indication whether employer contribution is set up.
     */
    public internal (set) var employer:                              Bool!
    
    /**
     * Participant contribution value.
     */
    public internal (set) var participantAmount:                     Amount!
    
    /**
     * Other person contribution value.
     */
    public internal (set) var otherPersonAmount:                     Amount!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.employer          = Bool()
        self.participantAmount = Amount()
        self.otherPersonAmount = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.employer                   <- map["employer"]
        self.participantAmount          <- map["participantAmount"]
        self.otherPersonAmount          <- map["otherPersonAmount"]
        
        super.mapping( map )
    }
}
