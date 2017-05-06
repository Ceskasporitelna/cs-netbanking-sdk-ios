# Securities

This guide walks you through retrieving securities.

[SecuritiesResource](../CSNetbankingSDK/SecuritiesResource.swift)

```swift
// Get SecuritiesResource Instance
    let securitiesResource = netbankingClient.securities
```

## 1\. List all securities accounts

You can list all securities by calling the `list` method on [SecuritiesResource](../CSNetbankingSDK/SecuritiesResource.swift).

```swift
// List all securities
    netbankingClient.securities
        .list(parameters, callback: {
            securities: CoreResult<PaginatedListResponse<Security>> in
            //Do something with retrieved securities
        });
```

## 2\. Get security account detail

Get security detail by calling the `withId` method on [SecuritiesResource](../CSNetbankingSDK/SecuritiesResource.swift) and then calling the get method. See [Security](../CSNetbankingSDK/Security.swift) for full response.

```swift
// Security detail
    netbankingClient.securities
        .withId(id)
        .get(callback: {
            security detail: CoreResult<Security>
            //Do something with retrieved security detail
        });
```

## 3\. Change Securities Account Settings

Update security by getting the [SecuritiesResource](../CSNetbankingSDK/SecuritiesResource.swift) and then calling the `update` method on it. The method takes object with properties as a parameter. Currently only alias can be changed. For all supported parameters see [SecurityRequest](../CSNetbankingSDK/SecurityRequest.swift) and [SecurityResponse](../CSNetbankingSDK/SecurityResponse.swift) for full response.

```swift
// Update security
    netbankingClient.securities
        .withId(Object id)
        .update(request, callback:{
            updatedSecuriry: CoreResult<SecurityResponse> in
            //Do something with updated security
        });
```

## 4\. Add or change note and mark securities transactions

Add or change note and mark security transaction by getting the [SecurityTransactionResource](../CSNetbankingSDK/SecurityTransactionResource.swift) and calling the `update` method on it. The method takes object with properties as a parameter. See all supported parameters in [TransactionUpdateRequest](../CSNetbankingSDK/TransactionUpdateRequest.swift) and [TransactionUpdateResponse](../CSNetbankingSDK/TransactionUpdateResponse.swift) for full response.

```swift
// Securities transaction update
    netbankingClient.securities
        .withId(securityId)
        .transactions
        .withId(transactionId)
        .update(request, callback: {
            changedTransaction: CoreResult<SecurityTransactionResponse> in
            //Do something with updated transaction
        });
```

## 5\. Export securities transactions history

Extract transaction history into signed PDF by getting the [SecurityTransactionResource](../CSNetbankingSDK/SecurityTransactionResource.swift) and calling the `export` method on it. The method takes object with properties as a parameter. See all supported parameters in [ExportTransactionsParameters](../CSNetbankingSDK/ExportTransactionsParameters.swift).

```swift
// Securities transaction export
    netbankingClient.securities
        .withId(id)
        .transactions
        .export(ExportTransactionsParameters parameters, callback: {
            export: CoreResult<String> in
            //Do something with exported transactions
        });
```
