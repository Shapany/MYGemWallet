# 🚀 GemWallet 快速开始指南

## 📌 仓库信息

- **GitHub 仓库**: https://github.com/Shapany/MYGemWallet.git
- **版本**: 1.0.0
- **支持平台**: iOS 17.0+
- **Swift 版本**: 6.0

---

## ⚡️ 3 分钟快速集成

### 第 1 步：创建/编辑 Podfile

在你的 iOS 项目根目录创建或编辑 `Podfile`：

```ruby
platform :ios, '17.0'
use_frameworks!

target 'YourApp' do
  pod 'GemWallet', :git => 'https://github.com/Shapany/MYGemWallet.git', :branch => 'main'
end
```

### 第 2 步：安装依赖

```bash
pod install --repo-update
```

⏱ **首次安装需要 5-10 分钟**（项目较大）

### 第 3 步：打开项目

```bash
open YourApp.xcworkspace
```

⚠️ **注意**：安装完成后必须打开 `.xcworkspace` 文件，而不是 `.xcodeproj`

---

## 📝 快速示例代码

### 导入模块

```swift
import GemWallet
```

### 创建钱包

```swift
import GemWallet

class WalletManager {
    func createNewWallet() async throws {
        let walletService = WalletService()
        let wallet = try await walletService.createWallet(name: "我的钱包")
        print("钱包创建成功: \(wallet)")
    }
}
```

### 查询区块链余额

```swift
import GemWallet

class BlockchainManager {
    func getEthereumBalance(address: String) async throws {
        let service = BlockchainServiceFactory.make(chain: .ethereum)
        let balance = try await service.getBalance(address: address)
        print("余额: \(balance)")
    }
}
```

### 使用 UI 组件

```swift
import SwiftUI
import GemWallet

struct WalletView: View {
    let asset: Asset
    let balance: Balance
    
    var body: some View {
        VStack {
            AssetBalanceView(asset: asset, balance: balance)
            AssetImageView(asset: asset)
        }
    }
}
```

---

## 🎯 只使用需要的模块

如果你只需要部分功能，可以按需引入：

```ruby
# 只使用核心功能
pod 'GemWallet/Primitives', :git => 'https://github.com/Shapany/MYGemWallet.git'

# 只使用区块链功能
pod 'GemWallet/Blockchain', :git => 'https://github.com/Shapany/MYGemWallet.git'

# 只使用 UI 组件
pod 'GemWallet/Components', :git => 'https://github.com/Shapany/MYGemWallet.git'
```

### 可用模块列表

| 模块 | 功能 |
|------|------|
| `Primitives` | 核心数据类型 |
| `Blockchain` | 区块链集成 |
| `Components` | UI 组件 |
| `Store` | 数据库 |
| `Keychain` | 安全存储 |
| `Formatters` | 格式化工具 |
| `ChainServices` | 链服务 |

完整列表查看 [POD_INSTALLATION.md](POD_INSTALLATION.md)

---

## 🔧 常见问题

### ❓ 安装时间太长

**原因**：项目包含多个子模块，首次下载需要时间

**解决**：请耐心等待，通常 5-10 分钟完成

---

### ❓ 找不到模块

**错误**: `No such module 'GemWallet'`

**解决**：
1. 确保使用 `.xcworkspace` 打开项目
2. Clean Build Folder (⇧⌘K)
3. 重新 Build (⌘B)

---

### ❓ 依赖冲突

**错误**: 提示依赖版本冲突

**解决**：
```bash
pod cache clean --all
pod deintegrate
pod install --repo-update
```

---

### ❓ 子模块未初始化

**错误**: 某些依赖找不到

**解决**：
```bash
cd path/to/MYGemWallet
git submodule update --init --recursive
```

---

## 📚 更多资源

- 📖 [完整安装指南](POD_INSTALLATION.md)
- 📘 [CocoaPods 文档](COCOAPODS.md)
- 🔍 [主 README](README.md)
- 🛠 [贡献指南](CONTRIBUTING.md)

---

## 🆘 获取帮助

### GitHub Issues
https://github.com/Shapany/MYGemWallet/issues

### 原项目社区
- Discord: https://discord.gg/aWkq5sj7SY
- Telegram: https://t.me/gemwallet_developers

---

## ✅ 验证安装

运行验证脚本检查配置：

```bash
./scripts/verify_pod.sh
```

---

## 📄 许可证

GPL-3.0 License - 详见 [LICENSE](LICENSE) 文件

---

## 🎉 开始构建

现在你已经准备好使用 GemWallet 构建你的加密货币钱包应用了！

**祝你开发愉快！** 💎

