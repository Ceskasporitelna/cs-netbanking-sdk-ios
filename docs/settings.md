# Settings

This guide walks you through retrieving settings.

[SettingsResource](../CSNetbankingSDK/SettingsResource.swift)

```swift
// Get SettingsResource Instance
    let settingsResource = netbankingClient.settings
```

## 1\. Get user settings

Get settings by calling the `withId` method on [SettingsResource](../CSNetbankingSDK/SettingsResource.swift) and then calling the get method. See [SettingsResponse](../CSNetbankingSDK/SettingsResponse.swift) for full response.

```swift
// Get settings
    netbankingClient.settings
        .get(callback: {
            settings: CoreResponse<SettingsResponse> in
            //Do something with retrieved settings
        });
```

## 2\. Change user settings

Update settings by getting the [SettingsResource](../CSNetbankingSDK/SettingsResource.swift) and then calling the `update` method on it. The method takes object with properties as a parameter. Currently only alias can be changed. For all supported parameters see [SettingsRequest](../CSNetbankingSDK/SettingsRequest.swift) and [SignableSettingsResponse](../CSNetbankingSDK/SignableSettingsResponse.swift) for full response.

```swift
// Update settings
    netbankingClient.settings
        .update(request, callback: {
            updatedSettings: CoreResult<SignableSettingsResponse> in
            //Do something with settings, which are now updated
        });
```
