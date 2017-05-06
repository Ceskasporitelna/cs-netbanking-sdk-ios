//
//  PaymentsParameters.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 30/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum PaymentsSortableField : HasFieldName
{
    /**
     * Statement date
     */
    case transferDate
    
    /**
     * Other sort parameters.
     */
    case other(value : String)

    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .transferDate:
            return "transferDate"
        case .other(let value):
            return value
        }
    }
}

// MARK: - Parameters
//==============================================================================
public class PaymentsParameters: ListParameters, Sortable
{
    public var sortBy : Sort<PaymentsSortableField>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?, sort: Sort<PaymentsSortableField>?)
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
