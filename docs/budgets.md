# Budgets

This guide walks you through retrieving current user's accounts budgets.

[BudgetsResource](../CSNetbankingSDK/BudgetsResource.swift)

```swift
// Get BudgetsResource Instance
    let budgetsResource = netbankingClient.budgets
```

## 1\. List all of current users budgets

You can list all of current users budgets by calling the `list` method on [BudgetsResource](../CSNetbankingSDK/BudgetsResource.swift). You may optionally pass [ListParameters](../CSNetbankingSDK/Parameters.swift) to specify pagination.

```swift
// List all budgets
    netbankingClient.budgets
        .list(parameters, callback: {
            budgets: CoreResult<PaginatedListResponse<Budget>> in
            //Do something with retrieved budgets
        });
```

## 2\. Update current users budgets

You can update current users budget by calling the `update` method on [BudgetsResource](../CSNetbankingSDK/BudgetsResource.swift). For payload properties please see [UpdateBudgets](../CSNetbankingSDK/UpdateBudgets.swift).

```swift
// Budget update
    netbankingClient.budgets
        .update(request, callback: {
            updatedBudget: CoreResult<UpdateBudgets> in
            //Do something with updated budget
        });
```
