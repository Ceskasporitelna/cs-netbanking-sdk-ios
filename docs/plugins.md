# Plugins

This guide walks you through retrieving current user's plugins.

[PluginsResource](../CSNetbankingSDK/PluginsResource.swift)

```swift
// Get PluginsResource Instance
    let pluginsResource = netbankingClient.plugins
```

## 1\. List all of current users plugins

You can list all of current users plugins by calling the `list` method on [PluginsResource](../CSNetbankingSDK/PluginsResource.swift). Method accepts [ListParameters](../CSNetbankingSDK/Parameters.swift) for optional pagination. Result is a paginated list of [Plugin](../CSNetbankingSDK/Plugin.swift) objects.

```swift
// List all plugins
    netbankingClient.plugins
        .list(parameters, callback: {
            plugins: CoreResult<PaginatedListResponse<Plugin>> in
            //Do stuff with retrieved plugins
        });
```

## 2\. Update plugin

Update plugin by getting the [PluginResource](../CSNetbankingSDK/PluginResource.swift) and then calling the `update` method on it. The method takes object with properties as a parameter. Currently only alias can be changed. For all supported parameters see [UpdatePluginRequest](../CSNetbankingSDK/UpdatePluginRequest.swift) and [SignablePlugin](../CSNetbankingSDK/SignablePlugin.swift) for full response.

```swift
// Update plugin
    netbankingClient.plugins
        .withId(id)
        .update(request, callback: {
            updatedPlugin: CoreResult<SignablePlugin> in
            //Do stuff with updated plugin
        });
```
