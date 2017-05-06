# Messages

This guide walks you through retrieving current user's messages.

[MessagesResource](../CSNetbankingSDK/MessagesResource.swift)

```swift
// Get MessagesResource Instance
    let messagesResource = netbankingClient.messages
```

## 1\. List all messages

You can list all of current users messages by calling the `list` method on [MessagesResource](../CSNetbankingSDK/MessagesResource.swift). You can optionally add pagination and sorting via specifying a [MessagesParameters](../CSNetbankingSDK/MessagesParameters.swift) object as `parameters`. Result is a paginated list of [Message](../CSNetbankingSDK/Message.swift) objects.

```swift
// List all messages
    netbankingClient.messages
        .list(MessagesParameters parameters, callback: {
            messages: CoreResult<PaginatedListResponse<Message>> in
            //Do something with received messages
        });
```

## 2\. List all messages mandatory resources

You can list all of current users messages by calling the `list` method on [MessagesMandatoryResource](../CSNetbankingSDK/MessagesMandatoryResource.swift). Result is a list of [Message](../CSNetbankingSDK/Message.swift) objects.

```swift
// List all messages mandatory resources
    netbankingClient.messages
        .mandatory
        .list(callback: {
            mandatoryMessages: CoreResult<ListResponse<Message>> in
            //Do something with mandatory messages
        });
```

## 3\. Get message detail

You can get message detail by calling the `withId` method on [MessagesResource](../CSNetbankingSDK/MessagesResource.swift) with id as a parameter and then calling the get method. For full response see [Message](../CSNetbankingSDK/Message.swift).

```swift
// Message detail
    netbankingClient.messages
        .withId(id)
        .get(callback: {
            message: CoreResult<Message> in
            //Do something with the message (displaying it is a good start)
        });
```

## 4\. Update message

Update message by getting the [MessageResource](../CSNetbankingSDK/MessageResource.swift) and then calling the `update` method on it. The method takes object with properties as a parameter. Currently only alias can be changed. For all supported parameters see [UpdateMessageRequest](../CSNetbankingSDK/UpdateMessageRequest.swift) and [NetbankingEmptyResponse](../CSNetbankingSDK/NetbankingEmptyResponse.swift) for full response.

```swift
// Update message
    netbankingClient.messages
        .withId(id)
        .update(request, callback: {
            empty: CoreResult<NetbankingEmptyResponse> in
            //Do something as the message is updated (not much is in the response but here it is)
        });
```

## 5\. Delete message

Delete message by getting the [MessageResource](../CSNetbankingSDK/MessageResource.swift) and then calling the `delete` method.

```swift
// Delete message
    netbankingClient.messages
            .withId(id)
            .delete(callback: {
                empty: CoreResult<NetbankingEmptyResponse> in
                //Message is deleted now
            });
```

## 6\. Download message attachment

Download message attachment by getting the [MessageAttachmentResource](../CSNetbankingSDK/MessageAttachmentResource.swift) and then calling the `download` method on it.

```swift
// Download message attachment
    netbankingClient.messages
            .withId(messageId)
            .attachments
            .withId(attachmentId)
            .download(callback: {
                attachment: CoreResult<String> in
                //Do something with the downloaded attachment
            });
```
