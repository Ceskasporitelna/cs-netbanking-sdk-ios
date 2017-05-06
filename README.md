# CSNetbankingSDK

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This SDK allows you to access information from Česká spořitelna a.s. [Netbanking API](http://docs.ext0csnetbanking3.apiary.io/).

# [CHANGELOG](CHANGELOG.md)

# Requirements

- iOS 8.1+
- Xcode 8.3+

# CSNetbankingSDK Installation

## Install through Carthage

If you use [Carthage](https://github.com/Carthage/Carthage) you can add CSNetbankingSDK as your project's dependency by adding it to your Cartfile:

```
github 'Ceskasporitelna/cs-netbanking-sdk-ios'
```

## Install through CocoaPods

You can install CSNetbankingSDK by adding the following line into your Podfile:

```ruby
#Add Ceska sporitelna pods specs respository
source 'https://github.com/Ceskasporitelna/cocoa-pods-specs.git'
source 'https://github.com/CocoaPods/Specs.git'

# Include dependency CSCoreSDK
pod 'CSCoreSDK'
# Include CSNetbankingSDK
pod 'CSNetbankingSDK'
```

# Usage

## Import

You can simply import the module wherever you wish to use it:

```swift
import CSNetbankingSDK
```

## Configuration

You have to configure and initialize CSCoreSDK before using CSNetbanking SDK.

You can find example of CoreSDK configuration below:

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        CoreSDK.sharedInstance
            .useWebApiKey("YourApiKey")
            .useEnvironment(Environment.Sandbox)
        //Now you are ready to setup the netbanking client
        let config = WebApiConfiguration(webApiKey: "YourApiKey", environment: Environment.Sandbox, language: "cs-CZ", signingKey: nil)
        //And obtain it
        let netbankingClient = NetbankingClient(config: config)
        return true
    }
```

For more configuration options see **[CoreSDK configuration guide](https://github.com/Ceskasporitelna/cs-core-sdk-ios/blob/master/docs/configuration.md)**

## NetbankingSDK Usage Guide

**See [Usage Guide](./docs/README.md)** for detailed usage guide.

**TIP!** - You can also learn Netbanking SDK by example in our [**demo**](https://github.com/Ceskasporitelna/csas-sdk-demo-ios)!

# Contributing

Contributions are more than welcome!

Please read our [contribution guide](CONTRIBUTING.md) to learn how to contribute to this project.

# Terms and License

Please read our [terms & conditions in license](LICENSE.md)
