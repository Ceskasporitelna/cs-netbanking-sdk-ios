# Accounts

This guide walks you through retrieving current user's accounts detail and other information like account's services, transactions, repayments etc. There are also actions like changing account's settings or changing and adding note to transaction. Finally you can export transactions or download statements.

[AccountsResource](../CSNetbankingSDK/AccountsResource.swift)

```swift
// Get AccountsResource Instance
    let accountsResource = netbankingClient.accounts
```

## 1\. List all of current users accounts

You can list all of current users accounts by calling the `list` method on [AccountsResource](../CSNetbankingSDK/AccountsResource.swift). The method takes object with properties such as pageSize or sortBy as a parameter. See all parameters in [AccountsParameters](../CSNetbankingSDK/AccountsParameters.swift).

```swift
// List all accounts
    netbankingClient.accounts
        .list(accountsParameters, callback: {
            accounts in
            //Do something with accounts
        });
```

## 2\. Get individual current users account

You can get detail of the individual current users account by calling the `withId` method on [AccountsResource](../CSNetbankingSDK/AccountsResource.swift) with id as a parameter and then calling the get method. For complete response see [AccountResource](../CSNetbankingSDK/AccountResource.swift).

```swift
// Account detail
    netbankingClient.accounts
        .withId(id)
        .get({
            accountDetail in
            //Do something with account detail
        });
```

## 3\. Update current users account

You can update current users account by calling the `withId` method on [AccountsResource](../CSNetbankingSDK/AccountsResource.swift) with id as a parameter and then calling the update method and giving it payload in object as a parameter. Currently only alias can be changed. For payload properties please see [ChangeAccountSettingsRequest](../CSNetbankingSDK/ChangeAccountSettingsRequest.swift) and check also the response [ChangeAccountSettingsResponse](../CSNetbankingSDK/ChangeAccountSettingsResponse.swift).

```swift
// Account update
    netbankingClient.accounts
        .withId(id)
        .update(request, callback: {
            account in
            //Do something with updated account
        });
```

## 4\. Get accounts balances

Get accounts balances by getting the [AccountBalanceResource](../CSNetbankingSDK/AccountBalanceResource.swift) and then calling the `get` method. For complete response see [AccountBalanceResponse](../CSNetbankingSDK/AccountBalanceResponse.swift)

```swift
// Account balance
    netbankingClient.accounts
            .withId(id)
            .balance
            .get({
                balance in
                //Do something with the balance
            });
```

## 5\. List accounts services

List accounts services by getting the [AccountServicesResource](../CSNetbankingSDK/AccountServicesResource.swift) and then calling the `list` method. The method takes object with properties as a parameter. Services resource supports pagination.

```swift
// Account services
    netbankingClient.accounts
            .withId(id)
            .services
            .list(parameters, callback: {
                services in
                //Do something with available services
            });
```

## 6\. Add or change note and mark transaction

Add, change or mark transaction by calling the `update` method on [AccountTransactionResource](../CSNetbankingSDK/AccountTransactionResource.swift) and passing it object with options as a parameter. For payload properties please see [AddNoteAndMarkTransactionRequest](../CSNetbankingSDK/AddNoteAndMarkTransactionRequest.swift) and check also the response [AddNoteAndMarkTransactionResponse](../CSNetbankingSDK/AddNoteAndMarkTransactionResponse.swift).

```swift
// Account transaction update
    netbankingClient.accounts
            .withId(id)
            .transactions
            .withId(Object id)
            .update(request, callback: {
                transaction: CoreResult<AddNoteAndMarkTransactionResponse> in
                //Do somenthing with created / updated transaction
            });
```

## 7\. Export transactions history

Export transaction history into signed PDF by calling the `export` method on [AccountTransactionsResource](../CSNetbankingSDK/AccountTransactionsResource.swift) and passing it object with options as a parameter. See [ExportTransactionsParameters](../CSNetbankingSDK/ExportTransactionsParameters.swift).

```swift
// Account transactions history
    netbankingClient.accounts
            .withId(id)
            .transactions
            .export(parameters, callback:{
                history: CoreResult<String> in
                //Do something with exported history
            });
```

## 8\. List accounts reservations

List accounts reservations by getting the [AccountReservationsResource](../CSNetbankingSDK/AccountReservationsResource.swift) and then calling the `list` method. The method takes object with properties as a parameter and supports pagination. See [ReservationResponse](../CSNetbankingSDK/ReservationResponse.swift) for full response.

```swift
// Account reservations
    netbankingClient.accounts
            .withId(id)
            .reservations
            .list(parameters, callback: {
                reservations: CoreResult<PaginatedListResponse<ReservationResponse>> in
                //Do something with reservations
            });
```

## 9\. Revolve loan disbursement

Revolve loan disbursement by getting the [AccountTransferResource](../CSNetbankingSDK/AccountTransferResource.swift) and then calling the `update` method on it. The method takes object with properties as a parameter. See all supported properties in [AccountTransferRequest](../CSNetbankingSDK/AccountTransferRequest.swift) and [AccountTransferResponse](../CSNetbankingSDK/AccountTransferResponse.swift) for full response.

```swift
// Account loan disbursement revolving
    netbankingClient.accounts
            .withId(id)
            .transfer
            .update(request, callback:{
                accountTransfer: CoreResult<AccountTransferResponse> in
                //Do something with transfered account
            });
```

## 10\. List accounts repayments

List accounts repayments by getting the [AccountRepaymentsResource](../CSNetbankingSDK/AccountRepaymentsResource.swift) and then calling the `list` method. For full response see [RepaymentResponse](../CSNetbankingSDK/RepaymentResponse.swift).

```swift
// Account repayments
    netbankingClient.accounts
            .withId(id)
            .repayments
            .list(callback: {
                repayments: CoreResult<ListResponse<RepaymentResponse>> in
                //Do something with repayments
            });
```

## 11\. List accounts statements

List accounts statements by getting the [AccountStatementsResource](../CSNetbankingSDK/AccountStatementsResource.swift) and then calling the `list` method. The method takes object with properties such as pageSize or sortBy as a parameter. See all supported parameters in [StatementsParameters](../CSNetbankingSDK/StatementsParameters.swift). For full response see [StatementResponse](../CSNetbankingSDK/StatementResponse.swift).

```swift
// Account statements
    netbankingClient.accounts
            .withId(id)
            .statements
            .list(parameters, callback: {
                statements: CoreResult<PaginatedListResponse<StatementResponse>> in
                //Do something with statements
            });
```

## 12\. Download accounts statements

Download accounts statement by getting the [AccountStatementsResource](../CSNetbankingSDK/AccountStatementsResource.swift) and then calling the `download` method on it. The method takes object with properties as a parameter. For all supported parameters see [DownloadStatementsParameters](../CSNetbankingSDK/DownloadStatementsParameters.swift).

```swift
// Download account statements
    netbankingClient.accounts
            .withId(id)
            .getStatementsResource()
            .download(parameters, callback: {
                statements: CoreResult<String> in
                //Do something with downloaded statements
            });
```

## 13\. List sub account statements

List sub accounts statements by getting the [SubAccountResource](../CSNetbankingSDK/StatementsResource.swift) and then calling the `list` method on it. The list method takes object with properties as a parameter. See all supported parameters in [ListParameters](../CSNetbankingSDK/Parameters.swift). For full response see [StatementResponse](../CSNetbankingSDK/StatementResponse.swift).

```swift
// Sub account statements
    netbankingClient.accounts
            .withId(Object id)
            .subAccounts
            .withId(Object id)
            .statements
            .list(parameters, callback:{
                statements: CoreResult<PaginatedListResponse<StatementResponse>> in
                //Do something with statements
            });
```

## 14\. Download sub account statements

Download sub accounts statement by getting the [StatementsResource](../CSNetbankingSDK/StatementsResource.swift) and then calling the `download` method on it. The method takes object with properties as a parameter. For all supported parameters see [DownloadStatementsParameters](../CSNetbankingSDK/DownloadStatementsParameters.swift).

```swift
// Download sub account statements
    netbankingClient.accounts
            .withId(Object id)
            .subAccounts
            .withId(Object id)
            .statements
            .download(parameters, callback: {
                statements: CoreResult<String> in
                //Do something with downloaded statements
            });
```

## 15\. List accounts direct debits

List accounts direct debits by getting the [AccountDirectDebitsResource](../CSNetbankingSDK/AccountDirectDebitsResource.swift) and then calling the `list` method on it. The list method takes object with properties as a parameter. See all supported parameters in [DirectDebitsParameters](../CSNetbankingSDK/DirectDebitsParameters.swift). For full response see [DirectDebitsListResponse](../CSNetbankingSDK/DirectDebitsListResponse.swift).

```swift
// List all direct debits
    Netbanking.getInstance().getNetbankingClient().getAccountsResource()
            .withId(Object id)
            .getDirectDebitsResource()
            .list(DirectDebitsParameters parameters, CallbackWebApi<DirectDebitsListResponse> callback);
```

## 16\. Create direct debit

Create direct debit by getting the [AccountDirectDebitsResource](../CSNetbankingSDK/AccountDirectDebitsResource.swift) and then calling the `create` method. The create method takes object with properties as a parameter. See [DirectDebit](../CSNetbankingSDK/DirectDebit.swift) for all supported parameters and [SignableDirectDebit](../CSNetbankingSDK/SignableDirectDebit.swift) for full response.

```swift
// Create direct debit
    netbankingClient.accounts
            .withId(Object id)
            .directDebits
            .create(request, callback: {
                debit: CoreResult<SignableDirectDebit> in
                //Do something with debit, i.e. sign it
            });
```

## 17\. Get direct debit

You can get detail of the direct debit by calling the `withId` method on [AccountDirectDebitsResource](../CSNetbankingSDK/AccountDirectDebitsResource.swift) with id as a parameter and then calling the get method. For complete response see [DirectDebit](../CSNetbankingSDK/DirectDebit.swift).

```swift
// Get direct debit
    Netbanking.getInstance().getNetbankingClient().getAccountsResource()
            .withId(accountId)
            .directDebits
            .withId(debitId)
            .get(callback: {
                debit: CoreResult<DirectDebit> in
                //Do something with debit details
            });
```

## 18\. Delete direct debit

Delete direct debit by getting the [AccountDirectDebitResource](../CSNetbankingSDK/AccountDirectDebitResource.swift) and then calling the `delete` method.

```swift
// Delete direct debit
    netbankingClient.accounts
            .withId(accountId)
            .directDebits
            .withId(debitId)
            .delete(callback: {
                debit: CoreResult<SignableDirectDebit> in
                //Do something with deleted debit (if there's anything left to do with it)
            });
```

## 19\. List standing orders

List accounts standing orders by getting the [AccountStandingOrdersResource](../CSNetbankingSDK/AccountStandingOrdersResource.swift) and then calling the `list` method on it. The list method takes object with properties as a parameter. See all supported parameters in [StandingOrdersParameters](../CSNetbankingSDK/StandingOrdersParameters.swift). For full response see [StandingOrdersListResponse](../CSNetbankingSDK/StandingOrdersListResponse.swift).

```swift
// List standing orders
    Netbanking.getInstance().getNetbankingClient().getAccountsResource()
            .withId(Object id)
            .getStandingOrdersResource()
            .list(StandingOrdersParameters parameters, CallbackWebApi<StandingOrdersListResponse> callback);
```

## 20\. Create standing orders

Create standing order by getting the [AccountStandingOrdersResource](../CSNetbankingSDK/AccountStandingOrdersResource.swift) and then calling the `create` method. The create method takes object with properties as a parameter. See [CreateStandingOrderRequest](../CSNetbankingSDK/CreateStandingOrderRequest.swift) for all supported parameters and [StandingOrderResponse](../CSNetbankingSDK/StandingOrderResponse.swift) for full response.

```swift
// Create standing order
    netbankingClient.accounts
            .withId(id)
            .standingOrders
            .create(request, callback:{
                createdOrder: CoreResult<StandingOrderResponse> in
                //Do something with created order
            });
```

## 21\. Get standing orders

You can get detail of the standing order by calling the `withId` method on [AccountStandingOrdersResource](../CSNetbankingSDK/AccountStandingOrdersResource.swift) with id as a parameter and then calling the get method. For complete response see [StandingOrder](../CSNetbankingSDK/StandingOrder.swift).

```swift
// Get standing order
    netbankingClient.accounts
            .withId(accountId)
            .standingOrders
            .withId(orderId)
            .get(callback: {
                order: CoreResult<StandingOrder> in
                //Do something with standing order
            });
```

## 22\. Delete standing orders

Delete direct debit by getting the [AccountStandingOrderResource](../CSNetbankingSDK/AccountStandingOrderResource.swift) and then calling the `delete` method.

```swift
// Delete standing order 
    netbankingClient.accounts
            .withId(accountId)
            .standingOrders
            .withId(orderId)
            .delete(callback: {
                order: CoreResult<StandingOrderResponse> in
                //Do something with deleted order
            });
```
