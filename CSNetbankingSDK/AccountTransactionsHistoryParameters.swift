//
//  AccountTransactionsHistoryParameters.swift
//  CSNetbankingSDK
//
//  Created by Jan Hauser on 23/01/2018.
//  Copyright © 2018 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

public class AccountTransactionsHistoryParameters: ListParameters
{
    
    /**
     * Date from which transactions should be listed.
     */
    public internal(set) var dateStart:                    Date!
    
    /**
     * Date to which transactions should be listed.
     */
    public internal(set) var dateEnd:                      Date!
    
    public override init(pagination:Pagination?){
        super.init(pagination:pagination)
    }
    
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params                = super.toDictionary(existingParams)
        
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        if let date = self.dateStart {
            params ["dateStart"]       = dateFormatter.string(from: date) as AnyObject?
        }
        if let date = self.dateEnd {
            params ["dateEnd"]         = dateFormatter.string(from: date) as AnyObject?
        }
        
        return params
    }
    
}
