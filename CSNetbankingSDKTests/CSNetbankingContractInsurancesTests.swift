//
//  CSNetbankingContractInsurancesTests.swift
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
class CSNetbankingContractInsurancesTests: CSNetbankingTest
{
    //--------------------------------------------------------------------------
    func testContractsInsurancesList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.insurances.list(params) { result in
            switch (result) {
            case .success(let insurancesList):
                let paginationTest = self.checkPagination(pagination: insurancesList.pagination, pageNumber: 0, pageCount: 3, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let insurances: [InsuranceResponse] = insurancesList.items
                XCTAssertTrue(insurances.count == 1, "Insurances list items count must be 1.")
                
                XCTAssertEqual(insurances[0].id, "3961D3F9E922EEE93E2581E896B34566645FE7E3")
                XCTAssertEqual(insurances[0].type, "LIFE")
                XCTAssertEqual(insurances[0].product, "264")
                XCTAssertEqual(insurances[0].productI18N, "Pojištění FLEXI")
                XCTAssertEqual(insurances[0].insurancePolicyHolder, "Hana Bielčíková")
                XCTAssertEqual(insurances[0].policyNumber, "7009689942")
                
                XCTAssertEqual(insurances[0].life?.premium.value, 60000)
                XCTAssertEqual(insurances[0].life?.premium.precision, 2)
                XCTAssertEqual(insurances[0].life?.premium.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractEndDate, self.dateFormatter.date(from: "2046-12-31"))
                XCTAssertEqual(insurances[0].life?.contractStartDate, self.dateFormatter.date(from: "2015-01-01"))
                
                XCTAssertEqual(insurances[0].life?.insuredAmount.value, 0)
                XCTAssertEqual(insurances[0].life?.insuredAmount.precision, 2)
                XCTAssertEqual(insurances[0].life?.insuredAmount.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.value, 0)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.precision, 2)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.premiumPaymentInterval.value, Interval.monthly.value)
                XCTAssertEqual(insurances[0].life?.lastPremiumDate, self.dateFormatter.date(from: "2015-01-15"))
                
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.value, 60000)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.precision, 2)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractTerminationDate, self.dateFormatter.date(from: "0999-12-31"))
                
                XCTAssertTrue(insurances[0].life?.flags?.count == 3, "Life flags count must be 3.")
                XCTAssertEqual(insurances[0].life?.flags? [0], "contractTermination")
                XCTAssertEqual(insurances[0].life?.flags? [1], "taxDeductible")
                XCTAssertEqual(insurances[0].life?.flags? [2], "fundDistribution")
                
                XCTAssertEqual(insurances[0].status.value, InsuranceStatus.active.value)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContractsInsurancesListPagination()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.list.pagination", xcTestCase: self)
        
        var expectation = self.expectation(description: "Response expectation")
        var params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.insurances.list(params) { result in
            switch (result) {
            case .success(let insurancesList):
                let paginationTest = self.checkPagination(pagination: insurancesList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let insurances: [InsuranceResponse] = insurancesList.items
                XCTAssertTrue(insurances.count == 1, "Insurances list items count must be 1.")
                
                XCTAssertEqual(insurances[0].id, "3961D3F9E922EEE93E2581E896B34566645FE7E3")
                XCTAssertEqual(insurances[0].type, "LIFE")
                XCTAssertEqual(insurances[0].product, "264")
                XCTAssertEqual(insurances[0].productI18N, "Pojištění FLEXI")
                XCTAssertEqual(insurances[0].insurancePolicyHolder, "Hana Bielčíková")
                XCTAssertEqual(insurances[0].policyNumber, "7009689942")
                
                XCTAssertEqual(insurances[0].life?.premium.value, 60000)
                XCTAssertEqual(insurances[0].life?.premium.precision, 2)
                XCTAssertEqual(insurances[0].life?.premium.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractEndDate, self.dateFormatter.date(from: "2046-12-31"))
                XCTAssertEqual(insurances[0].life?.contractStartDate, self.dateFormatter.date(from: "2015-01-01"))
                
                XCTAssertEqual(insurances[0].life?.insuredAmount.value, 0)
                XCTAssertEqual(insurances[0].life?.insuredAmount.precision, 2)
                XCTAssertEqual(insurances[0].life?.insuredAmount.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.value, 0)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.precision, 2)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.premiumPaymentInterval.value, Interval.monthly.value)
                XCTAssertEqual(insurances[0].life?.lastPremiumDate, self.dateFormatter.date(from: "2015-01-15"))
                
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.value, 60000)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.precision, 2)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractTerminationDate, self.dateFormatter.date(from: "0999-12-31"))
                
                XCTAssertTrue(insurances[0].life?.flags?.count == 3, "Life flags count must be 3.")
                XCTAssertEqual(insurances[0].life?.flags? [0], "contractTermination")
                XCTAssertEqual(insurances[0].life?.flags? [1], "taxDeductible")
                XCTAssertEqual(insurances[0].life?.flags? [2], "fundDistribution")
                
                XCTAssertEqual(insurances[0].status.value, InsuranceStatus.active.value)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 1, pageSize: 1))
        
        self.client.contracts.insurances.list(params) { result in
            switch (result) {
            case .success(let insurancesList):
                let paginationTest = self.checkPagination(pagination: insurancesList.pagination, pageNumber: 1, pageCount: 2, pageSize: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let insurances: [InsuranceResponse] = insurancesList.items
                XCTAssertTrue(insurances.count == 1, "Insurances list items count must be 1.")
                
                XCTAssertEqual(insurances[0].id, "9B070F9C66A91D55A5D4E31F47B147444E651D36")
                XCTAssertEqual(insurances[0].type, "LIFE")
                XCTAssertEqual(insurances[0].product, "267")
                XCTAssertEqual(insurances[0].productI18N, "Pojištění FLEXI JUNIOR")
                XCTAssertEqual(insurances[0].insurancePolicyHolder, "Hana Bielčíková")
                XCTAssertEqual(insurances[0].policyNumber, "5530446061")
                
                XCTAssertEqual(insurances[0].life?.premium.value, 40000)
                XCTAssertEqual(insurances[0].life?.premium.precision, 2)
                XCTAssertEqual(insurances[0].life?.premium.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractEndDate, self.dateFormatter.date(from: "2033-01-31"))
                XCTAssertEqual(insurances[0].life?.contractStartDate, self.dateFormatter.date(from: "2011-02-01"))
                
                XCTAssertEqual(insurances[0].life?.insuredAmount.value, 0)
                XCTAssertEqual(insurances[0].life?.insuredAmount.precision, 2)
                XCTAssertEqual(insurances[0].life?.insuredAmount.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.value, 0)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.precision, 2)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.premiumPaymentInterval.value, "MONTHLY")
                XCTAssertEqual(insurances[0].life?.lastPremiumDate, self.dateFormatter.date(from: "2011-02-15"))
                
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.value, 40000)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.precision, 2)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractTerminationDate, self.dateFormatter.date(from: "0999-12-31"))
                
                XCTAssertTrue(insurances[0].life?.flags?.count == 1, "Life flags count must be 3.")
                XCTAssertEqual(insurances[0].life?.flags? [0], "contractTermination")
                
                XCTAssertEqual(insurances[0].status.value, InsuranceStatus.active.value)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
        
        expectation = self.expectation(description: "Response expectation")
        params      = ListParameters(pagination: Pagination(pageNumber: 0, pageSize: 1))
        
        self.client.contracts.insurances.list(params) { result in
            switch (result) {
            case .success(let insurancesList):
                let paginationTest = self.checkPagination(pagination: insurancesList.pagination, pageNumber: 0, pageCount: 2, pageSize: 1, nextPageNumber: 1)
                XCTAssertTrue(paginationTest.0, paginationTest.1)
                
                let insurances: [InsuranceResponse] = insurancesList.items
                XCTAssertTrue(insurances.count == 1, "Insurances list items count must be 1.")
                
                XCTAssertEqual(insurances[0].id, "3961D3F9E922EEE93E2581E896B34566645FE7E3")
                XCTAssertEqual(insurances[0].type, "LIFE")
                XCTAssertEqual(insurances[0].product, "264")
                XCTAssertEqual(insurances[0].productI18N, "Pojištění FLEXI")
                XCTAssertEqual(insurances[0].insurancePolicyHolder, "Hana Bielčíková")
                XCTAssertEqual(insurances[0].policyNumber, "7009689942")
                
                XCTAssertEqual(insurances[0].life?.premium.value, 60000)
                XCTAssertEqual(insurances[0].life?.premium.precision, 2)
                XCTAssertEqual(insurances[0].life?.premium.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractEndDate, self.dateFormatter.date(from: "2046-12-31"))
                XCTAssertEqual(insurances[0].life?.contractStartDate, self.dateFormatter.date(from: "2015-01-01"))
                
                XCTAssertEqual(insurances[0].life?.insuredAmount.value, 0)
                XCTAssertEqual(insurances[0].life?.insuredAmount.precision, 2)
                XCTAssertEqual(insurances[0].life?.insuredAmount.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.value, 0)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.precision, 2)
                XCTAssertEqual(insurances[0].life?.currentCapitalValue?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.premiumPaymentInterval.value, Interval.monthly.value)
                XCTAssertEqual(insurances[0].life?.lastPremiumDate, self.dateFormatter.date(from: "2015-01-15"))
                
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.value, 60000)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.precision, 2)
                XCTAssertEqual(insurances[0].life?.lastPremiumPaid?.currency, "CZK")
                
                XCTAssertEqual(insurances[0].life?.contractTerminationDate, self.dateFormatter.date(from: "0999-12-31"))
                
                XCTAssertTrue(insurances[0].life?.flags?.count == 3, "Life flags count must be 3.")
                XCTAssertEqual(insurances[0].life?.flags? [0], "contractTermination")
                XCTAssertEqual(insurances[0].life?.flags? [1], "taxDeductible")
                XCTAssertEqual(insurances[0].life?.flags? [2], "fundDistribution")
                
                XCTAssertEqual(insurances[0].status.value, InsuranceStatus.active.value)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdGet()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").get() { result in
            switch (result) {
            case .success(let insuranceDetail):
                XCTAssertEqual(insuranceDetail.id, "3961D3F9E922EEE93E2581E896B34566645FE7E3")
                XCTAssertEqual(insuranceDetail.type, "LIFE")
                XCTAssertEqual(insuranceDetail.product, "264")
                XCTAssertEqual(insuranceDetail.productI18N, "Pojištění FLEXI")
                XCTAssertEqual(insuranceDetail.insurancePolicyHolder, "Hana Bielčíková")
                XCTAssertEqual(insuranceDetail.policyNumber, "7009689942")
                
                XCTAssertEqual(insuranceDetail.life?.premium.value, 60000)
                XCTAssertEqual(insuranceDetail.life?.premium.precision, 2)
                XCTAssertEqual(insuranceDetail.life?.premium.currency, "CZK")
                
                XCTAssertEqual(insuranceDetail.life?.contractEndDate, self.dateFormatter.date(from: "2046-12-31"))
                XCTAssertEqual(insuranceDetail.life?.contractStartDate, self.dateFormatter.date(from: "2015-01-01"))
                
                XCTAssertEqual(insuranceDetail.life?.insuredAmount.value, 0)
                XCTAssertEqual(insuranceDetail.life?.insuredAmount.precision, 2)
                XCTAssertEqual(insuranceDetail.life?.insuredAmount.currency, "CZK")
                
                XCTAssertEqual(insuranceDetail.life?.premiumPaymentInterval.value, Interval.monthly.value)
                XCTAssertEqual(insuranceDetail.life?.premiumLastPaid, self.dateFormatter.date(from: "2015-12-15"))
                
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?.count, 2)
                
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[0].type?.value, PaymentTemplateType.ordinary.value)
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[0].symbols?.variableSymbol, "7009689942")
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[0].receiver?.number, "1210230319")
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[0].receiver?.bankCode, "0800")
                
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[1].type?.value, PaymentTemplateType.extraordinary.value)
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[1].symbols?.variableSymbol, "7909689942")
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[1].receiver?.number, "7909689942")
                XCTAssertEqual(insuranceDetail.life?.paymentTemplates?[1].receiver?.bankCode, "0800")
                
                XCTAssertEqual(insuranceDetail.status.value, InsuranceStatus.active.value)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        let request     = UpdateInsuranceRequest()
        request.id      = "3961D3F9E922EEE93E2581E896B34566645FE7E3"
        request.alias   = "test alias"
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").update(request) { result in
            switch (result) {
            case .success(let updateResponse):
                XCTAssertEqual(updateResponse.id, "3961D3F9E922EEE93E2581E896B34566645FE7E3")
                XCTAssertEqual(updateResponse.type, "LIFE")
                XCTAssertEqual(updateResponse.product, "264")
                XCTAssertEqual(updateResponse.productI18N, "Pojištění FLEXI")
                XCTAssertEqual(updateResponse.alias, "test alias")
                XCTAssertEqual(updateResponse.insurancePolicyHolder, "Hana Bielčíková")
                XCTAssertEqual(updateResponse.policyNumber, "7009689942")
                
                XCTAssertEqual(updateResponse.life?.premium.value, 60000)
                XCTAssertEqual(updateResponse.life?.premium.precision, 2)
                XCTAssertEqual(updateResponse.life?.premium.currency, "CZK")
                
                XCTAssertEqual(updateResponse.life?.contractEndDate, self.dateFormatter.date(from: "2046-12-31"))
                XCTAssertEqual(updateResponse.life?.contractStartDate, self.dateFormatter.date(from: "2015-01-01"))
                
                XCTAssertEqual(updateResponse.life?.insuredAmount.value, 0)
                XCTAssertEqual(updateResponse.life?.insuredAmount.precision, 2)
                XCTAssertEqual(updateResponse.life?.insuredAmount.currency, "CZK")
                
                XCTAssertEqual(updateResponse.life?.currentCapitalValue?.value, 0)
                XCTAssertEqual(updateResponse.life?.currentCapitalValue?.precision, 2)
                XCTAssertEqual(updateResponse.life?.currentCapitalValue?.currency, "CZK")
                
                XCTAssertEqual(updateResponse.life?.premiumPaymentInterval.value, Interval.monthly.value)
                XCTAssertEqual(updateResponse.life?.lastPremiumDate, self.dateFormatter.date(from: "2015-01-15"))
                
                XCTAssertEqual(updateResponse.life?.lastPremiumPaid?.value, 60000)
                XCTAssertEqual(updateResponse.life?.lastPremiumPaid?.precision, 2)
                XCTAssertEqual(updateResponse.life?.lastPremiumPaid?.currency, "CZK")

                XCTAssertEqual(updateResponse.life?.contractTerminationDate, self.dateFormatter.date(from: "0999-12-31"))
                
                XCTAssertEqual(updateResponse.life?.flags?.count, 3)
                XCTAssertEqual(updateResponse.life?.flags?[0], "contractTermination")
                XCTAssertEqual(updateResponse.life?.flags?[1], "taxDeductible")
                XCTAssertEqual(updateResponse.life?.flags?[2], "fundDistribution")
                
                XCTAssertEqual(updateResponse.status.value, InsuranceStatus.active.value)
                XCTAssertEqual(updateResponse.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdFundsGet()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.funds.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").funds.list() { result in
            switch (result) {
            case .success(let fundsList):
                let funds = fundsList.funds
                XCTAssertEqual(funds?.count, 1)
                
                XCTAssertEqual(funds?[0].code, "24")
                XCTAssertEqual(funds?[0].name, "Garantovaný fond pro běžné pojistné")
                
                XCTAssertEqual(funds?[0].investedAmount.value, 0)
                XCTAssertEqual(funds?[0].investedAmount.precision, 2)
                XCTAssertEqual(funds?[0].investedAmount.currency, "CZK")
                
                XCTAssertEqual(funds?[0].investedShare, 0)
                XCTAssertEqual(funds?[0].allocation, 100)
                
                XCTAssertEqual(fundsList.totalInvestedAmount.value, 0)
                XCTAssertEqual(fundsList.totalInvestedAmount.precision, 2)
                XCTAssertEqual(fundsList.totalInvestedAmount.currency, "CZK")
                
                XCTAssertEqual(fundsList.flags?.count, 1)
                XCTAssertEqual(fundsList.flags?[0], "fundsChangeAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdFundsUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.funds.update", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        let request     = UpdateFundRequest()
        request.funds   = []
        
        var fund        = FundInfo()
        fund.code       = "31"
        fund.allocation = 35
        request.funds?.append(fund)
        
        fund            = FundInfo()
        fund.code       = "32"
        fund.allocation = 65
        request.funds?.append(fund)
        
        request.investmentProgram = "INVESTMENT_MANAGEMENT"
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").funds.update(request) { result in
            switch (result) {
            case .success(let updateFundResponse):
                XCTAssertEqual(updateFundResponse.funds.count, 2)
                
                XCTAssertEqual(updateFundResponse.funds[0].code, "31")
                XCTAssertEqual(updateFundResponse.funds[0].allocation, 35)
                
                XCTAssertEqual(updateFundResponse.funds[1].code, "32")
                XCTAssertEqual(updateFundResponse.funds[1].allocation, 65)
                
                XCTAssertEqual(updateFundResponse.investmentProgram, "INVESTMENT_MANAGEMENT")
                XCTAssertEqual(updateFundResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(updateFundResponse.signInfo?.signId, "151112531008724")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdBeneficiariesGet()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.beneficiaries.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").beneficiaries.list() { result in
            switch (result) {
            case .success(let insuranceBeneficiaryList):
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?.count, 2)
                
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[0].type.value, InsuranceBeneficiaryType.person.value)
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[0].name, "Bielčik Tomáš")
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[0].birthdate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[0].percentage, 50)
                
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[1].type.value, InsuranceBeneficiaryType.person.value)
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[1].name, "Bielčiková Eliška")
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[1].birthdate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(insuranceBeneficiaryList.beneficiaries?[1].percentage, 50)
                
                XCTAssertEqual(insuranceBeneficiaryList.flags?.count, 1)
                XCTAssertEqual(insuranceBeneficiaryList.flags?[0], "beneficiariesChangeAllowed")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdBeneficiariesUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.beneficiaries.update", xcTestCase: self)
        
        let expectation       = self.expectation(description: "Response expectation")
        
        let request           = UpdateInsuranceBeneficiariesRequest()
        request.beneficiaries = []
        
        var beneficiary        = InsuranceBeneficiary()
        beneficiary.type       = .person
        beneficiary.name       = "Mgr. Rudolf Mrazek"
        beneficiary.birthdate  = self.dateFormatter.date(from: "1978-01-18")
        beneficiary.percentage = 20
        request.beneficiaries?.append(beneficiary)
        
        beneficiary            = InsuranceBeneficiary()
        beneficiary.type       = .person
        beneficiary.name       = "Bielčik Tomáš"
        beneficiary.birthdate  = self.dateFormatter.date(from: "2003-09-10")
        beneficiary.percentage = 40
        request.beneficiaries?.append(beneficiary)
        
        beneficiary            = InsuranceBeneficiary()
        beneficiary.type       = .person
        beneficiary.name       = "Bielčiková Eliška"
        beneficiary.birthdate  = self.dateFormatter.date(from: "2008-06-09")
        beneficiary.percentage = 40
        request.beneficiaries?.append(beneficiary)
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").beneficiaries.update(request) { result in
            switch (result) {
            case .success(let updateInsuranceBeneficiaries):
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?.count, 3)
                
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[0].type.value, InsuranceBeneficiaryType.person.value)
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[0].name, "Mgr. Rudolf Mrazek")
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[0].birthdate, self.dateFormatter.date(from: "1978-01-18"))
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[0].percentage, 20)
                
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[1].type.value, InsuranceBeneficiaryType.person.value)
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[1].name, "Bielčik Tomáš")
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[1].birthdate, self.dateFormatter.date(from: "2003-09-10"))
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[1].percentage, 40)
                
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[2].type.value, InsuranceBeneficiaryType.person.value)
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[2].name, "Bielčiková Eliška")
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[2].birthdate, self.dateFormatter.date(from: "2008-06-09"))
                XCTAssertEqual(updateInsuranceBeneficiaries.beneficiaries?[2].percentage, 40)
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdInsureesList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.insurees.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").insurees.list() { result in
            switch (result) {
            case .success(let insureeList):
                let insurees: [InsureeResponse] = insureeList.items
                XCTAssertEqual(insurees.count, 1)
                
                XCTAssertEqual(insurees[0].id, "78afefe2d55e124cbd4a1bbfa1a1bbb0b1ec5bc8b434a2a17703ea6c6d597092")
                XCTAssertEqual(insurees[0].type, "POLICYHOLDER")
                XCTAssertEqual(insurees[0].name, "Hana Bielčíková")
                
                XCTAssertEqual(insurees[0].addresses.count, 1)
                XCTAssertEqual(insurees[0].addresses[0].type.value, ContactAddressType.permanentResidence.value)
                XCTAssertEqual(insurees[0].addresses[0].country, "CZ")
                XCTAssertEqual(insurees[0].addresses[0].city, "STARÉ SMRKOVICE")
                XCTAssertEqual(insurees[0].addresses[0].street, "Staré Smrkovice 6")
                XCTAssertEqual(insurees[0].addresses[0].zipCode, "508 01")
                
                XCTAssertEqual(insurees[0].birthNumber, "8152152602")
                
                XCTAssertEqual(insurees[0].risks?.count, 2)
                
                XCTAssertEqual(insurees[0].risks?[0].productName, "Pojištění smrti následkem úrazu")
                XCTAssertEqual(insurees[0].risks?[0].riskGroup, "Úmrtí")
                XCTAssertEqual(insurees[0].risks?[0].insuredSum?.value, 15000000)
                XCTAssertEqual(insurees[0].risks?[0].insuredSum?.precision, 2)
                XCTAssertEqual(insurees[0].risks?[0].insuredSum?.currency, "CZK")
                
                XCTAssertEqual(insurees[0].risks?[1].productName, "Základní pojištění smrti z jakýchkoliv příčin")
                XCTAssertEqual(insurees[0].risks?[1].riskGroup, "Úmrtí")
                XCTAssertEqual(insurees[0].risks?[1].insuredSum?.value, 1000000)
                XCTAssertEqual(insurees[0].risks?[1].insuredSum?.precision, 2)
                XCTAssertEqual(insurees[0].risks?[1].insuredSum?.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdPaymentsList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.payments.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").payments.list() { result in
            switch (result) {
            case .success(let contractPaymentList):
                guard let payments: [ContractPayment] = contractPaymentList.payments else {
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(payments.count, 2)
                
                XCTAssertEqual(payments[0].id, "33")
                XCTAssertEqual(payments[0].type.value, PaymentType.future.value)
                
                XCTAssertEqual(payments[0].amount.value, 0)
                XCTAssertEqual(payments[0].amount.precision, 2)
                XCTAssertEqual(payments[0].amount.currency, "CZK")
                
                XCTAssertEqual(payments[0].restToPay?.value, 60000)
                XCTAssertEqual(payments[0].restToPay?.precision, 2)
                XCTAssertEqual(payments[0].restToPay?.currency, "CZK")
                
                XCTAssertEqual(payments[0].instruction?.value, 60000)
                XCTAssertEqual(payments[0].instruction?.precision, 2)
                XCTAssertEqual(payments[0].instruction?.currency, "CZK")
                
                XCTAssertEqual(payments[0].instructionFrom, self.dateFormatter.date(from: "2016-09-01"))
                XCTAssertEqual(payments[0].instructionTo, self.dateFormatter.date(from: "2016-09-30"))
                
                XCTAssertEqual(payments[1].id, "32")
                XCTAssertEqual(payments[1].type.value, PaymentType.overdue.value)
                
                XCTAssertEqual(payments[1].amount.value, 0)
                XCTAssertEqual(payments[1].amount.precision, 2)
                XCTAssertEqual(payments[1].amount.currency, "CZK")
                
                XCTAssertEqual(payments[1].restToPay?.value, 60000)
                XCTAssertEqual(payments[1].restToPay?.precision, 2)
                XCTAssertEqual(payments[1].restToPay?.currency, "CZK")
                
                XCTAssertEqual(payments[1].instruction?.value, 60000)
                XCTAssertEqual(payments[1].instruction?.precision, 2)
                XCTAssertEqual(payments[1].instruction?.currency, "CZK")
                
                XCTAssertEqual(payments[1].instructionFrom, self.dateFormatter.date(from: "2016-08-01"))
                XCTAssertEqual(payments[1].instructionTo, self.dateFormatter.date(from: "2016-08-31"))
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdServicesList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.services.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").services.list() { result in
            switch (result) {
            case .success(let insuranceServiceList):
                let services: [InsuranceService] = insuranceServiceList.items
                XCTAssertEqual(services.count, 1)
                
                XCTAssertEqual(services[0].id, "1")
                XCTAssertEqual(services[0].group.value, InsuranceServiceGroup.riskSports.value)
                XCTAssertEqual(services[0].iconGroup, "RISK_SPORTS")
                XCTAssertEqual(services[0].availableDays, 30)
                XCTAssertEqual(services[0].state.value, InsuranceServiceState.inactive.value)
                XCTAssertEqual(services[0].nameI18N, "Rizikové sporty")
                XCTAssertEqual(services[0].descriptionI18N, "Zdarma pojištění libovolných 30 dnů v roce na aktivity jako horolezectví, bungee jumping, potápění nebo rafting. Stačí si jej aktivovat 2 hodiny před plánovanou aktivitou.")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdServicesActivateRiskSports()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.services.activateRiskSports", xcTestCase: self)
        
        let expectation       = self.expectation(description: "Response expectation")
        
        let request           = ActivateRiskSportsRequest()
        request.dateFrom      = self.dateFormatter.date(from: "2016-08-16")
        request.dateTo        = self.dateFormatter.date(from: "2016-08-20")
        request.phoneNumber   = "602123456"
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").services.activateRiskSports(request) { result in
            switch (result) {
            case .success(let activateRiskSportsResponse):
                XCTAssertEqual(activateRiskSportsResponse.policyNumber, "7009689942")
                XCTAssertEqual(activateRiskSportsResponse.dateFrom, self.dateFormatter.date(from: "2016-08-16"))
                XCTAssertEqual(activateRiskSportsResponse.dateTo, self.dateFormatter.date(from: "2016-08-20"))
                XCTAssertEqual(activateRiskSportsResponse.phoneNumber, "602123456")
                XCTAssertEqual(activateRiskSportsResponse.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }

    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdServicesDeactivateRiskSports()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.services.deactivateRiskSports", xcTestCase: self)
        
        let expectation       = self.expectation(description: "Response expectation")
        
        let request           = ActivateRiskSportsRequest()
        request.dateFrom      = self.dateFormatter.date(from: "2016-08-16")
        request.dateTo        = self.dateFormatter.date(from: "2016-08-20")
        request.phoneNumber   = "602123456"
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").services.deactivateRiskSports(request) { result in
            switch (result) {
            case .success(let deactivateRiskSportsResponse):
                XCTAssertEqual(deactivateRiskSportsResponse.signInfo?.state, "NONE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdEventsList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.events.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").events.list() { result in
            switch (result) {
            case .success(let insuranceEventsServiceList):
                let events: [ContractEvent] = insuranceEventsServiceList.items
                XCTAssertEqual(events.count, 1)
                
                XCTAssertEqual(events[0].number, "13344534534")
                XCTAssertEqual(events[0].creationDate, self.dateFormatter.date(from: "2015-02-28"))
                XCTAssertEqual(events[0].state.value, ContractEventState.closed.value)
                XCTAssertEqual(events[0].substate, "Odesláno pojistné plnění")
                XCTAssertEqual(events[0].substateDate, self.dateFormatter.date(from: "2015-10-14"))
                XCTAssertEqual(events[0].substateInfo, "odesláno pojistné plnění")
                
                XCTAssertEqual(events[0].amount.value, 1000000)
                XCTAssertEqual(events[0].amount.precision, 2)
                XCTAssertEqual(events[0].amount.currency, "CZK")
                
                XCTAssertEqual(events[0].processingDate, self.dateFormatter.date(from: "2015-03-02"))
                
                XCTAssertEqual(events[0].indemnities?.count, 1)
                XCTAssertEqual(events[0].indemnities?[0].paymentDate, self.dateFormatter.date(from: "2015-10-14"))
                XCTAssertEqual(events[0].indemnities?[0].transferMethod, "Prevod na ucet")
                XCTAssertEqual(events[0].indemnities?[0].receiverName, "Tonda Palecek")
                
                XCTAssertEqual(events[0].indemnities?[0].amount.value, 500000)
                XCTAssertEqual(events[0].indemnities?[0].amount.precision, 2)
                XCTAssertEqual(events[0].indemnities?[0].amount.currency, "CZK")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdTaxBenefitsGet()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.taxBenefits.get", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").taxBenefits.get() { result in
            switch (result) {
            case .success(let taxBenefits):
                XCTAssertEqual(taxBenefits.taxDeductiblePremium?.value, 29000)
                XCTAssertEqual(taxBenefits.taxDeductiblePremium?.precision, 2)
                XCTAssertEqual(taxBenefits.taxDeductiblePremium?.currency, "CZK")
                
                XCTAssertEqual(taxBenefits.recommendedDeposit?.value, 1190400)
                XCTAssertEqual(taxBenefits.recommendedDeposit?.precision, 2)
                XCTAssertEqual(taxBenefits.recommendedDeposit?.currency, "CZK")
                
                XCTAssertEqual(taxBenefits.recommendedDepositText, "za předpokladu doplacení 4 splátek po 600 Kč v roce 2016")
                
                XCTAssertEqual(taxBenefits.paymentTemplate?.symbols?.variableSymbol, "7909689942")
                
                XCTAssertEqual(taxBenefits.paymentTemplate?.receiver?.number, "1210230319")
                XCTAssertEqual(taxBenefits.paymentTemplate?.receiver?.bankCode, "0800")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdStrategiesList()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.strategies.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").strategies.list() { result in
            switch (result) {
            case .success(let insuranceStrategiesList):
                let strategies: [ContractStrategyResponse] = insuranceStrategiesList.items
                XCTAssertEqual(strategies.count, 1)
                
                XCTAssertEqual(strategies[0].type.value, ContractStrategyType.actualSetting.value)
                XCTAssertEqual(strategies[0].group.value, ContractStrategyGroup.strategy.value)
                
                XCTAssertEqual(strategies[0].funds.count, 1)
                XCTAssertEqual(strategies[0].funds[0].code, "5")
                XCTAssertEqual(strategies[0].funds[0].name, "PČS fond akciový")
                XCTAssertEqual(strategies[0].funds[0].share, 0)
                XCTAssertEqual(strategies[0].funds[0].changeType, "EDITABLE")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testContractsInsurancesWithIdTransferUpdate()
    {
        self.judgeSession.setNextCase( caseId: "contracts.insurances.withId.transfer.update", xcTestCase: self)
        
        let expectation           = self.expectation(description: "Response expectation")
        
        let request               = UpdateContractTrasferRequest()
        request.type              = .payPremium
        
        request.amount            = Amount()
        request.amount?.value     = 1500
        request.amount?.precision = 2
        request.amount?.currency  = "CZK"
        
        request.sender            = AccountNumber()
        request.sender?.number    = "2723000003"
        request.sender?.bankCode  = "0800"
        
        self.client.contracts.insurances.withId("3961D3F9E922EEE93E2581E896B34566645FE7E3").transfer.update(request) { result in
            switch (result) {
            case .success(let updateContractTrasferResponse):
                XCTAssertEqual(updateContractTrasferResponse.signInfo?.state, "OPEN")
                XCTAssertEqual(updateContractTrasferResponse.signInfo?.signId, "160815138818340")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            
        }
        
        self.waitForExpectations(timeout: 40.0, handler:nil)
    }
}
