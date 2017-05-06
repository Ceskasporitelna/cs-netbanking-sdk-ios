//
//  TransactionField.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let BookingDateValue              = "bookingDate"
fileprivate let PartnerValue                  = "partner"
fileprivate let AmountValue                   = "amount"
fileprivate let CurrencyValue                 = "currency"
fileprivate let VariableSymbolValue           = "variableSymbol"
fileprivate let ConstantSymbolValue           = "constantSymbol"
fileprivate let SpecificSymbolValue           = "specificSymbol"
fileprivate let TransactionTypeValue          = "transactionType"
fileprivate let NoteValue                     = "note"
fileprivate let PaymentReferenceValue         = "paymentReference"
fileprivate let SenderReferenceValue          = "senderReference"
fileprivate let CardNumberValue               = "cardNumber"
fileprivate let InvestmentInstrumentNameValue = "investmentInstrumentName"
fileprivate let MarkedValue                   = "marked"
fileprivate let ValidationDateValue           = "valuationDate"
fileprivate let ReferenceIdValue              = "referenceId"
fileprivate let TransactionLocationValue      = "location"

//==============================================================================
public enum TransactionField: Transformable
{
    /**
     * Booking date transaction field.
     */
    case bookingDate
    
    /**
     * Partner transaction field.
     */
    case partner
    
    /**
     * Amount transaction field.
     */
    case amount
    
    /**
     * Currency transaction field.
     */
    case currency
    
    /**
     * Variable symbol transaction field.
     */
    case variableSymbol
    
    /**
     * Constant symbol transaction field.
     */
    case constantSymbol
    
    /**
     * Specific symbol transaction field.
     */
    case specificSymbol
    
    /**
     * Transaction type transaction field.
     */
    case transactionType
    
    /**
     * Note transaction field.
     */
    case note
    
    /**
     * Payment reference transaction field.
     */
    case paymentReference
    
    /**
     * Sender reference transaction field.
     */
    case senderReference
    
    /**
     * Card number transaction field.
     */
    case cardNumber
    
    /**
     * Investment instrument name transaction field.
     */
    case investmentInstrumentName
    
    /**
     * Marked transaction field.
     */
    case marked
    
    /**
     * Valuation date transaction field.
     */
    case validationDate
    
    /**
     * Reference id transaction field.
     */
    case referenceId
    
    /**
     * Location transaction field.
     */
    case transactionLocation
    
    /**
     * Other field.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .bookingDate:
            return BookingDateValue
        case .partner:
            return PartnerValue
        case .amount:
            return AmountValue
        case .currency:
            return CurrencyValue
        case .variableSymbol:
            return VariableSymbolValue
        case .constantSymbol:
            return ConstantSymbolValue
        case .specificSymbol:
            return SpecificSymbolValue
        case .transactionType:
            return TransactionTypeValue
        case .note:
            return NoteValue
        case .paymentReference:
            return PaymentReferenceValue
        case .senderReference:
            return SenderReferenceValue
        case .cardNumber:
            return CardNumberValue
        case .investmentInstrumentName:
            return InvestmentInstrumentNameValue
        case .marked:
            return MarkedValue
        case .validationDate:
            return ValidationDateValue
        case .referenceId:
            return ReferenceIdValue
        case .transactionLocation:
            return TransactionLocationValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> TransactionField
    {
        switch string {
        case BookingDateValue:
            return .bookingDate
        case PartnerValue:
            return .partner
        case AmountValue:
            return .amount
        case CurrencyValue:
            return .currency
        case VariableSymbolValue:
            return .variableSymbol
        case ConstantSymbolValue:
            return .constantSymbol
        case SpecificSymbolValue:
            return .specificSymbol
        case TransactionTypeValue:
            return .transactionType
        case NoteValue:
            return .note
        case PaymentReferenceValue:
            return .paymentReference
        case SenderReferenceValue:
            return .senderReference
        case CardNumberValue:
            return .cardNumber
        case InvestmentInstrumentNameValue:
            return .investmentInstrumentName
        case MarkedValue:
            return .marked
        case ValidationDateValue:
            return .validationDate
        case ReferenceIdValue:
            return .referenceId
        case TransactionLocationValue:
            return .transactionLocation
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<TransactionField, String>
    {
        return TransformOf<TransactionField, String>(
            fromJSON: { (value: String?) -> TransactionField? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: TransactionField?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
