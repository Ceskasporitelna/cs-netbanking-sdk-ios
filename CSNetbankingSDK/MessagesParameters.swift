//
//  MessagesParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum MessagesSortableFields : HasFieldName
{
    /**
     * Sort by from field
     */
    case from
    
    /**
     * Sort by date
     */
    case date
    
    /**
     * Sort by id
     */
    case id
    
    /**
     * Sort by other field.
     */
    case other(value : String)
    
    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .from:
            return "from"
        case .date:
            return "date"
        case .id:
            return "id"
        case .other(let value):
            return value
        }
    }
}

// MARK: - Parameters
//==============================================================================
public class MessagesParameters: ListParameters, Sortable
{
    public var sortBy : Sort<MessagesSortableFields>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?, sort: Sort<MessagesSortableFields>?)
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
