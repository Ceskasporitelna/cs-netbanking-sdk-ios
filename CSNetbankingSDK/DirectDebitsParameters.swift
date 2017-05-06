//
//  DirectDebitsParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum DirectDebitsSortableFields : HasFieldName
{
    /**
     * Sort by approval name chosen by the user.
     */
    case alias
    
    /**
     * Sort by unit of the period cycle.
     */
    case periodCycle
    
    /**
     * Sort by other field.
     */
    case other(value : String)
    
    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .alias:
            return "alias"
        case .periodCycle:
            return "periodCycle"
        case .other(let value):
            return value
        }
    }
}

// MARK: - Parameters
//==============================================================================
public class DirectDebitsParameters: ListParameters, Sortable
{
    public var sortBy : Sort<DirectDebitsSortableFields>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?, sort: Sort<DirectDebitsSortableFields>?)
    {
        super.init(pagination:pagination)
        self.sortBy = sort
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params = super.toDictionary(existingParams)
        if let sortBy = self.sortBy {
            params = sortBy.addSortParams(params)
        }
        return params
    }
}
