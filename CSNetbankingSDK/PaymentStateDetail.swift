//
//  PaymentStateDetail.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 26/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

/**
 * The enum State detail.
 * Possible stateDetail values used to display relevant status info in FE are defined in following
 * table (local API spec should define mapping to BE technical statuses):
 * stateDetail	Meaning	                                        StateOk
 * OPN	        Open - not signed yet	                        true
 * STO	        Cancelled - storno	                            false
 * NGD	        Insufficient funds - no disposable balance	    false
 * TRM	        Marked as scheduled payment	                    true
 * FUS	        Unknown - finalized unknown	                    false
 * PNR	        Payment Payment from night register	            true
 * FIN	        Forwarded - finalized neutral                   true
 * FIH	        Forwarded - finalized today (current bankday)	true
 * ABG	        Rejected - rejected, ask advisor	            true
 * INB	        Being processed - in process	                true
 * <p/>
 * API Mapping of stateDetail values to state values is in following table (local API spec could
 * define mapping to BE technical status):
 * stateDetail	Meaning
 * OPEN	        Payment state in an OpenState (OPN)
 * SPOOLED	    Payment state in a SpoolState (NGD, TRM, PNR, INB)
 * CANCELLED	Payment state in a CancelState (STO)
 * CLOSED	    Payment state in a ClosedState (FIH, FIN, ABG)
 * DELETED	    Payment state in a DeleteState (order with deleted flag from BE)
 *
 */

fileprivate let OpnValue            = "OPN"
fileprivate let StoValue            = "STO"
fileprivate let NgdValue            = "NGD"
fileprivate let TrmValue            = "TRM"
fileprivate let FusValue            = "FUS"
fileprivate let PnrValue            = "PNR"
fileprivate let FinValue            = "FIN"
fileprivate let FihValue            = "FIH"
fileprivate let AbgValue            = "ABG"
fileprivate let InbValue            = "INB"

//==============================================================================
public enum PaymentStateDetail: Transformable
{
    /**
     * Opn state detail.
     */
    case opn
    
    /**
     * Sto state detail.
     */
    case sto
    
    /**
     * Ngd state detail.
     */
    case ngd
    
    /**
     * Trm state detail.
     */
    case trm
    
    /**
     * Fus state detail.
     */
    case fus
    
    /**
     * Pnr state detail.
     */
    case pnr
    
    /**
     * Fin state detail.
     */
    case fin
    
    /**
     * Fih state detail.
     */
    case fih
    
    /**
     * Abg state detail.
     */
    case abg
    
    /**
     * Inb state detail.
     */
    case inb
    
    /**
     * Other state detail.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .opn:
            return OpnValue
        case .sto:
            return StoValue
        case .ngd:
            return NgdValue
        case .trm:
            return TrmValue
        case .fus:
            return FusValue
        case .pnr:
            return PnrValue
        case .fin:
            return FinValue
        case .fih:
            return FihValue
        case .abg:
            return AbgValue
        case .inb:
            return InbValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> PaymentStateDetail
    {
        switch string {
        case OpnValue:
            return .opn
        case StoValue:
            return .sto
        case NgdValue:
            return .ngd
        case TrmValue:
            return .trm
        case FusValue:
            return .fus
        case PnrValue:
            return .pnr
        case FinValue:
            return .fin
        case FihValue:
            return .fih
        case AbgValue:
            return .abg
        case InbValue:
            return .inb
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<PaymentStateDetail, String>
    {
        return TransformOf<PaymentStateDetail, String>(
            fromJSON: { (value: String?) -> PaymentStateDetail? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: PaymentStateDetail?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
