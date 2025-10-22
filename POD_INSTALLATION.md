# GemWallet Pod 安装指南

## 📦 项目已成功上传到 GitHub

仓库地址：**https://github.com/Shapany/MYGemWallet.git**

## 🎯 CocoaPods 集成方式

### 方式 1：直接使用 Git 仓库

在你的 `Podfile` 中添加：

```ruby
platform :ios, '17.0'
use_frameworks!

target 'YourApp' do
  # 使用完整的 GemWallet 框架
  pod 'GemWallet', :git => 'https://github.com/Shapany/MYGemWallet.git', :branch => 'main'
  
  # 或者指定版本
  pod 'GemWallet', :git => 'https://github.com/Shapany/MYGemWallet.git', :tag => '1.0.0'
end
```

### 方式 2：使用特定模块

如果你只需要部分功能，可以只引入特定的 subspec：

```ruby
target 'YourApp' do
  # 只安装需要的模块
  pod 'GemWallet/Primitives', :git => 'https://github.com/Shapany/MYGemWallet.git'
  pod 'GemWallet/Blockchain', :git => 'https://github.com/Shapany/MYGemWallet.git'
  pod 'GemWallet/Components', :git => 'https://github.com/Shapany/MYGemWallet.git'
end
```

### 安装步骤

1. 添加上述配置到你的 `Podfile`

2. 运行安装命令：
```bash
pod install --repo-update
```

3. 打开 `.xcworkspace` 文件：
```bash
open YourApp.xcworkspace
```

## 📚 可用的模块 (Subspecs)

### 核心模块
- `GemWallet/Primitives` - 核心数据类型和工具
- `GemWallet/GemstonePrimitives` - Gemstone 核心原语
- `GemWallet/Formatters` - 数字和字符串格式化工具

### 数据层
- `GemWallet/Store` - 数据库层 (使用 GRDB)
- `GemWallet/Preferences` - 用户偏好设置管理
- `GemWallet/GRDBQuery` - GRDB SwiftUI 绑定

### 区块链
- `GemWallet/Blockchain` - 区块链集成层
- `GemWallet/WalletCore` - 核心钱包功能
- `GemWallet/Keychain` - 安全的钥匙串封装
- `GemWallet/Keystore` - 密钥管理
- `GemWallet/Signer` - 交易签名

### 网络层
- `GemWallet/SwiftHTTPClient` - HTTP 网络客户端
- `GemWallet/GemAPI` - Gem API 客户端

### 服务层
- `GemWallet/ChainServices` - 区块链服务
- `GemWallet/FeatureServices` - 功能服务
- `GemWallet/ReownSwift` - WalletConnect v2
- `GemWallet/Starscream` - WebSocket 客户端
- `GemWallet/BigInt` - 大整数运算

### UI 组件
- `GemWallet/Components` - 可复用的 UI 组件
- `GemWallet/Style` - 设计系统和样式
- `GemWallet/PrimitivesComponents` - 基础 UI 组件
- `GemWallet/Localization` - 本地化字符串

### 工具
- `GemWallet/Validators` - 输入验证器

## 💡 使用示例

### 基础钱包操作

```swift
import GemWallet

// 初始化钱包服务
let walletService = WalletService()

// 创建新钱包
let wallet = try await walletService.createWallet(name: "我的钱包")
```

### 区块链服务

```swift
import GemWallet

// 获取区块链服务
let blockchainService = BlockchainServiceFactory.make(chain: .ethereum)

// 查询余额
let balance = try await blockchainService.getBalance(address: "0x...")
```

### UI 组件

```swift
import SwiftUI
import GemWallet

struct MyView: View {
    var body: some View {
        AssetBalanceView(asset: asset, balance: balance)
    }
}
```

## ⚙️ 系统要求

- iOS 17.0+
- Xcode 15.0+
- Swift 6.0+
- CocoaPods 1.12.0+

## 🔧 开发和调试

### 本地开发

如果你想修改源码进行调试，可以使用本地路径：

```ruby
pod 'GemWallet', :path => '../path/to/MYGemWallet'
```

### 克隆仓库

```bash
# 克隆包含所有子模块
git clone https://github.com/Shapany/MYGemWallet.git --recursive

# 如果已经克隆，需要初始化子模块
cd MYGemWallet
git submodule update --init --recursive
```

## 📝 重要说明

### 关于依赖项

本项目使用 Git Submodules 管理以下依赖：

- **GRDB.swift** - SQLite 数据库封装
- **GRDBQuery** - GRDB 的 SwiftUI 绑定
- **BigInt** - 大整数运算库
- **Starscream** - WebSocket 客户端
- **reown-swift** - WalletConnect v2 支持

这些依赖都作为本地 submodules 包含在仓库中，不需要额外配置。

### 首次安装时间

由于项目较大且包含多个子模块，首次执行 `pod install` 可能需要较长时间（5-10 分钟），请耐心等待。

### 遇到问题？

如果遇到安装问题，尝试以下步骤：

1. 更新 CocoaPods 缓存：
```bash
pod repo update
```

2. 清理缓存后重新安装：
```bash
pod cache clean --all
pod deintegrate
pod install --repo-update
```

3. 确保子模块已正确初始化：
```bash
git submodule update --init --recursive
```

## 📖 文档

- [主要 README](README.md)
- [CocoaPods 详细文档](COCOAPODS.md)
- [贡献指南](CONTRIBUTING.md)

## 🆘 支持

- **Issues**: [GitHub Issues](https://github.com/Shapany/MYGemWallet/issues)
- **原项目**: [gemwalletcom/gem-ios](https://github.com/gemwalletcom/gem-ios)

## 📄 许可证

本项目基于 GPL-3.0 许可证开源。详见 [LICENSE](LICENSE) 文件。

