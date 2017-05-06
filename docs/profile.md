# Profile

This guide walks you through retrieving current user's profile and information about their last logins.

[ProfileResource](../CSNetbankingSDK/ProfileResource.swift)

```swift
// Get ProfileResource Instance
    let profileResource = netbankingClient.profile
```

## 1\. Get current users profile detail

You can get current users profile detail by calling the `get` method on [ProfileResource](../CSNetbankingSDK/ProfileResource.swift). For complete response with description please see [Profile](../CSNetbankingSDK/Profile.swift).

```swift
// Users profile
    netbankingClient.profile
        .get(callback: {
            profile: CoreResult<Profile> in
            //Do something with retrieved profile
        });
```

## 2\. List current users last logins

You can list current user's last logins by calling the list method on [LastLoginResource](../CSNetbankingSDK/LastLoginResource.swift). For complete response with description please see [LastLoginInfo](../CSNetbankingSDK/LastLoginInfo.swift).

```swift
// Users last logins
    netbankingClient.profile
        .lastLogins
        .list(callback: {
            lastLogins: CoreResult<ListResponse<LastLoginInfo>> in
            //Do something with list of last logins (e.g. correlate with recent user location to detect possible frauds!)
        });
```
