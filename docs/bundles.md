# Bundles

This guide walks you through creating current user's accounts bundles. Bundle represents set of payment orders which can be signed at once.

[BundlesResource](../CSNetbankingSDK/BundlesResource.swift)

```swift
// Get BundlesResource Instance
    let bundlesResource = netbankingClient.bundles
```

## 1\. Create bundle

Create bundle by getting the [BundlesResource](../CSNetbankingSDK/BundlesResource.swift) and then calling the `create` method. The create method takes object with properties as a parameter. See [BundleCreateRequest](../CSNetbankingSDK/BundleCreateRequest.swift) for all supported parameters and [BundleResponse](../CSNetbankingSDK/BundleResponse.swift) for full response.

```swift
// Create bundle
    netbankingClient.bundles
        .create(request, callback: {
            createdBundle: CoreResult<BundleResponse> in
            //Do something with created bundle
        });
```
