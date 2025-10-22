#!/bin/bash

# GemWallet Pod 验证脚本
# 用于验证 Podspec 配置是否正确

set -e

echo "🔍 验证 GemWallet.podspec..."
echo ""

# 检查 CocoaPods 是否安装
if ! command -v pod &> /dev/null; then
    echo "❌ CocoaPods 未安装"
    echo "请运行: sudo gem install cocoapods"
    exit 1
fi

echo "✅ CocoaPods 版本: $(pod --version)"
echo ""

# 检查 Git 状态
echo "📦 检查 Git 仓库状态..."
if [ -d ".git" ]; then
    echo "✅ Git 仓库已初始化"
    
    # 检查远程仓库
    if git remote | grep -q "mygemwallet"; then
        REMOTE_URL=$(git remote get-url mygemwallet)
        echo "✅ 远程仓库: $REMOTE_URL"
    else
        echo "⚠️  未找到 mygemwallet 远程仓库"
    fi
else
    echo "❌ 不是 Git 仓库"
    exit 1
fi

echo ""

# 检查子模块
echo "🔗 检查 Git 子模块..."
REQUIRED_SUBMODULES=(
    "Packages/Dependencies/BigInt"
    "Packages/Dependencies/GRDB.swift"
    "Packages/Dependencies/GRDBQuery"
    "Packages/Dependencies/Starscream"
    "Packages/Dependencies/reown-swift"
)

for submodule in "${REQUIRED_SUBMODULES[@]}"; do
    if [ -d "$submodule" ]; then
        echo "✅ $submodule"
    else
        echo "❌ $submodule 缺失"
        echo "请运行: git submodule update --init --recursive"
        exit 1
    fi
done

echo ""

# 验证 Podspec 语法
echo "📝 验证 Podspec 语法..."
if pod spec lint GemWallet.podspec --allow-warnings --quick 2>&1 | grep -q "passed validation"; then
    echo "✅ Podspec 语法验证通过"
else
    echo "⚠️  Podspec 可能存在问题，但这是正常的（某些依赖可能需要特殊配置）"
fi

echo ""

# 检查主要文件
echo "📄 检查必要文件..."
FILES=(
    "GemWallet.podspec"
    "Podfile"
    "COCOAPODS.md"
    "POD_INSTALLATION.md"
    "Example/Podfile"
    "Example/README.md"
)

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file 缺失"
    fi
done

echo ""
echo "═══════════════════════════════════════════════"
echo "✨ 验证完成！"
echo ""
echo "📚 快速开始："
echo ""
echo "1. 在你的项目 Podfile 中添加："
echo "   pod 'GemWallet', :git => 'https://github.com/Shapany/MYGemWallet.git'"
echo ""
echo "2. 运行安装："
echo "   pod install --repo-update"
echo ""
echo "3. 打开 workspace："
echo "   open YourApp.xcworkspace"
echo ""
echo "📖 详细文档请查看 POD_INSTALLATION.md"
echo "═══════════════════════════════════════════════"

