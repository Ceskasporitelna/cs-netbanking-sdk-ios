# Phone Numbers

This guide walks you through retrieving current user's phone numbers.

[PhoneNumbersResource](../CSNetbankingSDK/PhoneNumbersResource.swift)

```swift
// Get PhoneNumbersResource Instance
    let phoneNumbersResource = netbankingClient.phoneNumbers
```

## 1\. Phone book numbers

You can list all of current users phone numbers by calling the `list` method on [PhoneNumbersResource](../CSNetbankingSDK/PhoneNumbersResource.swift). The result is a list of [PhoneNumber](../CSNetbankingSDK/PhoneNumber.swift) objects.

```swift
// List all phone numbers
    netbankingClient.phoneNumbers
        .list(callback: {
            phoneNumbers: CoreResult<ListResponse<PhoneNumber>> in
            //Do something with retrieved phone numbers
        });
```

## 2\. Phone book new entry

Create phone number by getting the [PhoneNumbersResource](../CSNetbankingSDK/PhoneNumbersResource.swift) and then calling the `create` method. The create method takes object with properties as a parameter. See [PhoneNumberCreateRequest](../CSNetbankingSDK/PhoneNumberCreateRequest.swift) for all supported parameters and [PhoneNumber](../CSNetbankingSDK/PhoneNumber.swift) for full response.

```swift
// Create phone number
    netbankingClient.phoneNumbers
            .create(request, callback: {
                createdPhoneNumber: CoreResult<PhoneNumber> in
                //Do stuff with created phone number
            });
```

## 3\. Phone book entry update

Update phone number by getting the [PhoneNumberResource](../CSNetbankingSDK/PhoneNumbersResource.swift) and then calling the `update` method on it. The method takes object with properties as a parameter. Currently only alias can be changed. For all supported parameters see [PhoneNumberUpdateRequest](../CSNetbankingSDK/PhoneNumberUpdateRequest.swift) and [PhoneNumber](../CSNetbankingSDK/PhoneNumber.swift) for full response.

```swift
// Update phone number
    netbankingClient.phoneNumbers
        .withId(id)
        .update(request, callback: {
            updatedPhoneNumber: CoreResult<PhoneNumber> in
            //Do stuff with updated phone number
        });
```

## 4\. Phone book entry delete

Delete phone number by getting the [PhoneNumbersResource](../CSNetbankingSDK/PhoneNumbersResource.swift) and then calling the `delete` method.

```swift
// Delete phone number 
    netbankingClient.phoneNumbers
            .withId(id)
            .delete(callback: {
                empty: CoreResult<NetbankingEmptyResponse> in
                //Phone number is now deleted
            });
```
