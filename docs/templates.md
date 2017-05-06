# Templates

This guide walks you through retrieving templates.

[TemplatesResource](../CSNetbankingSDK/TemplatesResource.swift)

```swift
// Get TemplatesResource Instance
    let templatesResource = netbankingClient.templates
```

## 1\. List all templates

You can list all templates by calling the `list` method on [TemplatesResource](../CSNetbankingSDK/TemplatesResource.swift).

```swift
// List all templates
    netbankingClient.templates
        .list(parameters, callback: {
            templates: CoreResult<PaginatedListResponse<TemplateResponse>> in
            //Do something with retrieved templates
        });
```

## 2\. Get template detail

Get template detail by calling the `withId` method on [TemplatesResource](../CSNetbankingSDK/TemplatesResource.swift) and then calling the get method. See [TemplateResponse](../CSNetbankingSDK/TemplateResponse.swift) for full response.

```swift
// Template detail
    netbankingClient.templates
        .withId(id)
        .get(callback: {
            template: CoreResult<TemplateResponse> in
            //Do something with retrieved template
        });
```
