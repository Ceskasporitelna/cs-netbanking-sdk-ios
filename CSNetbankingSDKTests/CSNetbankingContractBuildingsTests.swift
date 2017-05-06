//
//  CSNetbankingContractBuildingsTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 25/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingContractBuildingsTests: CSNetbankingTest
{

    //--------------------------------------------------------------------------
    func testContractsBuildingsList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.buildings.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.buildings.list(params) { result in
            switch (result) {
            case .success(let buildingList):
                let paginationTest = self.checkPagination(pagination: buildingList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let buildings: [BuildingsContractResponse] = buildingList.items
                
                XCTAssertTrue(buildings.count == 1, "Buildings list items count must be 1.")
                
                XCTAssertEqual(buildings[0].id, "BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79")
                XCTAssertEqual(buildings[0].type.value, BuildingAccountType.buildSaving.value)
                XCTAssertEqual(buildings[0].product, "280")
                XCTAssertEqual(buildings[0].productI18N, "Stavební spoření")
                
                XCTAssertEqual(buildings[0].balance.value, 169200)
                XCTAssertEqual(buildings[0].balance.precision, 2)
                XCTAssertEqual(buildings[0].balance.currency, "CZK")
                
                XCTAssertTrue(buildings[0].contractHolders!.count == 1, "Contract holders list items count must be 1.")
                XCTAssertEqual(buildings[0].contractHolders![0], "Hana Bielčíková")
                
                XCTAssertEqual(buildings[0].status.value, BuildingsContractStatus.active.value)
                
                XCTAssertEqual(buildings[0].saving?.targetAmount?.value, 14100000)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.currency, "CZK")
                
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.value, 70500)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.currency, "CZK")
                
                XCTAssertTrue(buildings[0].flags!.count == 1, "Flags list items count must be 1.")
                XCTAssertEqual(buildings[0].flags![0], "accountQueryAllowed")
                
                XCTAssertEqual(buildings[0].accountno?.number, "51-1050445627")
                XCTAssertEqual(buildings[0].accountno?.bankCode, "8060")
                XCTAssertEqual(buildings[0].accountno?.countryCode, "CZ")
                XCTAssertEqual(buildings[0].accountno?.czIBAN, "CZ1580600000511050445627")
                XCTAssertEqual(buildings[0].accountno?.czBIC, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsBuildingsListPagination()
    {
        self.judgeSession.setNextCase( caseId: "contracts.buildings.list.pagination", xcTestCase: self)
        
        var expectation = self.expectation(description: "Response expectation")
        var params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.buildings.list(params) { result in
            switch (result) {
            case .success(let buildingList):
                let paginationTest = self.checkPagination(pagination: buildingList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let buildings: [BuildingsContractResponse] = buildingList.items
                XCTAssertTrue(buildings.count == 1, "Buildings list items count must be 1.")
                
                XCTAssertEqual(buildings[0].id, "BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79")
                XCTAssertEqual(buildings[0].type.value, "BUILD_SAVING")
                XCTAssertEqual(buildings[0].product, "280")
                XCTAssertEqual(buildings[0].productI18N, "Stavební spoření")
                
                XCTAssertEqual(buildings[0].balance.value, 169200)
                XCTAssertEqual(buildings[0].balance.precision, 2)
                XCTAssertEqual(buildings[0].balance.currency, "CZK")
                
                XCTAssertTrue(buildings[0].contractHolders!.count == 1, "Contract holders list items count must be 1.")
                XCTAssertEqual(buildings[0].contractHolders![0], "Hana Bielčíková")
                
                XCTAssertEqual(buildings[0].status.value, BuildingsContractStatus.active.value)
                
                XCTAssertEqual(buildings[0].saving?.targetAmount?.value, 14100000)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.currency, "CZK")
                
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.value, 70500)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.currency, "CZK")
                
                XCTAssertTrue(buildings[0].flags!.count == 1, "Flags list items count must be 1.")
                XCTAssertEqual(buildings[0].flags![0], "accountQueryAllowed")
                
                XCTAssertEqual(buildings[0].accountno?.number, "51-1050445627")
                XCTAssertEqual(buildings[0].accountno?.bankCode, "8060")
                XCTAssertEqual(buildings[0].accountno?.countryCode, "CZ")
                XCTAssertEqual(buildings[0].accountno?.czIBAN, "CZ1580600000511050445627")
                XCTAssertEqual(buildings[0].accountno?.czBIC, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        self.client.contracts.buildings.list(params) { result in
            switch (result) {
            case .success(let buildingList):
                let paginationTest = self.checkPagination(pagination: buildingList.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)

                let buildings: [BuildingsContractResponse] = buildingList.items
                XCTAssertTrue(buildings.count == 1, "Buildings list items count must be 1.")
                
                XCTAssertEqual(buildings[0].id, "EC91C2D1B33D5A9E927C5B3EC509589818E292D1")
                XCTAssertEqual(buildings[0].type.value, BuildingAccountType.buildSaving.value)
                XCTAssertEqual(buildings[0].product, "280")
                XCTAssertEqual(buildings[0].productI18N, "Stavební spoření")
                
                XCTAssertEqual(buildings[0].balance.value, 0)
                XCTAssertEqual(buildings[0].balance.precision, 2)
                XCTAssertEqual(buildings[0].balance.currency, "CZK")
                
                XCTAssertTrue(buildings[0].contractHolders!.count == 1, "Contract holders list items count must be 1.")
                XCTAssertEqual(buildings[0].contractHolders![0], "Hana Bielčíková")
                
                XCTAssertEqual(buildings[0].status.value, BuildingsContractStatus.active.value)
                
                XCTAssertEqual(buildings[0].saving?.targetAmount?.value, 18600000)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.currency, "CZK")
                
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.value, 93000)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.currency, "CZK")
                
                XCTAssertTrue(buildings[0].flags!.count == 1, "Flags list items count must be 1.")
                XCTAssertEqual(buildings[0].flags![0], "accountQueryAllowed")
                
                XCTAssertEqual(buildings[0].accountno?.number, "51-1050690710")
                XCTAssertEqual(buildings[0].accountno?.bankCode, "8060")
                XCTAssertEqual(buildings[0].accountno?.countryCode, "CZ")
                XCTAssertEqual(buildings[0].accountno?.czIBAN, "CZ1780600000511050690710")
                XCTAssertEqual(buildings[0].accountno?.czBIC, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.buildings.list(params) { result in
            switch (result) {
            case .success(let buildingList):
                let paginationTest = self.checkPagination(pagination: buildingList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let buildings: [BuildingsContractResponse] = buildingList.items
                XCTAssertTrue(buildings.count == 1, "Buildings list items count must be 1.")
                
                XCTAssertEqual(buildings[0].id, "BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79")
                XCTAssertEqual(buildings[0].type.value, "BUILD_SAVING")
                XCTAssertEqual(buildings[0].product, "280")
                XCTAssertEqual(buildings[0].productI18N, "Stavební spoření")
                
                XCTAssertEqual(buildings[0].balance.value, 169200)
                XCTAssertEqual(buildings[0].balance.precision, 2)
                XCTAssertEqual(buildings[0].balance.currency, "CZK")
                
                XCTAssertTrue(buildings[0].contractHolders!.count == 1, "Contract holders list items count must be 1.")
                XCTAssertEqual(buildings[0].contractHolders![0], "Hana Bielčíková")
                
                XCTAssertEqual(buildings[0].status.value, "ACTIVE")
                
                XCTAssertEqual(buildings[0].saving?.targetAmount?.value, 14100000)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.targetAmount?.currency, "CZK")
                
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.value, 70500)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.precision, 2)
                XCTAssertEqual(buildings[0].saving?.agreedMonthlySavings?.currency, "CZK")
                
                XCTAssertTrue(buildings[0].flags!.count == 1, "Flags list items count must be 1.")
                XCTAssertEqual(buildings[0].flags![0], "accountQueryAllowed")
                
                XCTAssertEqual(buildings[0].accountno?.number, "51-1050445627")
                XCTAssertEqual(buildings[0].accountno?.bankCode, "8060")
                XCTAssertEqual(buildings[0].accountno?.countryCode, "CZ")
                XCTAssertEqual(buildings[0].accountno?.czIBAN, "CZ1580600000511050445627")
                XCTAssertEqual(buildings[0].accountno?.czBIC, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsBuildingsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "contracts.buildings.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.buildings.withId("BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79").get() { result in
            switch (result) {
            case .success(let building):
                
                XCTAssertEqual(building.id, "BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79")
                XCTAssertEqual(building.type.value, BuildingAccountType.buildSaving.value)
                XCTAssertEqual(building.product, "280")
                XCTAssertEqual(building.productI18N, "Stavební spoření")
                
                XCTAssertEqual(building.balance.value, 169200)
                XCTAssertEqual(building.balance.precision, 2)
                XCTAssertEqual(building.balance.currency, "CZK")
                
                XCTAssertTrue(building.contractHolders!.count == 1, "Contract holders list items count must be 1.")
                XCTAssertEqual(building.contractHolders![0], "Hana Bielčíková")
                
                XCTAssertEqual(building.status.value, BuildingsContractStatus.active.value)
                
                XCTAssertEqual(building.saving?.targetAmount?.value, 14100000)
                XCTAssertEqual(building.saving?.targetAmount?.precision, 2)
                XCTAssertEqual(building.saving?.targetAmount?.currency, "CZK")
                
                XCTAssertEqual(building.saving?.agreedMonthlySavings?.value, 70500)
                XCTAssertEqual(building.saving?.agreedMonthlySavings?.precision, 2)
                XCTAssertEqual(building.saving?.agreedMonthlySavings?.currency, "CZK")
                
                XCTAssertTrue(building.flags!.count == 1, "Flags list items count must be 1.")
                XCTAssertEqual(building.flags![0], "accountQueryAllowed")
                
                XCTAssertEqual(building.accountno?.number, "51-1050445627")
                XCTAssertEqual(building.accountno?.bankCode, "8060")
                XCTAssertEqual(building.accountno?.countryCode, "CZ")
                XCTAssertEqual(building.accountno?.czIBAN, "CZ1580600000511050445627")
                XCTAssertEqual(building.accountno?.czBIC, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsBuildingsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.buildings.withId.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let request     = UpdateBuildingsContractRequest()
        request.alias   = "test alias"
        
        self.client.contracts.buildings.withId("BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79").update(request) { result in
            switch (result) {
            case .success(let response):
                
                XCTAssertEqual(response.id, "BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79")
                XCTAssertEqual(response.alias, "test alias")
                XCTAssertEqual(response.type.value, BuildingAccountType.buildSaving.value)
                XCTAssertEqual(response.product, "280")
                XCTAssertEqual(response.productI18N, "Stavební spoření")
                
                XCTAssertEqual(response.balance.value, 169200)
                XCTAssertEqual(response.balance.precision, 2)
                XCTAssertEqual(response.balance.currency, "CZK")
                
                XCTAssertTrue(response.contractHolders!.count == 1, "Contract holders list items count must be 1.")
                XCTAssertEqual(response.contractHolders![0], "Hana Bielčíková")
                
                XCTAssertEqual(response.status.value, BuildingsContractStatus.active.value)
                
                XCTAssertEqual(response.saving?.targetAmount?.value, 14100000)
                XCTAssertEqual(response.saving?.targetAmount?.precision, 2)
                XCTAssertEqual(response.saving?.targetAmount?.currency, "CZK")
                
                XCTAssertEqual(response.saving?.agreedMonthlySavings?.value, 70500)
                XCTAssertEqual(response.saving?.agreedMonthlySavings?.precision, 2)
                XCTAssertEqual(response.saving?.agreedMonthlySavings?.currency, "CZK")
                
                XCTAssertTrue(response.flags!.count == 1, "Flags list items count must be 1.")
                XCTAssertEqual(response.flags![0], "accountQueryAllowed")
                
                XCTAssertEqual(response.accountno?.number, "51-1050445627")
                XCTAssertEqual(response.accountno?.bankCode, "8060")
                XCTAssertEqual(response.accountno?.countryCode, "CZ")
                XCTAssertEqual(response.accountno?.czIBAN, "CZ1580600000511050445627")
                XCTAssertEqual(response.accountno?.czBIC, "GIBACZPX")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsBuildingsWithIdServicesList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.buildings.withId.services.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.buildings.withId("BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79").services.list(params) { result in
            switch (result) {
            case .success(let serviceList):
                let paginationTest = self.checkPagination(pagination: serviceList.pagination, pageNumber: 0, pageCount: 1, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let services: [ServiceResponse] = serviceList.items
                
                XCTAssertTrue(services.count == 2, "Services count must be 2.")
                
                XCTAssertEqual(services [0].id, "s54sdf756dfhm52879sdf23xd8744Fsdf5")
                XCTAssertEqual(services [0].nameI18N, "Uver k stavebnimu sporeni")
                XCTAssertEqual(services [0].iconGroup, "DEFAULT")
                
                XCTAssertEqual(services [1].id, "154dff756dfhm52879sdf23d845sd4f84f")
                XCTAssertEqual(services [1].nameI18N, "Preklenovaci uver")
                XCTAssertEqual(services [1].iconGroup, "DEFAULT")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsBuildingsWithIdTransactionsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.buildings.withId.transactions.withId.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let request     = SecurityTransactionRequest()
        
        request.id      = "JHJKLASDHKALD12321"
        request.note    = "New client's personal note for transaction"
        request.flags   = ["hasStar"]
        
        self.client.contracts.buildings.withId("BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79").transactions.withId("JHJKLASDHKALD12321").update(request) { result in
            switch (result) {
            case .success(let response):
                
                XCTAssertEqual(response.transaction.id, "JHJKLASDHKALD12321")
                XCTAssertEqual(response.transaction.note, "New client's personal note for transaction")
                
                XCTAssertTrue(response.transaction.flags!.count == 2, "Flags list items count must be 1.")
                XCTAssertEqual(response.transaction.flags![0], "hasNote")
                XCTAssertEqual(response.transaction.flags![1], "hasStar")
                
                XCTAssertEqual(response.signInfo!.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsBuildingsWithIdTransactionsExport()
    {
        let caseId                   = "contracts.buildings.withId.transactions.export"
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
        self.client.contracts.buildings.withId("BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79").transactions.export(parametres) { result in
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
                    XCTAssertTrue( false, "Error: \(String(describing: error))" );
                }
            }
        }
    }


}
