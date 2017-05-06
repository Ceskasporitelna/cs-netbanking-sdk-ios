//
//  Parametres.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 08/05/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import CSCoreSDK



// MARK: - Parameters
//==============================================================================
public class ListParameters : Parameters, Paginated
{
    
    public var pagination : Pagination?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?)
    {
        self.pagination = pagination
        super.init()
    }
    
}


//MARK: - Other parameters ...


//==============================================================================
public class ExportTransactionsParameters: Parameters
{
    /**
     * Date from which transactions should be exported.
     */
    public internal(set) var dateFrom:                    Date!
    
    /**
     * Date to which transactions should be exported.
     */
    public internal(set) var dateTo:                      Date!
    
    /**
     * Array of fields which should appear in export. Possible fields are: bookingDate, partner, amount, currency, variableSymbol,
     * constantSymbol, specificSymbol, transactionType, note, paymentReference, senderReference, cardNumber, investmentInstrumentName, marked, valuationDate, referenceId location
     */
    public internal(set) var fields:                     [TransactionField]!
    
    /**
     * Indication whether account name should be visible in export. Default is false.
     */
    public internal(set) var showAccountName:            Bool?
    
    /**
     * Indication whether account number should be visible in export. Default is false.
     */
    public internal(set) var showAccountNumber:          Bool?
    
    /**
     * Indication whether timespan of the export should be visible. Default is false.
     */
    public internal(set) var showTimespan:               Bool?
    
    /**
     * Indication whether balance of the account should be visible in export. Default is false.
     */
    public internal(set) var showBalance:                Bool?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init();
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params                = super.toDictionary(existingParams)
        
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        if let date = self.dateFrom {
            params ["dateFrom"]       = dateFormatter.string(from: date) as AnyObject?
        }
        if let date = self.dateTo {
            params ["dateTo"]         = dateFormatter.string(from: date) as AnyObject?
        }
        
        var fieldNames            = String()
        for field in self.fields {
            if ( fieldNames.lengthOfBytes(using: String.Encoding.ascii) > 0 ) {
                fieldNames += ","
            }
            fieldNames += field.value
        }
        params ["fields"]          = fieldNames as AnyObject?
        
        if let flag = self.showAccountName {
            params ["showAccountName"] = ( (flag ? "true" : "false") as AnyObject )
        }
        
        if let flag = self.showAccountNumber {
            params ["showAccountNumber"] = ( (flag ? "true" : "false") as AnyObject )
        }
        
        if let flag = self.showTimespan {
            params ["showTimespan"] = ( (flag ? "true" : "false") as AnyObject )
        }
        
        if let flag = self.showBalance {
            params ["showBalance"] = ( (flag ? "true" : "false") as AnyObject )
        }
        
        return params
    }
}
