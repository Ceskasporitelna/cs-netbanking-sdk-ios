//
//  CSNetbankingContractPensionsTests.swift
//  CSNetbankingSDK
//
//  Created by Vladimír Nevyhoštěný on 28/08/16.
//  Copyright © 2016 Applifting s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CSCoreSDK

@testable import CSNetbankingSDK

//==============================================================================
class CSNetbankingContractPensionsTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testContractsPensionsList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.pensions.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.pensions.list(params) { result in
            switch (result) {
            case .success(let pensionsList):
                let paginationTest = self.checkPagination(pagination: pensionsList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let pensions: [PensionResponse] = pensionsList.items
                XCTAssertEqual(pensions.count,1)
                
                XCTAssertEqual(pensions[0].validFrom, self.dateFormatter.date(from: "2015-12-01"))
                
                XCTAssertEqual(pensions[0].paidBenefits.value, 0)
                XCTAssertEqual(pensions[0].paidBenefits.precision, 2)
                XCTAssertEqual(pensions[0].paidBenefits.currency, "CZK")
                
                XCTAssertEqual(pensions[0].owner, "Hana Bielčíková")
                XCTAssertEqual(pensions[0].id, "E7DD68AA3FF4487AF75626F901761B071E72FFFC")
                XCTAssertEqual(pensions[0].agreementNumber, "700117447")
                XCTAssertEqual(pensions[0].status.value, PensionStatus.active.value)
                
                XCTAssertEqual(pensions[0].productAccount.amount.value, 767292)
                XCTAssertEqual(pensions[0].productAccount.amount.precision, 2)
                XCTAssertEqual(pensions[0].productAccount.amount.currency, "CZK")
                
                XCTAssertEqual(pensions[0].productI18N, "Doplňkové penzijní spoření")
                XCTAssertEqual(pensions[0].product, "55")
                XCTAssertEqual(pensions[0].birthNumber, "8152152602")
                
                XCTAssertEqual(pensions[0].strategy?.conservative, 100)
                
                XCTAssertTrue((pensions[0].pensionAgreed?.oldAge)!)
                XCTAssertTrue((pensions[0].pensionAgreed?.disability)!)
                
                XCTAssertTrue((pensions[0].contribution?.employer)!)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.value, 30000)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.precision, 2)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.currency, "CZK")
                
                XCTAssertFalse((pensions[0].supplementary?.maxService)!)
                XCTAssertFalse((pensions[0].supplementary?.optService)!)
                
                XCTAssertEqual(pensions[0].beneficiaries?.count, 2)
                
                XCTAssertEqual(pensions[0].beneficiaries?[0].name, "Eliška Bielčíková")
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthDate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthNumber, "0806099999")
                XCTAssertEqual(pensions[0].beneficiaries?[0].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[0].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[0].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].beneficiaries?[1].name, "Tomáš Bielčík")
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthDate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthNumber, "0309109999")
                XCTAssertEqual(pensions[0].beneficiaries?[1].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[1].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[1].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].subtype.value, PensionSubtype.supplementarySavings.value)
                
                XCTAssertEqual(pensions[0].flags?.count, 1)
                XCTAssertEqual(pensions[0].flags?[0], "accountQueryAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsPensionsListPagination()
    {
        self.judgeSession.setNextCase( caseId: "contracts.pensions.list.pagination", xcTestCase: self)
        
        var expectation = self.expectation(description: "Response expectation")
        var params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.pensions.list(params) { result in
            switch (result) {
            case .success(let pensionsList):
                let paginationTest = self.checkPagination(pagination: pensionsList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let pensions: [PensionResponse] = pensionsList.items
                XCTAssertEqual(pensions.count,1)
                
                XCTAssertEqual(pensions[0].validFrom, self.dateFormatter.date(from: "2015-12-01"))
                
                XCTAssertEqual(pensions[0].paidBenefits.value, 0)
                XCTAssertEqual(pensions[0].paidBenefits.precision, 2)
                XCTAssertEqual(pensions[0].paidBenefits.currency, "CZK")
                
                XCTAssertEqual(pensions[0].owner, "Hana Bielčíková")
                XCTAssertEqual(pensions[0].id, "E7DD68AA3FF4487AF75626F901761B071E72FFFC")
                XCTAssertEqual(pensions[0].agreementNumber, "700117447")
                XCTAssertEqual(pensions[0].status.value, PensionStatus.active.value)
                
                XCTAssertEqual(pensions[0].productAccount.amount.value, 767292)
                XCTAssertEqual(pensions[0].productAccount.amount.precision, 2)
                XCTAssertEqual(pensions[0].productAccount.amount.currency, "CZK")
                
                XCTAssertEqual(pensions[0].productI18N, "Doplňkové penzijní spoření")
                XCTAssertEqual(pensions[0].product, "55")
                XCTAssertEqual(pensions[0].birthNumber, "8152152602")
                
                XCTAssertEqual(pensions[0].strategy?.conservative, 100)
                
                XCTAssertTrue((pensions[0].pensionAgreed?.oldAge)!)
                XCTAssertTrue((pensions[0].pensionAgreed?.disability)!)
                
                XCTAssertTrue((pensions[0].contribution?.employer)!)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.value, 30000)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.precision, 2)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.currency, "CZK")
                
                XCTAssertFalse((pensions[0].supplementary?.maxService)!)
                XCTAssertFalse((pensions[0].supplementary?.optService)!)
                
                XCTAssertEqual(pensions[0].beneficiaries?.count, 2)
                
                XCTAssertEqual(pensions[0].beneficiaries?[0].name, "Eliška Bielčíková")
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthDate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthNumber, "0806099999")
                XCTAssertEqual(pensions[0].beneficiaries?[0].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[0].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[0].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].beneficiaries?[1].name, "Tomáš Bielčík")
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthDate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthNumber, "0309109999")
                XCTAssertEqual(pensions[0].beneficiaries?[1].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[1].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[1].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].subtype.value, PensionSubtype.supplementarySavings.value)
                
                XCTAssertEqual(pensions[0].flags?.count, 1)
                XCTAssertEqual(pensions[0].flags?[0], "accountQueryAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        self.client.contracts.pensions.list(params) { result in
            switch (result) {
            case .success(let pensionsList):
                let paginationTest = self.checkPagination(pagination: pensionsList.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let pensions: [PensionResponse] = pensionsList.items
                XCTAssertEqual(pensions.count,1)
                
                XCTAssertEqual(pensions[0].validFrom, self.dateFormatter.date(from: "2015-12-01"))
                
                XCTAssertEqual(pensions[0].paidBenefits.value, 0)
                XCTAssertEqual(pensions[0].paidBenefits.precision, 2)
                XCTAssertEqual(pensions[0].paidBenefits.currency, "CZK")
                
                XCTAssertEqual(pensions[0].owner, "Hana Bielčíková")
                XCTAssertEqual(pensions[0].id, "E7DD68AA3FF4287AF75626F901761B071E72FFFC")
                XCTAssertEqual(pensions[0].agreementNumber, "700117447")
                XCTAssertEqual(pensions[0].status.value, PensionStatus.active.value)
                
                XCTAssertEqual(pensions[0].productAccount.amount.value, 767292)
                XCTAssertEqual(pensions[0].productAccount.amount.precision, 2)
                XCTAssertEqual(pensions[0].productAccount.amount.currency, "CZK")
                
                XCTAssertEqual(pensions[0].productI18N, "Doplňkové penzijní spoření")
                XCTAssertEqual(pensions[0].product, "55")
                XCTAssertEqual(pensions[0].birthNumber, "8152152602")
                
                XCTAssertEqual(pensions[0].strategy?.conservative, 100)
                
                XCTAssertTrue((pensions[0].pensionAgreed?.oldAge)!)
                XCTAssertTrue((pensions[0].pensionAgreed?.disability)!)
                
                XCTAssertTrue((pensions[0].contribution?.employer)!)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.value, 30000)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.precision, 2)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.currency, "CZK")
                
                XCTAssertFalse((pensions[0].supplementary?.maxService)!)
                XCTAssertFalse((pensions[0].supplementary?.optService)!)
                
                XCTAssertEqual(pensions[0].beneficiaries?.count, 2)
                
                XCTAssertEqual(pensions[0].beneficiaries?[0].name, "Eliška Bielčíková")
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthDate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthNumber, "0806099999")
                XCTAssertEqual(pensions[0].beneficiaries?[0].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[0].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[0].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].beneficiaries?[1].name, "Tomáš Bielčík")
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthDate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthNumber, "0309109999")
                XCTAssertEqual(pensions[0].beneficiaries?[1].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[1].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[1].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].subtype.value, PensionSubtype.supplementarySavings.value)
                
                XCTAssertEqual(pensions[0].flags?.count, 1)
                XCTAssertEqual(pensions[0].flags?[0], "accountQueryAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.pensions.list(params) { result in
            switch (result) {
            case .success(let pensionsList):
                let paginationTest = self.checkPagination(pagination: pensionsList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let pensions: [PensionResponse] = pensionsList.items
                XCTAssertEqual(pensions.count,1)
                
                XCTAssertEqual(pensions[0].validFrom, self.dateFormatter.date(from: "2015-12-01"))
                
                XCTAssertEqual(pensions[0].paidBenefits.value, 0)
                XCTAssertEqual(pensions[0].paidBenefits.precision, 2)
                XCTAssertEqual(pensions[0].paidBenefits.currency, "CZK")
                
                XCTAssertEqual(pensions[0].owner, "Hana Bielčíková")
                XCTAssertEqual(pensions[0].id, "E7DD68AA3FF4487AF75626F901761B071E72FFFC")
                XCTAssertEqual(pensions[0].agreementNumber, "700117447")
                XCTAssertEqual(pensions[0].status.value, PensionStatus.active.value)
                
                XCTAssertEqual(pensions[0].productAccount.amount.value, 767292)
                XCTAssertEqual(pensions[0].productAccount.amount.precision, 2)
                XCTAssertEqual(pensions[0].productAccount.amount.currency, "CZK")
                
                XCTAssertEqual(pensions[0].productI18N, "Doplňkové penzijní spoření")
                XCTAssertEqual(pensions[0].product, "55")
                XCTAssertEqual(pensions[0].birthNumber, "8152152602")
                
                XCTAssertEqual(pensions[0].strategy?.conservative, 100)
                
                XCTAssertTrue((pensions[0].pensionAgreed?.oldAge)!)
                XCTAssertTrue((pensions[0].pensionAgreed?.disability)!)
                
                XCTAssertTrue((pensions[0].contribution?.employer)!)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.value, 30000)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.precision, 2)
                XCTAssertEqual(pensions[0].contribution?.participantAmount.currency, "CZK")
                
                XCTAssertFalse((pensions[0].supplementary?.maxService)!)
                XCTAssertFalse((pensions[0].supplementary?.optService)!)
                
                XCTAssertEqual(pensions[0].beneficiaries?.count, 2)
                
                XCTAssertEqual(pensions[0].beneficiaries?[0].name, "Eliška Bielčíková")
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthDate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(pensions[0].beneficiaries?[0].birthNumber, "0806099999")
                XCTAssertEqual(pensions[0].beneficiaries?[0].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[0].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[0].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].beneficiaries?[1].name, "Tomáš Bielčík")
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthDate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(pensions[0].beneficiaries?[1].birthNumber, "0309109999")
                XCTAssertEqual(pensions[0].beneficiaries?[1].address?.country, "CZ")
                XCTAssertEqual(pensions[0].beneficiaries?[1].share, 50)
                XCTAssertEqual(pensions[0].beneficiaries?[1].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pensions[0].subtype.value, PensionSubtype.supplementarySavings.value)
                
                XCTAssertEqual(pensions[0].flags?.count, 1)
                XCTAssertEqual(pensions[0].flags?[0], "accountQueryAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsPensionsWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "contracts.pensions.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.pensions.withId("E7DD68AA3FF4487AF75626F901761B071E72FFFC").get() { result in
            switch (result) {
            case .success(let pension):
                XCTAssertEqual(pension.validFrom, self.dateFormatter.date(from: "2015-12-01"))
                
                XCTAssertEqual(pension.paidBenefits.value, 0)
                XCTAssertEqual(pension.paidBenefits.precision, 2)
                XCTAssertEqual(pension.paidBenefits.currency, "CZK")
                
                XCTAssertEqual(pension.owner, "Hana Bielčíková")
                XCTAssertEqual(pension.id, "E7DD68AA3FF4487AF75626F901761B071E72FFFC")
                XCTAssertEqual(pension.agreementNumber, "700117447")
                XCTAssertEqual(pension.status.value, PensionStatus.active.value)
                
                XCTAssertEqual(pension.productAccount.amount.value, 767292)
                XCTAssertEqual(pension.productAccount.amount.precision, 2)
                XCTAssertEqual(pension.productAccount.amount.currency, "CZK")
                
                XCTAssertEqual(pension.productI18N, "Doplňkové penzijní spoření")
                XCTAssertEqual(pension.product, "55")
                XCTAssertEqual(pension.birthNumber, "8152152602")
                
                XCTAssertEqual(pension.strategy?.conservative, 100)
                
                XCTAssertTrue((pension.pensionAgreed?.oldAge)!)
                XCTAssertTrue((pension.pensionAgreed?.disability)!)
                
                XCTAssertTrue((pension.contribution?.employer)!)
                XCTAssertEqual(pension.contribution?.participantAmount.value, 30000)
                XCTAssertEqual(pension.contribution?.participantAmount.precision, 2)
                XCTAssertEqual(pension.contribution?.participantAmount.currency, "CZK")
                
                XCTAssertFalse((pension.supplementary?.maxService)!)
                XCTAssertFalse((pension.supplementary?.optService)!)
                
                XCTAssertEqual(pension.beneficiaries?.count, 2)
                
                XCTAssertEqual(pension.beneficiaries?[0].name, "Eliška Bielčíková")
                XCTAssertEqual(pension.beneficiaries?[0].birthDate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(pension.beneficiaries?[0].birthNumber, "0806099999")
                XCTAssertEqual(pension.beneficiaries?[0].address?.country, "CZ")
                XCTAssertEqual(pension.beneficiaries?[0].share, 50)
                XCTAssertEqual(pension.beneficiaries?[0].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pension.beneficiaries?[1].name, "Tomáš Bielčík")
                XCTAssertEqual(pension.beneficiaries?[1].birthDate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(pension.beneficiaries?[1].birthNumber, "0309109999")
                XCTAssertEqual(pension.beneficiaries?[1].address?.country, "CZ")
                XCTAssertEqual(pension.beneficiaries?[1].share, 50)
                XCTAssertEqual(pension.beneficiaries?[1].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(pension.subtype.value, PensionSubtype.supplementarySavings.value)
                
                XCTAssertEqual(pension.flags?.count, 1)
                XCTAssertEqual(pension.flags?[0], "accountQueryAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContractsPensionsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.pensions.withId.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let request     = UpdatePensionRequest()
        request.id      = "E7DD68AA3FF4487AF75626F901761B071E72FFFC"
        request.alias   = "test alias"
        
        self.client.contracts.pensions.withId("E7DD68AA3FF4487AF75626F901761B071E72FFFC").update(request){ result in
            switch (result) {
            case .success(let updatePensionResponse):
                XCTAssertEqual(updatePensionResponse.validFrom, self.dateFormatter.date(from: "2015-12-01"))
                
                XCTAssertEqual(updatePensionResponse.paidBenefits.value, 0)
                XCTAssertEqual(updatePensionResponse.paidBenefits.precision, 2)
                XCTAssertEqual(updatePensionResponse.paidBenefits.currency, "CZK")
                
                XCTAssertEqual(updatePensionResponse.owner, "Hana Bielčíková")
                XCTAssertEqual(updatePensionResponse.id, "E7DD68AA3FF4487AF75626F901761B071E72FFFC")
                XCTAssertEqual(updatePensionResponse.agreementNumber, "700117447")
                XCTAssertEqual(updatePensionResponse.status.value, PensionStatus.active.value)
                
                XCTAssertEqual(updatePensionResponse.productAccount.amount.value, 767292)
                XCTAssertEqual(updatePensionResponse.productAccount.amount.precision, 2)
                XCTAssertEqual(updatePensionResponse.productAccount.amount.currency, "CZK")
                
                XCTAssertEqual(updatePensionResponse.productI18N, "Doplňkové penzijní spoření")
                XCTAssertEqual(updatePensionResponse.product, "55")
                XCTAssertEqual(updatePensionResponse.birthNumber, "8152152602")
                
                XCTAssertEqual(updatePensionResponse.strategy?.conservative, 100)
                
                XCTAssertTrue((updatePensionResponse.pensionAgreed?.oldAge)!)
                XCTAssertTrue((updatePensionResponse.pensionAgreed?.disability)!)
                
                XCTAssertTrue((updatePensionResponse.contribution?.employer)!)
                XCTAssertEqual(updatePensionResponse.contribution?.participantAmount.value, 30000)
                XCTAssertEqual(updatePensionResponse.contribution?.participantAmount.precision, 2)
                XCTAssertEqual(updatePensionResponse.contribution?.participantAmount.currency, "CZK")
                
                XCTAssertFalse((updatePensionResponse.supplementary?.maxService)!)
                XCTAssertFalse((updatePensionResponse.supplementary?.optService)!)
                
                XCTAssertEqual(updatePensionResponse.beneficiaries?.count, 2)
                
                XCTAssertEqual(updatePensionResponse.beneficiaries?[0].name, "Eliška Bielčíková")
                XCTAssertEqual(updatePensionResponse.beneficiaries?[0].birthDate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(updatePensionResponse.beneficiaries?[0].birthNumber, "0806099999")
                XCTAssertEqual(updatePensionResponse.beneficiaries?[0].address?.country, "CZ")
                XCTAssertEqual(updatePensionResponse.beneficiaries?[0].share, 50)
                XCTAssertEqual(updatePensionResponse.beneficiaries?[0].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(updatePensionResponse.beneficiaries?[1].name, "Tomáš Bielčík")
                XCTAssertEqual(updatePensionResponse.beneficiaries?[1].birthDate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(updatePensionResponse.beneficiaries?[1].birthNumber, "0309109999")
                XCTAssertEqual(updatePensionResponse.beneficiaries?[1].address?.country, "CZ")
                XCTAssertEqual(updatePensionResponse.beneficiaries?[1].share, 50)
                XCTAssertEqual(updatePensionResponse.beneficiaries?[1].entitlement?.value, Entitlement.takeOver.value)
                
                XCTAssertEqual(updatePensionResponse.subtype.value, PensionSubtype.supplementarySavings.value)
                
                XCTAssertEqual(updatePensionResponse.flags?.count, 1)
                XCTAssertEqual(updatePensionResponse.flags?[0], "accountQueryAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContractsPensionsWithIdTransactionsWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.pensions.withId.transactions.withId.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let request     = SecurityTransactionRequest()
        request.id      = "ADAD9879ADKJH9713"
        request.note    = "New client's personal note for transaction"
        request.flags   = ["hasStar"]
        
        self.client.contracts.pensions.withId("E7DD68AA3FF4487AF75626F901761B071E72FFFC").transactions.withId("ADAD9879ADKJH9713").update(request){ result in
            switch (result) {
            case .success(let securityTransactionResponse):
                XCTAssertEqual(securityTransactionResponse.transaction.id, "ADAD9879ADKJH9713")
                XCTAssertEqual(securityTransactionResponse.transaction.note, "New client's personal note for transaction")
                
                XCTAssertEqual(securityTransactionResponse.transaction.flags?.count, 2)
                XCTAssertEqual(securityTransactionResponse.transaction.flags?[0], "hasNote")
                XCTAssertEqual(securityTransactionResponse.transaction.flags?[1], "hasStar")
                
                XCTAssertEqual(securityTransactionResponse.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsPensionsWithIdTransactionsExport()
    {
        let caseId                   = "contracts.pensions.withId.transactions.export"
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
        self.client.contracts.pensions.withId("BCEF6B001FAE755D163A6CC9475E9FDFD9CD4A79").transactions.export(parametres) { result in
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

}
