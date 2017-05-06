//
//  AccountsParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum AccountsSortableFields : HasFieldName
{
    /**
     * Sort by iban.
     */
    case iban
    
    /**
     * Sort by balance.
     */
    case balance
    
    /**
     * Sort by type.
     */
    case type
    
    /**
     * Sort by other field.
     */
    case other(value : String)
    
    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .iban:
            return "iban"
        case .balance:
            return "balance"
        case .type:
            return "type"
        case .other(let value):
            return value
        }
    }
}

// MARK: - Parameters
//==============================================================================
public class AccountsParameters: ListParameters, Sortable
{
    public var sortBy : Sort<AccountsSortableFields>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?, sort: Sort<AccountsSortableFields>?)
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
