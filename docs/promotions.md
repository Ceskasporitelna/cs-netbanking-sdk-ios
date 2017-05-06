# Promotions

This guide walks you through retrieving promotions.

[PromotionsResource](../CSNetbankingSDK/PromotionsResource.swift)

```swift
// Get PromotionsResource Instance
    let promotionsResource = netbankingClient.promotions
```

## 1\. List all promotions for user

You can list all promotions by calling the `list` method on [PromotionsResource](../CSNetbankingSDK/PromotionsResource.swift).

```swift
// List all promotions
    netbankingClient.promotions
        .list(callback: {
            promotions: CoreResult<ListResponse<Promotion>> in
            //Do something with retrieved promotions
        });
```

## 2\. Hide promotion

Hide promotion by getting the [PromotionsResource](../CSNetbankingSDK/PromotionsResource.swift) and then calling the `create` method. The create method takes object with properties as a parameter. See [CreatePromotionRequest](../CSNetbankingSDK/CreatePromotionRequest.swift) for all supported parameters and [CreatePromotionResponse](../CSNetbankingSDK/CreatePromotionResponse.swift) for full response.

```swift
// Hide promotion
    netbankingClient.promotions
            .create(request, callback: {
                createdPromotion: CoreResult<CreatePromotionResponse> in
                //This promotion should be hidden from now on
            });
```
