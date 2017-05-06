# Contacts

This guide walks you through retrieving current user's accounts contacts. It can contain addresses, phones and email addresses.

[ContactsResource](../CSNetbankingSDK/ContactsResource.swift)

```swift
// Get ContactsResource Instance
    let contactsResource = netbankingClient.contacts
```

## 1\. List all of current users contacts

You can list all of current users contacts by calling the `list` method on [ContactsResource](../CSNetbankingSDK/ContactsResource.swift).

```swift
// List all contacts
    netbankingClient.contacts
        .list(callback: {
            contacts: CoreResult<ListResponse<Contact>> in
            //Do something with retrieved contacts
        });
```

## 2\. Get individual current users contact

You can get detail of the individual current users contact by calling the `withId` method on [ContactsResource](../CSNetbankingSDK/ContactsResource.swift) with id as a parameter and then calling the get method. For complete response see [Contact](../CSNetbankingSDK/Contact.swift).

```swift
// Contact detail
    netbankingClient.contacts
        .withId(id)
        .get(callback: {
            contact: CoreResult<Contact> in
            //Do something with retrieved contact
        });
```
