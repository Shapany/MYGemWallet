# GemWallet Example Project

This is a minimal example project demonstrating how to integrate GemWallet using CocoaPods.

## Setup

1. Install CocoaPods if you haven't already:
```bash
sudo gem install cocoapods
```

2. Install dependencies:
```bash
cd Example
pod install
```

3. Open the workspace:
```bash
open GemWalletExample.xcworkspace
```

## Usage

This example demonstrates:

- How to set up GemWallet with CocoaPods
- Basic wallet operations
- Blockchain integration
- UI components usage

## Project Structure

```
Example/
├── Podfile           # CocoaPods dependency configuration
├── GemWalletExample/ # Example app source code
└── README.md         # This file
```

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 6.0+
- CocoaPods 1.12.0+

## Notes

This example uses the local GemWallet pod (`:path => '../'`). 

For production use, reference the GitHub repository instead:

```ruby
pod 'GemWallet', :git => 'https://github.com/Shapany/MYGemWallet.git', :tag => '1.0.0'
```

