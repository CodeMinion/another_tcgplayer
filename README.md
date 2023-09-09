
# Another_TcgPlayer

The another_tcgplayer package is a Flutter package for the TCG Player APIs. It exposes the APIs via the TcgPlayerClient.

## Features

The following table includes details about the level at which all the TCG Player APIs are supported in this package.

| API | Support Percentage |
|  --------  |  -------  |
| Authorization | 100% |
| App | 0% |
| Catalog | 100% |
| Inventory | 0% |
| Pricing | 100% |
| Stores | 0% | 

## Getting started

This package implements the TCG Player APIs defined in this document https://docs.tcgplayer.com/reference/app_authorizeapplication

For information about the parameters and results refer to their reference docs.

## Usage

To use this package you'll first need to initialize the client using your public and private API keys. Once the client is initialized all the supported API calls are available through it.

```dart  
String publicKey = "<TCG Player Public API KEY>";  
String privateKey = "<TCG Player Private API KEY>";  
  
final client = TcgPlayerClient(publicKey: publicKey, privateKey: privateKey);
```  
  