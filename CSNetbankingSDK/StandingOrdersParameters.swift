//
//  StandingOrdersParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum StandingOrdersSortableFields : HasFieldName
{
    /**
     * Sort by next execution date.
     */
    case nextExecutionDate
    
    /**
     * Sort by other field.
     */
    case other(value : String)
    
    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .nextExecutionDate:
            return "nextExecutionDate"
        case .other(let value):
            return value
        }
    }
}

// MARK: - Parameters
//==============================================================================
public class StandingOrdersParameters: ListParameters, Sortable
{
    public var sortBy : Sort<StandingOrdersSortableFields>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?, sort: Sort<StandingOrdersSortableFields>?)
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
