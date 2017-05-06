//
//  CSNetbankingAccountTests.swift
//  CSNetbankingAccountTests
//
//  Created by Marty on 07/03/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//
import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingAccountTests: CSNetbankingTest
{
    
    //--------------------------------------------------------------------------
    func testAccountsList()
    {
        self.judgeSession.setNextCase( caseId: "accounts.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = AccountsParameters(pagination: nil, sort: Sort( by:[(.iban, .ascending),(.balance, .descending)]))
        
        var accountsList : PaginatedListResponse<MainAccountResponse>? = nil
        self.client.mainAccount.list(params) { result in
            switch ( result ) {
            case .success( let accounts ):
                accountsList = accounts
                XCTAssertTrue(accountsList?.items.count == 1, "Accounts list items count must be 1.")
                
                let account = accountsList?.items [0]
                
                XCTAssertEqual(account?.id, "076E1DBCCCD38729A99D93AC8D3E8273237C7E36")
                XCTAssertEqual(account?.product, "49")
                XCTAssertEqual(account?.productI18N, "Osobní účet ČS II")
                XCTAssertEqual(account?.type.value, "CURRENT")
                XCTAssertEqual(account?.subType.value, "GIRO_ACCOUNT")
                XCTAssertEqual(account?.description, "Anna Vojtíšková")
                
                let accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2328489013")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ5908000000002328489013")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                let balance = account?.balance
                XCTAssertEqual(balance?.value, 2650706)
                XCTAssertEqual(balance?.precision, 2)
                XCTAssertEqual(balance?.currency, "CZK")
                
                let disposable = account?.disposable
                XCTAssertEqual(disposable?.value, 2650706)
                XCTAssertEqual(disposable?.precision, 2)
                XCTAssertEqual(disposable?.currency, "CZK")
                
                let flags = account?.flags
                XCTAssertTrue(flags?.count == 8, "Flags count must be 8.")
                XCTAssertEqual(flags?[0], "owner")
                XCTAssertEqual(flags?[1], "electronicStatementAllowed")
                XCTAssertEqual(flags?[2], "accountQueryAllowed")
                XCTAssertEqual(flags?[3], "directDebitAllowed")
                XCTAssertEqual(flags?[4], "sipoDirectDebitAllowed")
                XCTAssertEqual(flags?[5], "ownTransferAllowed")
                XCTAssertEqual(flags?[6], "domesticTransferAllowed")
                XCTAssertEqual(flags?[7], "urgentTransferAllowed")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "accounts.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = AccountsParameters(pagination: Pagination(pageNumber: 0, pageSize: 1), sort: nil)
        
        var accountsList : PaginatedListResponse<MainAccountResponse>? = nil
        self.client.accounts.list(params) { result in
            switch ( result ) {
            case .success( let accounts ):
                accountsList = accounts
                let paginationTest = self.checkPagination(pagination: accountsList!.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                XCTAssertTrue(accountsList?.items.count == 1, "Accounts list items count must be 1.")
                
                let account = accountsList?.items [0]
                XCTAssertEqual(account?.id, "4B2F9EBE742BCAE1E98A78E12F6FBC62464A74EE")
                XCTAssertEqual(account?.product, "50")
                XCTAssertEqual(account?.productI18N, "Osobní konto ČS")
                XCTAssertEqual(account?.type.value, "CURRENT")
                XCTAssertEqual(account?.subType.value, "GIRO_ACCOUNT")
                XCTAssertEqual(account?.description, "Aleš Vrba")
                
                let accountNo = account?.accountNo
                XCTAssertEqual(accountNo?.number, "2059930033")
                XCTAssertEqual(accountNo?.bankCode, "0800")
                XCTAssertEqual(accountNo?.countryCode, "CZ")
                XCTAssertEqual(accountNo?.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
                
                let balance = account?.balance
                XCTAssertEqual(balance?.value, 1243017)
                XCTAssertEqual(balance?.precision, 2)
                XCTAssertEqual(balance?.currency, "CZK")
                
                let disposable = account?.disposable
                XCTAssertEqual(disposable?.value, 1243017)
                XCTAssertEqual(disposable?.precision, 2)
                XCTAssertEqual(disposable?.currency, "CZK")
                
                let flags = account?.flags
                XCTAssertTrue(flags?.count == 8, "Flags count must be 8.")
                XCTAssertEqual(flags?[0], "owner")
                XCTAssertEqual(flags?[1], "electronicStatementAllowed")
                XCTAssertEqual(flags?[2], "accountQueryAllowed")
                XCTAssertEqual(flags?[3], "directDebitAllowed")
                XCTAssertEqual(flags?[4], "sipoDirectDebitAllowed")
                XCTAssertEqual(flags?[5], "ownTransferAllowed")
                XCTAssertEqual(flags?[6], "domesticTransferAllowed")
                XCTAssertEqual(flags?[7], "urgentTransferAllowed")
                
                let subaccounts = account?.subAccounts
                XCTAssertTrue(subaccounts?.count == 1, "Subaccounts items count must be 1.")
                
                let subaccount = subaccounts? [0]
                XCTAssertEqual(subaccount?.id, "932933BABDE2A94753BAFF7FF146BA69BA90C259")
                XCTAssertEqual(subaccount?.product, "53")
                XCTAssertEqual(subaccount?.productI18N, "Spořicí účet k Osobnímu kontu")
                XCTAssertEqual(subaccount?.type.value, "SAVING")
                XCTAssertEqual(subaccount?.subType.value, "SAVING_ACCOUNT")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "accounts.list.page1", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = AccountsParameters(pagination: Pagination(pageNumber: 1, pageSize: 1), sort: nil)
        
        var accountsList : PaginatedListResponse<MainAccountResponse>? = nil
        self.client.accounts.list(params) { result in
            switch ( result ) {
            case .success( let accounts ):
                accountsList = accounts
                let paginationTest = self.checkPagination(pagination: accountsList!.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(accountsList?.items.count == 1, "Accounts list items count must be 1.")
                
                let account = accountsList?.items [0]
                XCTAssertEqual(account?.id, "EC1C13B722F726D783365D0A89D23E805098B167")
                XCTAssertEqual(account?.product, "15")
                XCTAssertEqual(account?.productI18N, "Hypotéka České spořitelny")
                XCTAssertEqual(account?.type.value, "LOAN")
                XCTAssertEqual(account?.subType.value, "MORTGAGE")
                XCTAssertEqual(account?.description, "Aleš Vrba")
                
                let loan       = account?.loan
                let loanAmount = loan?.loanAmount
                XCTAssertEqual(loanAmount?.value, 90200000)
                XCTAssertEqual(loanAmount?.precision, 2)
                XCTAssertEqual(loanAmount?.currency, "CZK")
                XCTAssertEqual( self.dateFormatter.date(from:  "2037-12-31" ), loan?.maturityDate )
                
                let remainingLoanAmout = loan?.remainingLoanAmount
                XCTAssertEqual(remainingLoanAmout?.value, 0)
                XCTAssertEqual(remainingLoanAmout?.precision, 2)
                XCTAssertEqual(remainingLoanAmout?.currency, "CZK")
                
                XCTAssertEqual( self.dateFormatter.date(from:  "2012-12-31" ), loan?.drawDownToDate )
                
                let drawDownAmount = loan?.drawDownAmount
                XCTAssertEqual(drawDownAmount?.value, 83492030)
                XCTAssertEqual(drawDownAmount?.precision, 2)
                XCTAssertEqual(drawDownAmount?.currency, "CZK")
                
                let outstandingDebt = loan?.outstandingDebt
                XCTAssertEqual(outstandingDebt?.value, 83492030)
                XCTAssertEqual(outstandingDebt?.precision, 2)
                XCTAssertEqual(outstandingDebt?.currency, "CZK")
                
                XCTAssertEqual(loan?.installmentFrequency?.value, "MONTHLY")
                XCTAssertEqual(loan?.installmentDay, 31)
                XCTAssertEqual( self.dateFormatter.date(from:  "2016-03-31" ), loan?.nextRateDate )
                
                let nextRateAmount = loan?.nextRateAmount
                XCTAssertEqual(nextRateAmount?.value, 429300)
                XCTAssertEqual(nextRateAmount?.precision, 2)
                XCTAssertEqual(nextRateAmount?.currency, "CZK")
                
                let czLumpsumRepayment = loan?.czLumpsumRepayment
                XCTAssertEqual(czLumpsumRepayment?.value, 84407467)
                XCTAssertEqual(czLumpsumRepayment?.precision, 2)
                XCTAssertEqual(czLumpsumRepayment?.currency, "CZK")
                
                XCTAssertEqual(account?.debitInterestRate, 2.99)
                
                let flags = account?.flags
                XCTAssertTrue(flags?.count == 4, "Flags count must be 4.")
                XCTAssertEqual(flags?[0], "owner")
                XCTAssertEqual(flags?[1], "electronicStatementAllowed")
                XCTAssertEqual(flags?[2], "accountQueryAllowed")
                XCTAssertEqual(flags?[3], "standingOrderNotAllowed")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").get { result in
            switch ( result ) {
            case .success( let account ):
               XCTAssertEqual(account.id, "076E1DBCCCD38729A99D93AC8D3E8273237C7E36")
               
               let accountNo = account.accountNo
               XCTAssertEqual(accountNo?.number, "2328489013")
               XCTAssertEqual(accountNo?.bankCode, "0800")
               XCTAssertEqual(accountNo?.countryCode, "CZ")
               XCTAssertEqual(accountNo?.czIBAN, "CZ5908000000002328489013")
               XCTAssertEqual(accountNo?.czBIC, "GIBACZPX")
               
               let balance = account.balance
               XCTAssertEqual(balance?.value, 2650706)
               XCTAssertEqual(balance?.precision, 2)
               XCTAssertEqual(balance?.currency, "CZK")
               
               XCTAssertEqual(account.product, "49")
               XCTAssertEqual(account.productI18N, "Osobní účet ČS II")
               XCTAssertEqual(account.type.value, "CURRENT")
               XCTAssertEqual(account.subType.value, "GIRO_ACCOUNT")
               
               let disposable = account.disposable
               XCTAssertEqual(disposable!.value, 2650706)
               XCTAssertEqual(disposable!.precision, 2)
               XCTAssertEqual(disposable!.currency, "CZK")
               
               let flags = account.flags
               XCTAssertTrue(flags?.count == 8, "Flags count must be 8.")
               XCTAssertEqual(flags?[0], "owner")
               XCTAssertEqual(flags?[1], "electronicStatementAllowed")
               XCTAssertEqual(flags?[2], "accountQueryAllowed")
               XCTAssertEqual(flags?[3], "directDebitAllowed")
               XCTAssertEqual(flags?[4], "sipoDirectDebitAllowed")
               XCTAssertEqual(flags?[5], "ownTransferAllowed")
               XCTAssertEqual(flags?[6], "domesticTransferAllowed")
               XCTAssertEqual(flags?[7], "urgentTransferAllowed")
               
               XCTAssertEqual(account.description, "Anna Vojtíšková")
               
               expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.update", xcTestCase: self)
        
        let expectation                    = self.expectation(description: "Response expectation")
        let accountRequest                 = ChangeAccountSettingsRequest()
        accountRequest.alias               = "muj ucet"
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").update(accountRequest) { result in
            switch ( result ) {
            case .success( let accountResponse ):
                XCTAssertEqual(accountResponse.id, "076E1DBCCCD38729A99D93AC8D3E8273237C7E36")
                
                XCTAssertEqual(accountResponse.accountNo.number, "2059930033")
                XCTAssertEqual(accountResponse.accountNo.bankCode, "0800")
                XCTAssertEqual(accountResponse.accountNo.countryCode, "CZ")
                XCTAssertEqual(accountResponse.accountNo.czIBAN, "CZ1208000000002059930033")
                XCTAssertEqual(accountResponse.accountNo.czBIC, "GIBACZPX")
                
                XCTAssertEqual(accountResponse.balance.value, 1208017)
                XCTAssertEqual(accountResponse.balance.precision, 2)
                XCTAssertEqual(accountResponse.balance.currency, "CZK")
                
                XCTAssertEqual(accountResponse.product, "50")
                XCTAssertEqual(accountResponse.productI18N, "Osobní konto ČS")
                XCTAssertEqual(accountResponse.type.value, "CURRENT")
                XCTAssertEqual(accountResponse.subType.value, "GIRO_ACCOUNT")
                
                XCTAssertEqual(accountResponse.disposable!.value, 1208017)
                XCTAssertEqual(accountResponse.disposable!.precision, 2)
                XCTAssertEqual(accountResponse.disposable!.currency, "CZK")
                
                XCTAssertTrue(accountResponse.subAccounts!.count == 1, "Subaccounts count must be 1.")
                XCTAssertEqual(accountResponse.subAccounts! [0].id, "932933BABDE2A94753BAFF7FF146BA69BA90C259")
                XCTAssertEqual(accountResponse.subAccounts! [0].accountNo.number, "3668601379")
                XCTAssertEqual(accountResponse.subAccounts! [0].accountNo.bankCode, "0800")
                XCTAssertEqual(accountResponse.subAccounts! [0].accountNo.countryCode, "CZ")
                XCTAssertEqual(accountResponse.subAccounts! [0].accountNo.czIBAN, "CZ7308000000003668601379")
                XCTAssertEqual(accountResponse.subAccounts! [0].accountNo.czBIC, "GIBACZPX")
                
                XCTAssertEqual(accountResponse.subAccounts! [0].balance.value, 1607876)
                XCTAssertEqual(accountResponse.subAccounts! [0].balance.precision, 2)
                XCTAssertEqual(accountResponse.subAccounts! [0].balance.currency, "CZK")
                
                XCTAssertEqual(accountResponse.subAccounts! [0].product, "53")
                XCTAssertEqual(accountResponse.subAccounts! [0].productI18N, "Spořicí účet k Osobnímu kontu")
                XCTAssertEqual(accountResponse.subAccounts! [0].type.value, "SAVING")
                XCTAssertEqual(accountResponse.subAccounts! [0].subType.value, "SAVING_ACCOUNT")
                XCTAssertEqual(accountResponse.subAccounts! [0].creditInterestRate, 0.4)
                XCTAssertEqual(accountResponse.subAccounts! [0].czInterestRateOverLimit, 0.01)
                
                XCTAssertEqual(accountResponse.subAccounts! [0].czInterestRateLimit!.value, 15000000)
                XCTAssertEqual(accountResponse.subAccounts! [0].czInterestRateLimit!.precision, 2)
                XCTAssertEqual(accountResponse.subAccounts! [0].czInterestRateLimit!.currency, "CZK")
                
                XCTAssertTrue(accountResponse.flags!.count == 8, "Flags count must be 8.")
                XCTAssertEqual(accountResponse.flags! [0], "owner")
                XCTAssertEqual(accountResponse.flags! [1], "electronicStatementAllowed")
                XCTAssertEqual(accountResponse.flags! [2], "accountQueryAllowed")
                XCTAssertEqual(accountResponse.flags! [3], "directDebitAllowed")
                XCTAssertEqual(accountResponse.flags! [4], "sipoDirectDebitAllowed")
                XCTAssertEqual(accountResponse.flags! [5], "ownTransferAllowed")
                XCTAssertEqual(accountResponse.flags! [6], "domesticTransferAllowed")
                XCTAssertEqual(accountResponse.flags! [7], "urgentTransferAllowed")
                
                XCTAssertEqual(accountResponse.description, "Aleš Vrba")
                XCTAssertEqual(accountResponse.alias, "muj ucet")
                
                XCTAssertEqual(accountResponse.signInfo.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
            
        }
        
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdBalancesGet()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.balances.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").balance.get { result in
            switch ( result ) {
            case .success( let balance ):
                XCTAssertEqual(balance.balance.value, 2650706)
                XCTAssertEqual(balance.balance.precision, 2)
                XCTAssertEqual(balance.balance.currency, "CZK")
                
                XCTAssertEqual(balance.disposable!.value, 2650706)
                XCTAssertEqual(balance.disposable!.precision, 2)
                XCTAssertEqual(balance.disposable!.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
                
            }
        }
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdServicesList()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.services.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 2))
        var servicesList : PaginatedListResponse<ServiceResponse>? = nil
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").services.list(params) { result in
            switch ( result ) {
            case .success( let services ):
                servicesList = services;
                XCTAssertTrue(servicesList?.items.count == 2, "Services count must be 2.")
                
                var service = servicesList?.items [0]
                XCTAssertEqual(service!.id, "E878D16AD1A79FB60A520F48706C187AEFCA9D5D")
                XCTAssertEqual(service!.nameI18N, "2x výběr z bankomatů České spořitelny")
                XCTAssertEqual(service!.iconGroup, "CARDS")
                
                service = servicesList?.items [1]
                XCTAssertEqual(service!.id, "3FB37388FC58076DEAD3DE282E075592A299B596")
                XCTAssertEqual(service!.nameI18N, "Platební karta")
                XCTAssertEqual(service!.iconGroup, "CARDS")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdServicesListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.services.list.page0", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        var servicesList : PaginatedListResponse<ServiceResponse>? = nil
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").services.list(params) { result in
            switch ( result ) {
            case .success( let services ):
                servicesList       = services;
                let paginationTest = self.checkPagination(pagination: servicesList!.pagination, pageNumber: 0, pageCount: 4, pageSize: 2, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(servicesList?.items.count == 2, "Services count must be 2.")
                
                var service = servicesList?.items [0]
                XCTAssertEqual(service!.id, "E878D16AD1A79FB60A520F48706C187AEFCA9D5D")
                XCTAssertEqual(service!.nameI18N, "2x výběr z bankomatů České spořitelny")
                XCTAssertEqual(service!.iconGroup, "CARDS")
                
                service = servicesList?.items [1]
                XCTAssertEqual(service!.id, "3FB37388FC58076DEAD3DE282E075592A299B596")
                XCTAssertEqual(service!.nameI18N, "Platební karta")
                XCTAssertEqual(service!.iconGroup, "CARDS")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdServicesListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.services.list.page1", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        var servicesList : PaginatedListResponse<ServiceResponse>? = nil
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").services.list(params) { result in
            switch ( result ) {
            case .success( let services ):
                servicesList       = services
                let paginationTest = self.checkPagination(pagination: servicesList!.pagination, pageNumber: 1, pageCount: 4, pageSize: 2, nextPageNumber: 2)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(servicesList?.items.count == 2, "Services count must be 2.")
                
                var service = servicesList?.items [0]
                XCTAssertEqual(service!.id, "5F66602F35A7D5A86066BC03A6882180BEF01CA3")
                XCTAssertEqual(service!.nameI18N, "Všechny platby v Kč")
                XCTAssertEqual(service!.iconGroup, "PAYMENTS")
                
                service = servicesList?.items [1]
                XCTAssertEqual(service!.id, "A705433CFCD205249F4B816F2C63D309AEEFF4C9")
                XCTAssertEqual(service!.nameI18N, "Platební karta")
                XCTAssertEqual(service!.iconGroup, "CARDS")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdTransactionsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.transactions.withId.update", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let transactionsRequest   = AddNoteAndMarkTransactionRequest()
        transactionsRequest.note  = "note"
        transactionsRequest.flags = ["hasStar"]
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").transactions.withId("39876").update(transactionsRequest) { result in
            switch ( result ) {
            case .success( let transactionResponse ):
                XCTAssertEqual(transactionResponse.transaction.id, "39876")
                XCTAssertEqual(transactionResponse.transaction.note, "note")
                
                XCTAssertTrue(transactionResponse.transaction.flags?.count == 2 , "Transaction flags count must be 2.")
                XCTAssertEqual(transactionResponse.transaction.flags! [0], "hasNote")
                XCTAssertEqual(transactionResponse.transaction.flags! [1], "hasStar")
                
                XCTAssertEqual(transactionResponse.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    
    //--------------------------------------------------------------------------
    func testAccountsWithIdTransactionsExport()
    {
        let caseId                   = "accounts.withId.transactions.export"
        self.judgeSession.setNextCase( caseId: caseId, xcTestCase: self)
        
        let expectation              = self.expectation(description: "Response expectation")
        
        let parametres               = ExportTransactionsParameters()
        
        parametres.dateFrom          = self.dateTimeFormatter.date(from: "1999-09-27T00:00:00+02:00")
        parametres.dateTo            = self.dateTimeFormatter.date(from: "2000-09-27T00:00:00+02:00")
        parametres.fields            = [.bookingDate, .partner, .amount, .currency]
        parametres.showAccountName   = true
        parametres.showAccountNumber = true
        parametres.showTimespan      = true
        parametres.showBalance       = true
        
        var verifyResult             = false
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").transactions.export(parametres) { result in
            switch ( result ) {
            case .success( let pdfFileName ):
                XCTAssertTrue( self.isValidPdfDocumentAtFilePath(pdfFileName: pdfFileName))
                expectation.fulfill()
                
            case .failure:
                verifyResult = true
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        if verifyResult {
            self.judgeSession.verifyLastTestCase(caseId: caseId, xcTestCase: self) { error in
                if let coreError = error as? CoreSDKError, let info = coreError.serverErrorInfo {
                    XCTAssertTrue( false, "Error: \(info)" )
                }
                else {
                    XCTAssertTrue( false, "Error: \(error)" );
                }
            }
        }
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdReservationsList()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.reservations.list", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        
        var reservationsList : PaginatedListResponse<ReservationResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").reservations.list() { result in
            switch ( result ) {
            case .success( let list ):
                reservationsList = list
                XCTAssertTrue(reservationsList?.items.count == 1 , "Reservations list count must be 1.")
                
                XCTAssertEqual(reservationsList!.items[0].status.value, "RESERVED")
                XCTAssertEqual( self.dateTimeFormatter.date(from:  "2015-09-18T21:43:53Z" ), reservationsList!.items[0].creationDate )
                XCTAssertEqual( self.dateTimeFormatter.date(from:  "2015-09-25T21:43:53Z" ), reservationsList!.items[0].expirationDate )
                XCTAssertEqual(reservationsList!.items[0].merchantName, "Pizzeria Grosseto")
                XCTAssertEqual(reservationsList!.items[0].czMerchantAddress, "Antala Staška 32, Praha")
                XCTAssertEqual(reservationsList!.items[0].description, "Platba kartou")
                XCTAssertEqual(reservationsList!.items[0].amount.value, 45270)
                XCTAssertEqual(reservationsList!.items[0].amount.precision, 2)
                XCTAssertEqual(reservationsList!.items[0].amount.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdReservationsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.reservations.list.page0", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        var reservationsList : PaginatedListResponse<ReservationResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").reservations.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                reservationsList   = list
                let paginationTest = self.checkPagination(pagination: reservationsList!.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                XCTAssertTrue(reservationsList?.items.count == 1 , "Reservations list count must be 1.")
                
                XCTAssertEqual(reservationsList!.items[0].status.value, "RESERVED")
                XCTAssertEqual( self.dateTimeFormatter.date(from:  "2015-09-18T21:43:53Z" ), reservationsList!.items[0].creationDate )
                XCTAssertEqual( self.dateTimeFormatter.date(from:  "2015-09-25T21:43:53Z" ), reservationsList!.items[0].expirationDate )
                XCTAssertEqual(reservationsList!.items[0].merchantName, "Pizzeria Grosseto")
                XCTAssertEqual(reservationsList!.items[0].czMerchantAddress, "Antala Staška 32, Praha")
                XCTAssertEqual(reservationsList!.items[0].description, "Platba kartou")
                XCTAssertEqual(reservationsList!.items[0].amount.value, 45270)
                XCTAssertEqual(reservationsList!.items[0].amount.precision, 2)
                XCTAssertEqual(reservationsList!.items[0].amount.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdReservationsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.reservations.list.page1", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        var reservationsList : PaginatedListResponse<ReservationResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").reservations.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                reservationsList   = list
                let paginationTest = self.checkPagination(pagination: reservationsList!.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                
                XCTAssertTrue(reservationsList?.items.count == 1 , "Reservations list count must be 1.")
                
                XCTAssertEqual(reservationsList!.items[0].status.value, "RESERVED")
                XCTAssertEqual( self.dateTimeFormatter.date(from:  "2015-09-18T21:54:58Z" ), reservationsList!.items[0].creationDate )
                XCTAssertEqual( self.dateTimeFormatter.date(from:  "2015-09-25T21:54:58Z" ), reservationsList!.items[0].expirationDate )
                XCTAssertEqual(reservationsList!.items[0].merchantName, "AAA Taxi")
                XCTAssertEqual(reservationsList!.items[0].description, "Platba kartou")
                XCTAssertEqual(reservationsList!.items[0].amount.value, 12750)
                XCTAssertEqual(reservationsList!.items[0].amount.precision, 2)
                XCTAssertEqual(reservationsList!.items[0].amount.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdTransfersUpdate()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.transfers.update", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        
        let transferRequest               = AccountTransferRequest()
        transferRequest.type              = .revolvingLoanDisbursement
        transferRequest.amount            = Amount()
        transferRequest.amount?.value     = 1000
        transferRequest.amount?.precision = 2
        transferRequest.amount?.currency  = "CZK"
        transferRequest.transferDate      = self.dateFormatter.date(from: "2015-02-28")
        transferRequest.recipientNote     = "moje prve cerpanie z penize na klik"
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").transfer.update(transferRequest) { result in
            switch ( result ) {
            case .success( let transferResponse ):
                XCTAssertEqual(transferResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(transferResponse.signInfo?.signId, "151112531008724")
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdRepaymentsList()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.repayments.list", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        
        var repaymentsList : ListResponse<RepaymentResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").repayments.list() { result in
            switch ( result ) {
            case .success( let list ):
                repaymentsList = list
                XCTAssertTrue(repaymentsList?.items.count == 2 , "Repayments list count must be 2.")
                
                XCTAssertEqual(repaymentsList!.items [0].repaymentDate, self.dateFormatter.date(from: "2016-01-18"))
                
                XCTAssertEqual(repaymentsList!.items [0].amount.value, 32500 )
                XCTAssertEqual(repaymentsList!.items [0].amount.precision, 2 )
                XCTAssertEqual(repaymentsList!.items [0].amount.currency, "CZK" )
                
                XCTAssertEqual(repaymentsList!.items [0].paidAmount!.value, 32500 )
                XCTAssertEqual(repaymentsList!.items [0].paidAmount!.precision, 2 )
                XCTAssertEqual(repaymentsList!.items [0].paidAmount!.currency, "CZK" )
                
                XCTAssertEqual(repaymentsList!.items [1].repaymentDate, self.dateFormatter.date(from: "2016-02-18"))
                
                XCTAssertEqual(repaymentsList!.items [1].amount.value, 32500 )
                XCTAssertEqual(repaymentsList!.items [1].amount.precision, 2 )
                XCTAssertEqual(repaymentsList!.items [1].amount.currency, "CZK" )
                
                XCTAssertEqual(repaymentsList!.items [1].paidAmount!.value, 25000 )
                XCTAssertEqual(repaymentsList!.items [1].paidAmount!.precision, 2 )
                XCTAssertEqual(repaymentsList!.items [1].paidAmount!.currency, "CZK" )
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdStatementsList()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.statements.list", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = StatementsParameters(pagination: nil, sort: Sort( by:[(.statementDate, .ascending)]))
        
        var statementsList : PaginatedListResponse<StatementResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").statements.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList = list
                XCTAssertTrue(statementsList?.items.count == 1 , "Statements list count must be 1.")
                
                XCTAssertEqual(statementsList!.items [0].id, "06029392819b0198")
                XCTAssertEqual(statementsList!.items [0].number, 2)
                XCTAssertEqual(statementsList!.items [0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statementsList!.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList!.items [0].language.value, "cs")
                XCTAssertEqual(statementsList!.items [0].statementDate, self.dateTimeFormatter.date(from: "2016-02-29T00:00:00+01:00"))
                XCTAssertEqual(statementsList!.items [0].czFileTotalNumber, 1)
                XCTAssertEqual(statementsList!.items [0].czFileOrderNumber, 0)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdStatementsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.statements.list.page0", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = StatementsParameters(pagination: Pagination(pageNumber: 0, pageSize: 1), sort: nil)
        
        var statementsList : PaginatedListResponse<StatementResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").statements.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList = list
                XCTAssertTrue(statementsList?.items.count == 1 , "Statements list count must be 1.")
                
                XCTAssertEqual(statementsList!.items [0].id, "06029392819b0198")
                XCTAssertEqual(statementsList!.items [0].number, 2)
                XCTAssertEqual(statementsList!.items [0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statementsList!.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList!.items [0].language.value, "cs")
                XCTAssertEqual(statementsList!.items [0].statementDate, self.dateTimeFormatter.date(from: "2016-02-29T00:00:00+01:00"))
                XCTAssertEqual(statementsList!.items [0].czFileTotalNumber, 1)
                XCTAssertEqual(statementsList!.items [0].czFileOrderNumber, 0)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdStatementsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.statements.list.page1", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = StatementsParameters(pagination: Pagination(pageNumber: 1, pageSize: 1), sort: nil)
        
        var statementsList : PaginatedListResponse<StatementResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").statements.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList = list
                XCTAssertTrue(statementsList?.items.count == 1 , "Statements list count must be 1.")
                
                XCTAssertEqual(statementsList!.items [0].id, "06029392819b0197")
                XCTAssertEqual(statementsList!.items [0].number, 3)
                XCTAssertEqual(statementsList!.items [0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statementsList!.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList!.items [0].language.value, "cs")
                XCTAssertEqual(statementsList!.items [0].statementDate, self.dateTimeFormatter.date(from: "2016-02-29T00:00:00+01:00"))
                XCTAssertEqual(statementsList!.items [0].czFileTotalNumber, 1)
                XCTAssertEqual(statementsList!.items [0].czFileOrderNumber, 0)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdStatementsDownload()
    {
        let caseId                = "accounts.withId.statements.download"
        self.judgeSession.setNextCase( caseId: caseId, xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let parametres            = DownloadStatementsParameters(statementId: "06029392819b0198")
        
        var verifyResult          = false
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").statements.signedDownload(parametres) { result in
            switch ( result ) {
            case .success( let pdfFileName ):
                XCTAssertTrue( self.isValidPdfDocumentAtFilePath(pdfFileName: pdfFileName))
                expectation.fulfill()
                
            case .failure(let error):
                verifyResult = true
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        if verifyResult {
            self.judgeSession.verifyLastTestCase(caseId: caseId, xcTestCase: self) { error in
                if let coreError = error as? CoreSDKError, let info = coreError.serverErrorInfo {
                    XCTAssertTrue( false, "Error: \(info)" )
                }
                else {
                    XCTAssertTrue( false, "Error: \(error)" );
                }
            }
        }
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdSubAccountsWithIdStatementsList()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.subAccounts.withId.statements.list", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = StatementsParameters(pagination: nil, sort: Sort( by:[(.statementDate, .ascending)]))
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").subAccounts.withId("0D5F82464A77DF093858A8A5B938BEE410B4409C").statements.list(params) { result in
            switch ( result ) {
            case .success( let statementsList ):
                let statements: [StatementResponse] = statementsList.items
                XCTAssertTrue(statements.count == 2 , "Statements list count must be 2.")
                
                XCTAssertEqual(statements[0].id, "201302520130621161819")
                XCTAssertEqual(statements[0].number, 25)
                XCTAssertEqual(statements[0].statementDate, self.dateTimeFormatter.date(from: "2013-06-21T14:18:19Z"))
                XCTAssertEqual(statements[0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statements[0].format?.value, "PDF_A4")
                XCTAssertEqual(statements[0].language.value, "cs")
                XCTAssertEqual(statements[0].czFileTotalNumber, 1)
                XCTAssertEqual(statements[0].czFileOrderNumber, 1)
                
                XCTAssertEqual(statements[1].id, "201302524845621161819")
                XCTAssertEqual(statements[1].number, 19)
                XCTAssertEqual(statements[1].statementDate, self.dateTimeFormatter.date(from: "2014-05-11T14:12:19Z"))
                XCTAssertEqual(statements[1].periodicity.value, "DAILY")
                XCTAssertEqual(statements[1].format?.value, "PDF_A4")
                XCTAssertEqual(statements[1].language.value, "cs")
                XCTAssertEqual(statements[1].czFileTotalNumber, 2)
                XCTAssertEqual(statements[1].czFileOrderNumber, 1)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testAccountsWithIdSubAccountsWithIdStatementsListPage_0()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.subAccounts.withId.statements.list.page0", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        var statementsList : PaginatedListResponse<StatementResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").subAccounts.withId("0D5F82464A77DF093858A8A5B938BEE410B4409C").statements.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList     = list
                let paginationTest = self.checkPagination(pagination: statementsList!.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(statementsList?.items.count == 1 , "Statements list count must be 1.")
                
                XCTAssertEqual(statementsList!.items [0].id, "201302520130621161819")
                XCTAssertEqual(statementsList!.items [0].number, 25)
                XCTAssertEqual(statementsList!.items [0].statementDate, self.dateTimeFormatter.date(from: "2013-06-21T14:18:19Z"))
                XCTAssertEqual(statementsList!.items [0].periodicity.value, "MONTHLY")
                XCTAssertEqual(statementsList!.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList!.items [0].language.value, "cs")
                XCTAssertEqual(statementsList!.items [0].czFileTotalNumber, 1)
                XCTAssertEqual(statementsList!.items [0].czFileOrderNumber, 1)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdSubAccountsWithIdStatementsListPage_1()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.subAccounts.withId.statements.list.page1", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let params                = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        var statementsList : PaginatedListResponse<StatementResponse>? = nil
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").subAccounts.withId("0D5F82464A77DF093858A8A5B938BEE410B4409C").statements.list(params) { result in
            switch ( result ) {
            case .success( let list ):
                statementsList     = list
                let paginationTest = self.checkPagination(pagination: statementsList!.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                XCTAssertTrue(statementsList?.items.count == 1 , "Statements list count must be 1.")
                
                XCTAssertEqual(statementsList!.items [0].id, "201302524845621161819")
                XCTAssertEqual(statementsList!.items [0].number, 19)
                XCTAssertEqual(statementsList!.items [0].statementDate, self.dateTimeFormatter.date(from: "2014-05-11T14:12:19Z"))
                XCTAssertEqual(statementsList!.items [0].periodicity.value, "DAILY")
                XCTAssertEqual(statementsList!.items [0].format?.value, "PDF_A4")
                XCTAssertEqual(statementsList!.items [0].language.value, "cs")
                XCTAssertEqual(statementsList!.items [0].czFileTotalNumber, 2)
                XCTAssertEqual(statementsList!.items [0].czFileOrderNumber, 1)
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    
    //--------------------------------------------------------------------------
    func testAccountsWithIdSubAccountsWithIdStatementsDownload()
    {
        self.judgeSession.setNextCase( caseId: "accounts.withId.subAccounts.withId.statements.download", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        let parametres            = DownloadStatementsParameters(statementId: "201302520130621180000")
        
        self.client.accounts.withId("076E1DBCCCD38729A99D93AC8D3E8273237C7E36").subAccounts.withId("0D5F82464A77DF093858A8A5B938BEE410B4409C").statements.download(parametres) { result in
            switch ( result ) {
            case .success( let pdfFileName ):
                XCTAssertTrue( self.isValidPdfDocumentAtFilePath(pdfFileName: pdfFileName))
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail( "Download failed with error: \(error)" )
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
}
