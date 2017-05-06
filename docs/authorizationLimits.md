# Authorization Limits

This guide walks you through retrieving current user's authorization limits.

[AuthorizationLimitsResource](../CSNetbankingSDK/AuthorizationLimitsResource.swift)

```swift
// Get AuthorizationLimitsResource Instance
    let authorizationLimitsResource = netbankingClient.authorizationLimits
```

## 1\. List all of current users authorization limits

You can list all of current users authorization limits by calling the `list` method on [AuthorizationLimitsResource](../CSNetbankingSDK/AuthorizationLimitsResource.swift). The method takes object with properties such as pageSize or sortBy as a parameter. See all parameters in [AuthorizationLimitsParameters](../CSNetbankingSDK/AuthorizationLimitsParameters.swift).

```swift
// List all authorization limits
    netbankingClient.authorizationLimits
        .list(parameters, callback: {
            limits: CoreResult<ListResponse<AuthorizationLimit>> in
            //Do something with the limits
        });
```

## 2\. Get individual current users authorization limit

You can get detail of the individual current users authorization limit by calling the `withId` method on [AuthorizationLimitsResource](../CSNetbankingSDK/AuthorizationLimitsResource.swift) with id as a parameter and then calling the get method. For complete response see [AuthorizationLimit](../CSNetbankingSDK/AuthorizationLimit.swift).

```swift
// Get authorization limit
    netbankingClient.authorizationLimits
        .withId(id)
        .get(callback: {
            limit: CoreResult<AuthorizationLimit> in
            //Do something with retrieved limit
        });
```
