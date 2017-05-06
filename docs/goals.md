# Goals

This guide walks you through retrieving current user's accounts goals.

[GoalsResource](../CSNetbankingSDK/GoalsResource.swift)

```swift
// Get GoalsResource Instance
    let goalsResource = netbankingClient.goals
```

## 1\. List all of current users goals

You can list all of current users goals by calling the `list` method on [GoalsResource](../CSNetbankingSDK/GoalsResource.swift).

```swift
// List all goals
    netbankingClient.goals
        .list(callback: {
            goals: CoreResult<ListResponse<Goal>> in
            //Do something with retrieved goals (e.g. persuade user to reach them!)
        });
```

## 2\. Update current users goals

You can update current users goals by calling the `update` method on [GoalsResource](../CSNetbankingSDK/GoalsResource.swift) and giving it payload in object as a parameter. For payload properties please see [UpdateGoal](../CSNetbankingSDK/UpdateGoal.swift).

```swift
// Goals update
    netbankingClient.goals
        .update(request, callback: {
            updatedGoal: CoreResult<UpdateGoal> in
            //Do something with updated goal
        });
```
