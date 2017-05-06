//
//  CardsParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum CardsSortableFields : HasFieldName
{
    /**
     * Sort cards by id.
     */
    case id
    
    /**
     * Sort cards by product.
     */
    case product
    
    /**
     * Sort by other field.
     */
    case other(value : String)
    
    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .id:
            return "id"
        case .product:
            return "product"
        case .other(let value):
            return value
        }
    }
}

// MARK: - Parameters
//==============================================================================
public class CardsParameters: ListParameters, Sortable
{
    public var sortBy : Sort<CardsSortableFields>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?, sort: Sort<CardsSortableFields>?)
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
