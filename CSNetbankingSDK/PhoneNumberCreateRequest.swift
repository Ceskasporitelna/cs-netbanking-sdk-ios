//
//  PhoneNumberCreateRequest.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK

// MARK: -
//==============================================================================
public class PhoneNumberCreateRequest: WebApiEntity
{
    /**
     * Alias name of phone number entered by user for his better orientation in phone book. Optional.
     */
    public var alias:                                            String?
    
    /**
     * Phone number which will be saved in phone book. The value in the phone 
     * number field must be a 9-digit number that cannot have a leading zero. Mandatory.
     */
    public var phoneNumber:                                      String?
    
    /**
     * Array of optional Flag values. Optional.
     */
    public var flags:                                            [String]?
    
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
        self.alias                            <- map["alias"]
        self.phoneNumber                      <- map["phoneNumber"]
        self.flags                            <- map["flags"]
        
        super.mapping( map )
    }
    
}
