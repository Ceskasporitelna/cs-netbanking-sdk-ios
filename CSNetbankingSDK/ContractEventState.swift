//
//  ContractEventState.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 24/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let ReportedValue                = "REPORTED"
fileprivate let AttachingDocsValue           = "ATTACHING_DOCS"
fileprivate let InSolutionValue              = "IN_SOLUTION"
fileprivate let ClosedValue                  = "CLOSED"

//==============================================================================
public enum ContractEventState: Transformable
{
    /**
     * Reported contract event state.
     */
    case reported
    
    /**
     * Attaching docs contract event state.
     */
    case attachingDocs
    
    /**
     * In solution contract event state.
     */
    case inSolution
    
    /**
     * Closed contract event state.
     */
    case closed
    
    /**
     * Other contract event state.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .reported:
            return ReportedValue
        case .attachingDocs:
            return AttachingDocsValue
        case .inSolution:
            return InSolutionValue
        case .closed:
            return ClosedValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ContractEventState
    {
        switch string {
        case ReportedValue:
            return .reported
        case AttachingDocsValue:
            return .attachingDocs
        case InSolutionValue:
            return .inSolution
        case ClosedValue:
            return .closed
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ContractEventState, String>
    {
        return TransformOf<ContractEventState, String>(
            fromJSON: { (value: String?) -> ContractEventState? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ContractEventState?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
