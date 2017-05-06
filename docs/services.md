# Services

This guide walks you through retrieving services.

[ServicesResource](../CSNetbankingSDK/ServicesResource.swift)

```swift
// Get ServicesResource Instance
    let servicesResource = netbankingClient.services
```

## 1\. List all services

You can list all services by calling the `list` method on [ServicesResource](../CSNetbankingSDK/ServicesResource.swift). Optionally you can request pagination by passing [ListParameters](../CSNetbankingSDK/Parameters.swift) object to `parameters` argument. Read about [ServiceResponse](../CSNetbankingSDK/ServiceResponse.swift) for more information about the response.

```swift
// List all services
    netbankingClient.services
        .list(parameters, callback: {
            services: CoreResult<PaginatedListResponse<ServiceResponse>> in
            //Do something with retrieved services
        });
```
