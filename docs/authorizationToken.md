# Authorization Token

This guide shows how to invalidate authorization token.

[AuthorizationTokenResource](../CSNetbankingSDK/AuthorizationTokenResource.swift)

```swift
// Get AuthorizationTokenResource Instance
    let authorizationTokenResource = netbankingClient.authorizationToken
```

## 1\. Invalidate authorization token

You can invalidate authorization token by calling the `delete` method on [AuthorizationTokenResource](../CSNetbankingSDK/AuthorizationTokenResource.swift).

```swift
// Invalidate authorization token
    netbankingClient.authorizationToken
        .invalidate(callback: {
            empty: CoreResult<NetbankingEmptyResponse> in
            //Do whatever you want as you are sure now token is invalidated
        });
```
