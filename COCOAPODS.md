# GemWallet CocoaPods Integration

This document describes how to integrate GemWallet into your iOS project using CocoaPods.

## Installation

### Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 6.0+
- CocoaPods 1.12.0+

### Using CocoaPods

Add the following to your `Podfile`:

```ruby
platform :ios, '17.0'
use_frameworks!

target 'YourApp' do
  # Install the entire GemWallet framework
  pod 'GemWallet', :git => 'https://github.com/Shapany/MYGemWallet.git', :tag => '1.0.0'
  
  # OR install specific modules only
  pod 'GemWallet/Primitives', :git => 'https://github.com/Shapany/MYGemWallet.git'
  pod 'GemWallet/Blockchain', :git => 'https://github.com/Shapany/MYGemWallet.git'
  pod 'GemWallet/Components', :git => 'https://github.com/Shapany/MYGemWallet.git'
end
```

Then run:

```bash
pod install
```

## Available Subspecs

GemWallet is modular and provides multiple subspecs:

### Core Modules

- **`GemWallet/Primitives`** - Core data types, models, and utilities
- **`GemWallet/GemstonePrimitives`** - Gemstone core primitives
- **`GemWallet/Formatters`** - Number and string formatters

### Data Layer

- **`GemWallet/Store`** - Database layer using GRDB
- **`GemWallet/Preferences`** - User preferences management

### Blockchain

- **`GemWallet/Blockchain`** - Blockchain integration layer
- **`GemWallet/WalletCore`** - Core wallet functionality
- **`GemWallet/Keychain`** - Secure keychain wrapper
- **`GemWallet/Keystore`** - Key management
- **`GemWallet/Signer`** - Transaction signing

### Networking

- **`GemWallet/SwiftHTTPClient`** - HTTP networking client
- **`GemWallet/GemAPI`** - Gem API client

### Services

- **`GemWallet/ChainServices`** - Blockchain services
- **`GemWallet/FeatureServices`** - Feature-specific services

### UI

- **`GemWallet/Components`** - Reusable UI components
- **`GemWallet/Style`** - Design system and styles
- **`GemWallet/PrimitivesComponents`** - Primitive UI components
- **`GemWallet/Localization`** - Localized strings

### Utilities

- **`GemWallet/Validators`** - Input validators

## Usage Examples

### Basic Wallet Setup

```swift
import GemWallet

// Initialize wallet service
let walletService = WalletService()

// Create a new wallet
let wallet = try await walletService.createWallet(name: "My Wallet")
```

### Using Blockchain Services

```swift
import GemWallet

// Get blockchain service
let blockchainService = BlockchainServiceFactory.make(chain: .ethereum)

// Fetch balance
let balance = try await blockchainService.getBalance(address: "0x...")
```

### UI Components

```swift
import SwiftUI
import GemWallet

struct MyView: View {
    var body: some View {
        AssetBalanceView(asset: asset, balance: balance)
    }
}
```

## External Dependencies

GemWallet depends on the following external libraries:

- [GRDB.swift](https://github.com/groue/GRDB.swift) (~> 7.0) - SQLite database
- [GRDBQuery](https://github.com/groue/GRDBQuery) (~> 0.10) - SwiftUI bindings for GRDB
- [BigInt](https://github.com/attaswift/BigInt) (~> 5.2) - Arbitrary-precision arithmetic
- [Starscream](https://github.com/daltoniam/Starscream) (~> 4.0) - WebSocket client
- [ReownWalletKit](https://github.com/reown-com/reown-swift) - WalletConnect v2

## Development

To contribute to GemWallet or modify the pod:

1. Clone the repository:
```bash
git clone https://github.com/Shapany/MYGemWallet.git --recursive
cd MYGemWallet
```

2. Install dependencies:
```bash
pod install
```

3. Open the workspace:
```bash
open Gem.xcworkspace
```

## Validation

To validate the podspec:

```bash
pod lib lint GemWallet.podspec --allow-warnings
```

To publish to CocoaPods trunk:

```bash
pod trunk push GemWallet.podspec --allow-warnings
```

## License

GemWallet is available under the GPL-3.0 license. See the [LICENSE](LICENSE) file for more info.

## Support

- **Issues**: [GitHub Issues](https://github.com/Shapany/MYGemWallet/issues)
- **Documentation**: [Main README](README.md)
- **Community**: [Discord](https://discord.gg/aWkq5sj7SY)

