# Cards

This guide walks you through retrieving current user's cards and information like limits, transactions, transfers etc. You can also issue card's actions or updating or adding and marking a transaction.

[CardsResource](../CSNetbankingSDK/CardsResource.swift)

```swift
// Get CardsResource Instance
    netbankingClient.cards
```

## 1\. List all of current users cards

You can list all of current users cards by calling the `list` method on [CardsResource](../CSNetbankingSDK/CardsResource.swift). The method takes object with properties such as pageSize or sortBy as a parameter. See all supported parameters in [CardsParameters](../CSNetbankingSDK/CardsParameters.swift). For full response see [Card](../CSNetbankingSDK/Card.swift).

```swift
// List all cards
    netbankingClient.cards
        .list(parameters, callback: {
            cards: CoreResult<PaginatedListResponse<Card>> in
            //Do something with cards
        });
```

## 2\. Get card detail

You can get detail of the individual card by calling the `withId` method on [CardsResource](../CSNetbankingSDK/CardsResource.swift) with id as a parameter and then calling the `get` method. For full response see [Card](../CSNetbankingSDK/Card.swift).

```swift
// Card detail
    netbankingClient.cards
        .withId(id)
        .get(callback: {
            card: CoreResult<Card> in
        });
```

## 3\. Update cards settings

Update cards settings by getting the [CardsResource](../CSNetbankingSDK/CardsResource.swift) and then calling the `update` method on it. The method takes object with properties as a parameter. Currently only alias can be changed. For all supported parameters see [ChangeCardSettingsRequest](../CSNetbankingSDK/ChangeCardSettingsRequest.swift) and [ChangeCardSettingsResponse](../CSNetbankingSDK/ChangeCardSettingsResponse.swift) for full response.

```swift
// Update card
    netbankingClient.cards
        .withId(id)
        .update(request, callback: {
            updatedCard: CoreResult<ChangeCardSettingsResponse> in
            //Do something with updated card
        });
```

## 4\. Get cards delivery information

Get cards delivery by getting the [CardDeliveryResource](../CSNetbankingSDK/CardDeliveryResource.swift) and then calling the `get` method. For full response see [DeliveryListing](../CSNetbankingSDK/DeliveryListing.swift).

```swift
// Card delivery info
    netbankingClient.cards
        .withId(id)
        .delivery
        .get(callback: {
            delivery: CoreResult<DeliveryListing> in
            //Do something with delivery information
        });
```

## 5\. Add or change note and mark transaction

Add or change note and mark transaction by getting the [CardTransactionResource](../CSNetbankingSDK/CardTransactionResource.swift) and calling the `update` method on it. The method takes object with properties as a parameter. See all supported parameters in [AddNoteAndMarkTransactionRequest](../CSNetbankingSDK/AddNoteAndMarkTransactionRequest.swift) and [AddNoteAndMarkCardTransactionResponse](../CSNetbankingSDK/AddNoteAndMarkCardTransactionResponse.swift) for full response.

```swift
// Card transaction update
    netbankingClient.cards
        .withId(cardId)
        .transactions
        .withId(transactionId)
        .update(request, callback: {
            updatedTransaction: CoreResult<AddNoteAndMarkCardTransactionResponse> in
            //Do something with updated transaction
        });
```

## 6\. Export transaction history

Extract transaction history into signed PDF by getting the [CardTransactionsResource](../CSNetbankingSDK/CardTransactionsResource.swift) and calling the `export` method on it. The method takes object with properties as a parameter. See all supported parameters in [ExportTransactionsParameters](../CSNetbankingSDK/ExportTransactionsParameters.swift).

```swift
// Card transaction export
    netbankingClient.cards
        .withId(id)
        .transactions
        .export(parameters, callback: {
            exportedTransactions: CoreResult<String> in
            //Do something with exported transactions
        });
```

## 7\. Issue cards action

Issue cards action by getting the [CardActionsResource](../CSNetbankingSDK/CardActionsResource.swift) and calling the `update` method on it. Currently supported actions are reissue pin, lock card, unlock card, activate card, set automatic card replacement on, set automatic card replacement off and replacement card request. Possibility to issue action is controlled by flags and features on particular card:

- reissue pin - reissuePin feature
- lock card - onlineLocking feature
- unlock card - onlineUnlocking feature
- activate card - activationAllowed flag
- set automatic card replacement on - if automaticReplacementOn flag is not present
- set automatic card replacement off - if automaticReplacementOn flag is present
- replace card - replacementCard feature

For supported parameters see [CardActionRequest](../CSNetbankingSDK/CardActionRequest.swift) and [CardActionResponse](../CSNetbankingSDK/CardActionResponse.swift) for full response.

```swift
// Issue cards action update
    netbankingClient.cards
        .withId(id)
        .actions
        .update(request, callback: {
            updatedCard: CoreResult<CardActionResponse> in
            //Do something with action performed on the card
        });
```

## 8\. Get cards limits

Get cards limits by getting the [CardLimitsResource](../CSNetbankingSDK/CardLimitsResource.swift) and then calling the `list` method. For full response see [CardLimits](../CSNetbankingSDK/CardLimits.swift).

```swift
// Card limits
    netbankingClient.cards
        .withId(id)
        .limits
        .list(callback: {
            limits: CoreResult<ListResponse<CardLimits>> in
            //Do something with retrieved limits
        });
```

## 9\. Update cards limits

Update cards limits by getting the [CardLimitsResource](../CSNetbankingSDK/CardLimitsResource.swift) and then calling the `update` method. The method takes object with properties as a parameter. See all supported parameters in [ChangeCardLimitsRequest](../CSNetbankingSDK/ChangeCardLimitsRequest.swift) and [ChangeCardLimitsResponse](../CSNetbankingSDK/ChangeCardLimitsResponse.swift) for full response.

```swift
// Card limits update
    netbankingClient.cards
        .withId(id)
        .limits
        .update(request, callback: {
            updatedLimit: CoreResult<ChangeCardsLimitsResponse> in
            //Do something with updated limit
        });
```

## 10\. Get cards 3D Secure status

Get cards 3D Secure status by getting the [CardSecure3DResource](../CSNetbankingSDK/CardSecure3DResource.swift) and then calling the `get` method. See [SecureSettings](../CSNetbankingSDK/SecureSettings.swift) for full response.

```swift
// Card 3D secure status 
    netbankingClient.cards
        .withId(id)
        .secure3D
        .get(callback: {
            secureStatus: CoreResult<SecureSettings> in
            //Do something with retrieved secure 3D status
        });
```

## 11\. Pay up credit card debt

Pay up credit card debt by getting the [CardTransferResource](../CSNetbankingSDK/CardTransferResource.swift) and then calling the `update` method. The method takes object with properties as a parameter. See [PayUpCreditCardRequest](../CSNetbankingSDK/PayUpCreditCardRequest.swift) for supported parameters and [PayUpCreditCardResponse](../CSNetbankingSDK/PayUpCreditCardResponse.swift) for full response.

```swift
// Card debt payment
    netbankingClient.cards
        .withId(id)
        .transfer
        .update(request, callback: {
            payupTransfer: CoreResult<PayUpCreditCardResponse> in
            //Do something with pay up transfer (e.g. celebrate!)
        });
```

## 12\. Work with accounts of specific credit card

You get to the card's accounts by getting the [AccountsResource](../CSNetbankingSDK/AccountsResource.swift).

Read more about working with accounts in [Accounts docs](./accounts.md).
