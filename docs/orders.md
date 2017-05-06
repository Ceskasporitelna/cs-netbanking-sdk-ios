# Orders

This guide walks you through listing all payments, getting payment's detail, deleting payment, listing limits and retrieving current available booking date. You can also create and update domestic payment or recharge credit on prepaid cards.

[OrdersResource](../CSNetbankingSDK/OrdersResource.swift)

```swift
// Get OrdersResource Instance
    let ordersResource = netbankingClient.orders
```

## 1\. List all payment orders

List all payment orders by calling the `list` method on [PaymentsResource](../CSNetbankingSDK/PaymentsResource.swift). The method takes object with properties such as pageSize or sortBy as a parameter. See all supported parameters in [PaymentsParameters](../CSNetbankingSDK/PaymentsParameters.swift). For full response see [Payment](../CSNetbankingSDK/Payment.swift).

```swift
// List all payments
    netbankingClient.orders
        .payments
        .list(parameters, callback: {
            payments: CoreResult<PaginatedListResponse<Payment>> in
            //Do something with retrieved payments
        });
```

## 2\. Get payments detail

Get payments detail by calling the `withId` method on [PaymentsResource](../CSNetbankingSDK/PaymentsResource.swift) and then calling the get method. See [Payment](../CSNetbankingSDK/Payment.swift) for full response.

```swift
// Payment detail
    netbankingClient.orders
        .payments
        .withId(id)
        .get(callback: {
            payment: CoreResult<Payment> in
            //Do something with retrieved payments
        });
```

## 3\. Delete payment

Delete payment by getting the [PaymentResource](../CSNetbankingSDK/PaymentResource.swift) and then calling the `delete` method.

```swift
// Delete payment
    netbankingClient.orders
        .payments
        .withId(id)
        .delete(callback: {
            empty: CoreResult<NetbankingEmptyResponse> in
            //Payment gets deleted; nothing goes in
        });
```

## 4\. Create domestic payment

Create domestic payment by getting the [PaymentsDomesticResource](../CSNetbankingSDK/PaymentsDomesticResource.swift) and then calling the `create` method. The create method takes object with properties as a parameter. See [DomesticPaymentCreateRequest](../CSNetbankingSDK/DomesticPaymentCreateRequest.swift) for all supported parameters and [DomesticPaymentResponse](../CSNetbankingSDK/DomesticPaymentResponse.swift) for full response.

```swift
// Domestic payment
    netbankingClient.orders
        .payments
        .domestic
        .create(request, callback: {
            createdPayment: CoreResult<DomesticPaymentResponse> in
            //Do something with created domestic payment
        });
```

## 5\. Update domestic payment

Create domestic payment by getting the [PaymentsDomesticResource](../CSNetbankingSDK/PaymentsDomesticResource.swift) and then calling the `create` method. The create method takes object with properties as a parameter. See [FullDomesticPaymentUpdateRequest](../CSNetbankingSDK/FullDomesticPaymentUpdateRequest.swift) for all supported parameters and [DomesticPaymentResponse](../CSNetbankingSDK/DomesticPaymentResponse.swift) for full response.

```swift
// Update domestic payment
    netbankingClient.orders
        .payments
        .domestic
        .withId(id)
        .update(request, callback: {
            updatedPayment: CoreResult<DomesticPaymentResponse> in
            //Do something with updated payment
        });
```

## 6\. Get remaining amounts for payments

Get remaining amounts for payment orders by getting the [PaymentLimitsResource](../CSNetbankingSDK/PaymentLimitsResource.swift) resource and then calling the `list` method.

```swift
// Payment limits
    netbankingClient.orders
        .payments
        .limits
        .list(callback: {
            limits: CoreResultt<ListResponse<PaymentLimit>> in
            //Do something with retrieved limits
        });
```

## 7\. Recharge the credit on prepaid card

Recharge the credit on prepaid card by getting the [PaymentMobileResource](../CSNetbankingSDK/PaymentMobileResource.swift) and calling the `create` method. The create method takes object with properties as a parameter. See [MobilePaymentsRequest](../CSNetbankingSDK/MobilePaymentsRequest.swift) for all supported parameters and [MobilePaymentsResponse](../CSNetbankingSDK/MobilePaymentsResponse.swift) for full response.

```swift
// Mobile payment
    netbankingClient.orders
        .payments
        .mobile
        .create(request, callback: {
            createdRecharge: CoreResult<MobilePaymentsResponse> in
            //Do something with created mobile recharge
        });
```

## 8\. Update booking dates

Update current available booking sates by getting the [PaymentBookingDateResource](../CSNetbankingSDK/PaymentBookingDateResource.swift) and calling `update` method. See [PaymentBookingDateRequest](../CSNetbankingSDK/PaymentBookingDateRequest.swift) for all supported parameters and [PaymentBookingDateResponse](../CSNetbankingSDK/PaymentBookingDateResponse.swift) for full response.

```swift
// Booking dates
    netbankingClient.orders
        .payments
        .bookingDate
        .update(request, callback: {
            dateUpdate: CoreResult<PaymentBookingDateResponse> in
            //Do stuff with changed date
        });
```
