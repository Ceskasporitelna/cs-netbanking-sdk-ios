//
//  CategoryId.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 20/10/2016.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import CSCoreSDK

fileprivate let NonRegularIncomeValue        = "NON_REGULAR_INCOME"
fileprivate let UncategorizedIncomeValue     = "UNCATEGORIZED_INCOME"
fileprivate let TravelHolidaysValue          = "TRAVEL_HOLIDAYS"
fileprivate let HealthValue                  = "HEALTH"
fileprivate let LeisureValue                 = "LEISURE"
fileprivate let CommunicationValue           = "COMMUNICATION"
fileprivate let CarValue                     = "CAR"
fileprivate let FoodValue                    = "FOOD"
fileprivate let EducationValue               = "EDUCATION"
fileprivate let RegularIncomeValue           = "REGULAR_INCOME"
fileprivate let OnlineShoppingValue          = "ONLINE_SHOPPING"
fileprivate let OtherExpensesValue           = "OTHER_EXPENSES"
fileprivate let ClothingValue                = "CLOTHING"
fileprivate let UncategorizedExpenseValue    = "UNCATEGORIZED_EXPENSE"
fileprivate let FeesValue                    = "FEES"
fileprivate let SavingsInvestmentValue       = "SAVINGS_INVESTMENT"
fileprivate let TransportValue               = "TRANSPORT"
fileprivate let AlimonyPoctetMoneyValue      = "ALIMONY_POCKET_MONEY"
fileprivate let TaxesValue                   = "TAXES"
fileprivate let WithdrawalValue              = "WITHDRAWAL"
fileprivate let LivingAndEnergyValue         = "LIVING_AND_ENERGY"


//==============================================================================
public enum CategoryId: Transformable
{
    /**
     * Non regular income category id.
     */
    case nonRegularIncome
    
    /**
     * Uncategorized income category id.
     */
    case uncategorizedIncome
    
    /**
     * Travel holidays category id.
     */
    case travelHolidays
    
    /**
     * Health category id.
     */
    case health
    
    /**
     * Leisure category id.
     */
    case leisure
    
    /**
     * Communication category id.
     */
    case communication
    
    /**
     * Car category id.
     */
    case car
    
    /**
     * Food category id.
     */
    case food
    
    /**
     * Education category id.
     */
    case education
    
    /**
     * Regular income category id.
     */
    case regularIncome
    
    /**
     * Online shopping category id.
     */
    case onlineShopping
    
    /**
     * Other expenses category id.
     */
    case otherExpenses
    
    /**
     * Clothing category id.
     */
    case clothing
    
    /**
     * Uncategorized expense category id.
     */
    case uncategorizedExpense
    
    /**
     * Fees category id.
     */
    case fees
    
    /**
     * Savings investment category id.
     */
    case savingsInvestments
    
    /**
     * Transport category id.
     */
    case transport
    
    /**
     * Alimony pocket money category id.
     */
    case alimonyPocketMoney
    
    /**
     * Taxes category id.
     */
    case taxes
    
    /**
     * Withdrawal category id.
     */
    case withdrawal
    
    /**
     * Living and energy category id.
     */
    case livingAndEnergy
    
    /**
     * Other category id.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .nonRegularIncome:
            return NonRegularIncomeValue
        case .uncategorizedIncome:
            return UncategorizedIncomeValue
        case .travelHolidays:
            return TravelHolidaysValue
        case .health:
            return HealthValue
        case .leisure:
            return LeisureValue
        case .communication:
            return CommunicationValue
        case .car:
            return CarValue
        case .food:
            return FoodValue
        case .education:
            return EducationValue
        case .regularIncome:
            return RegularIncomeValue
        case .onlineShopping:
            return OnlineShoppingValue
        case .otherExpenses:
            return OtherExpensesValue
        case .clothing:
            return ClothingValue
        case .uncategorizedExpense:
            return UncategorizedExpenseValue
        case .fees:
            return FeesValue
        case .savingsInvestments:
            return SavingsInvestmentValue
        case .transport:
            return TransportValue
        case .alimonyPocketMoney:
            return AlimonyPoctetMoneyValue
        case .taxes:
            return TaxesValue
        case .withdrawal:
            return WithdrawalValue
        case .livingAndEnergy:
            return LivingAndEnergyValue
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> CategoryId
    {
        switch string {
        case NonRegularIncomeValue:
            return .nonRegularIncome
        case UncategorizedIncomeValue:
            return .uncategorizedIncome
        case TravelHolidaysValue:
            return .travelHolidays
        case HealthValue:
            return .health
        case LeisureValue:
            return .leisure
        case CommunicationValue:
            return .communication
        case CarValue:
            return .car
        case FoodValue:
            return .food
        case EducationValue:
            return .education
        case RegularIncomeValue:
            return .regularIncome
        case OnlineShoppingValue:
            return .onlineShopping
        case OtherExpensesValue:
            return .otherExpenses
        case ClothingValue:
            return .clothing
        case UncategorizedExpenseValue:
            return .uncategorizedExpense
        case FeesValue:
            return .fees
        case SavingsInvestmentValue:
            return .savingsInvestments
        case TransportValue:
            return .transport
        case AlimonyPoctetMoneyValue:
            return .alimonyPocketMoney
        case TaxesValue:
            return .taxes
        case WithdrawalValue:
            return .withdrawal
        case LivingAndEnergyValue:
            return .livingAndEnergy
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<CategoryId, String>
    {
        return TransformOf<CategoryId, String>(
            fromJSON: { (value: String?) -> CategoryId? in
                if let value = value {
                    return enumerate(string: value)
                }
                return nil
            },
            toJSON: { (value: CategoryId?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}
