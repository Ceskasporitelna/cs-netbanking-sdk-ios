//
//  OverdraftAmount.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 03/07/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The type Overdraft amount provides infromation about Overdraft.
 */
//==============================================================================
public class OverdraftAmount: Amount
{
    /**
     * Due date of overdraft. Only for overdrafts where automatic prolongation is not set.
     */
    public var overdraftDueDate:               Date?
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.overdraftDueDate        <- (map["overdraftDueDate"], CustomDateFormatTransform(formatString: CSNetbanking.DateFormat))
        super.mapping( map )
    }
}
