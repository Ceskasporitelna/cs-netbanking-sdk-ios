//
//  ProductSubType.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 16/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let CurrentAccount           = "CURRENT_ACCOUNT"
fileprivate let InvestmentCurrentAccount = "INVESTMENT_CURRENT_ACCOUNT"
fileprivate let GiroAccount              = "GIRO_ACCOUNT"
fileprivate let GiroAccountOld           = "GIRO_ACCOUNT_OLD"
fileprivate let ForeignAccount           = "FOREIGN_ACCOUNT"
fileprivate let InvestmentForeignAccount = "INVESTMENT_FOREIGN_ACCOUNT"
fileprivate let DepositAccount           = "DEPOSIT_ACCOUNT"
fileprivate let SavingAccount            = "SAVING_ACCOUNT"
fileprivate let SavingInternet           = "SAVING_INTERNET"
fileprivate let ChildrenPassbook         = "CHILDREN_PASSBOOK"
fileprivate let SavingCs                 = "SAVING_CS"
fileprivate let BenefitInvest            = "BENEFIT_INVEST"
fileprivate let LoanAccount              = "LOAN_ACCOUNT"
fileprivate let Mortage                  = "MORTGAGE"
fileprivate let RevolvingLoan            = "REVOLVING_LOAN"

//==============================================================================
public enum ProductSubType: Transformable
{
    /**
     * Current account product sub type.
     */
    case currentAccount
    
    /**
     * Investment current account product sub type.
     */
    case investmentCurrentAccount
    
    /**
     * Giro account product sub type.
     */
    case giroAccount
    
    /**
     * Giro account old product sub type.
     */
    case giroAccountOld
    
    /**
     * Foreign account product sub type.
     */
    case foreignAccount
    
    /**
     * Investment foreign account product sub type.
     */
    case investmentForeignAccount
    
    /**
     * Deposit account product sub type.
     */
    case depositAccount
    
    /**
     * Saving account product sub type.
     */
    case savingAccount
    
    /**
     * Saving internet product sub type.
     */
    case savingInternet
    
    /**
     * Children passbook product sub type.
     */
    case childrenPassbook
    
    /**
     * Saving cs product sub type.
     */
    case savingCs
    
    /**
     * Benefit invest product sub type.
     */
    case benefitInvest
    
    /**
     * Loan account product sub type.
     */
    case loanAccount
    
    /**
     * Mortgage product sub type.
     */
    case mortage
    
    /**
     * Revolving loan product sub type.
     */
    case revolvingLoan
    
    /**
     * Other product sub type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .currentAccount:
            return CurrentAccount
        case .investmentCurrentAccount:
            return InvestmentCurrentAccount
        case .giroAccount:
            return GiroAccount
        case .giroAccountOld:
            return GiroAccountOld
        case .foreignAccount:
            return ForeignAccount
        case .investmentForeignAccount:
            return InvestmentForeignAccount
        case .depositAccount:
            return DepositAccount
        case .savingAccount:
            return SavingAccount
        case .savingInternet:
            return SavingInternet
        case .childrenPassbook:
            return ChildrenPassbook
        case .savingCs:
            return SavingCs
        case .benefitInvest:
            return BenefitInvest
        case .loanAccount:
            return LoanAccount
        case .mortage:
            return Mortage
        case .revolvingLoan:
            return RevolvingLoan
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> ProductSubType
    {
        switch string {
        case CurrentAccount:
            return .currentAccount
        case InvestmentCurrentAccount:
            return .investmentCurrentAccount
        case GiroAccount:
            return .giroAccount
        case GiroAccountOld:
            return .giroAccountOld
        case ForeignAccount:
            return .foreignAccount
        case InvestmentForeignAccount:
            return .investmentForeignAccount
        case DepositAccount:
            return .depositAccount
        case SavingAccount:
            return .savingAccount
        case SavingInternet:
            return .savingInternet
        case ChildrenPassbook:
            return .childrenPassbook
        case SavingCs:
            return .savingCs
        case BenefitInvest:
            return .benefitInvest
        case LoanAccount:
            return .loanAccount
        case Mortage:
            return .mortage
        case RevolvingLoan:
            return .revolvingLoan
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<ProductSubType, String>
    {
        return TransformOf<ProductSubType, String>(
            fromJSON: { (value: String?) -> ProductSubType? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: ProductSubType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
