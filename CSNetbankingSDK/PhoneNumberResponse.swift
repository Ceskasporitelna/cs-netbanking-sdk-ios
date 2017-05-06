//
//  PhoneNumberResponse.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK


// MARK: -
//==============================================================================
public class PhoneNumberResponse: WebApiEntity
{
    /**
     * Phone book entry identifier.
     */
    public internal (set) var id:                                String!
    
    /**
     * Alias name of phone number entered by user for his better orientation in phone book.
     */
    public var alias:                                            String?
    
    /**
     * Phone number which will be saved in phone book. The value in the phone number field must be a 9-digit number that cannot have a leading zero.
     */
    public var phoneNumber:                                      String!
    
    /**
     * Array of optional Flag values.
     */
    public var flags:                                            [String]?
    
    
    /**
     * Convenience property to obtain the resource.
     */
    public var phoneNumberResource: PhoneNumberResource? {
        guard let result = self.resource as? PhoneNumberResource else {
            assert(false, "Wrong type of resource, must be PhoneNumberResource!")
            return nil
        }
        return result
    }
    
    /**
     * Convenience method for updating Phone number
     */
    //--------------------------------------------------------------------------
    public func update(_ request : PhoneNumberUpdateRequest, callback: @escaping (_ result:CoreResult<PhoneNumberResponse>)->Void)
    {    
        self.phoneNumberResource!.update(request, callback: callback)
    }
    
    /**
     * Convenience method for deleting Phone number
     */
    //--------------------------------------------------------------------------
    public func delete(_ callback: @escaping (_ result:CoreResult<NetbankingEmptyResponse>)->Void)
    {
        self.phoneNumberResource!.delete(callback)
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
        self.id                               <- map["id"]
        self.alias                            <- map["alias"]
        self.phoneNumber                      <- map["phoneNumber"]
        self.flags                            <- map["flags"]

        super.mapping( map )
    }
    
}
