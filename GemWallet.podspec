Pod::Spec.new do |s|
  s.name             = 'GemWallet'
  s.version          = '1.0.0'
  s.summary          = 'Gem Wallet - A powerful and secure cryptocurrency wallet'
  s.description      = <<-DESC
Gem Wallet is a powerful and secure mobile application for iOS. 
It provides users with a seamless and intuitive experience to manage 
their digital assets and cryptocurrencies with multi-chain support.
                       DESC

  s.homepage         = 'https://github.com/Shapany/MYGemWallet'
  s.license          = { :type => 'GPL-3.0', :file => 'LICENSE' }
  s.author           = { 'Gem Wallet' => 'support@gemwallet.com' }
  s.source           = { :git => 'https://github.com/Shapany/MYGemWallet.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '17.0'
  s.swift_version = '6.0'
  
  # Core framework - all essential modules combined
  s.default_subspec = 'Core'
  
  # Core subspec
  s.subspec 'Core' do |core|
    core.dependency 'GemWallet/Primitives'
    core.dependency 'GemWallet/Store'
    core.dependency 'GemWallet/Blockchain'
    core.dependency 'GemWallet/Components'
  end
  
  # Primitives - Core data types and utilities
  s.subspec 'Primitives' do |primitives|
    primitives.source_files = 'Packages/Primitives/Sources/**/*.swift'
    primitives.frameworks = 'Foundation', 'SwiftUI'
  end
  
  # GemstonePrimitives - Gemstone core primitives
  s.subspec 'GemstonePrimitives' do |gp|
    gp.source_files = 'Packages/GemstonePrimitives/Sources/**/*.swift'
    gp.frameworks = 'Foundation'
  end
  
  # Formatters - Number and string formatters
  s.subspec 'Formatters' do |formatters|
    formatters.source_files = 'Packages/Formatters/Sources/**/*.swift'
    formatters.dependency 'GemWallet/Primitives'
    formatters.frameworks = 'Foundation'
  end
  
  # Store - Database layer
  s.subspec 'Store' do |store|
    store.source_files = 'Packages/Store/Sources/**/*.swift'
    store.dependency 'GemWallet/Primitives'
    store.dependency 'GemWallet/GemstonePrimitives'
    store.dependency 'GemWallet/GRDBQuery'
    store.frameworks = 'Foundation'
  end
  
  # GRDBQuery - Local dependency
  s.subspec 'GRDBQuery' do |grdbq|
    grdbq.source_files = 'Packages/Dependencies/GRDBQuery/Sources/**/*.swift'
    grdbq.dependency 'GRDB.swift', '~> 7.0'
    grdbq.frameworks = 'Foundation', 'SwiftUI', 'Combine'
  end
  
  # Blockchain - Blockchain integration layer
  s.subspec 'Blockchain' do |blockchain|
    blockchain.source_files = 'Packages/Blockchain/Sources/**/*.swift'
    blockchain.dependency 'GemWallet/Primitives'
    blockchain.dependency 'GemWallet/GemstonePrimitives'
    blockchain.dependency 'GemWallet/SwiftHTTPClient'
    blockchain.dependency 'GemWallet/WalletCore'
    blockchain.dependency 'GemWallet/Formatters'
    blockchain.dependency 'GemWallet/Preferences'
    blockchain.dependency 'GemWallet/Keychain'
    blockchain.frameworks = 'Foundation'
  end
  
  # SwiftHTTPClient - HTTP networking
  s.subspec 'SwiftHTTPClient' do |http|
    http.source_files = 'Packages/SwiftHTTPClient/Sources/**/*.swift'
    http.frameworks = 'Foundation'
  end
  
  # WalletCore - Wallet core functionality
  s.subspec 'WalletCore' do |wc|
    wc.source_files = 'Packages/WalletCore/Sources/**/*.swift'
    wc.dependency 'GemWallet/Primitives'
    wc.dependency 'GemWallet/GemstonePrimitives'
    wc.frameworks = 'Foundation'
  end
  
  # Preferences - User preferences
  s.subspec 'Preferences' do |prefs|
    prefs.source_files = 'Packages/Preferences/Sources/**/*.swift'
    prefs.dependency 'GemWallet/Primitives'
    prefs.frameworks = 'Foundation'
  end
  
  # Keychain - Keychain wrapper
  s.subspec 'Keychain' do |keychain|
    keychain.source_files = 'Packages/Keychain/Sources/**/*.swift'
    keychain.frameworks = 'Foundation', 'Security'
  end
  
  # Keystore - Key management
  s.subspec 'Keystore' do |keystore|
    keystore.source_files = 'Packages/Keystore/Sources/**/*.swift'
    keystore.dependency 'GemWallet/Primitives'
    keystore.dependency 'GemWallet/WalletCore'
    keystore.dependency 'GemWallet/Keychain'
    keystore.frameworks = 'Foundation', 'Security'
  end
  
  # Signer - Transaction signing
  s.subspec 'Signer' do |signer|
    signer.source_files = 'Packages/Signer/Sources/**/*.swift'
    signer.dependency 'GemWallet/Primitives'
    signer.dependency 'GemWallet/WalletCore'
    signer.dependency 'GemWallet/Keystore'
    signer.frameworks = 'Foundation'
  end
  
  # Validators - Input validators
  s.subspec 'Validators' do |validators|
    validators.source_files = 'Packages/Validators/Sources/**/*.swift'
    validators.dependency 'GemWallet/Primitives'
    validators.frameworks = 'Foundation'
  end
  
  # Components - UI components
  s.subspec 'Components' do |components|
    components.source_files = 'Packages/Components/Sources/**/*.swift'
    components.dependency 'GemWallet/Primitives'
    components.dependency 'GemWallet/Style'
    components.frameworks = 'SwiftUI', 'Combine'
  end
  
  # Style - Design system
  s.subspec 'Style' do |style|
    style.source_files = 'Packages/Style/Sources/**/*.swift'
    style.resource_bundles = {
      'GemWalletStyle' => ['Packages/Style/Sources/**/*.{json,svg,xcassets}']
    }
    style.frameworks = 'SwiftUI'
  end
  
  # PrimitivesComponents - Primitives UI components
  s.subspec 'PrimitivesComponents' do |pc|
    pc.source_files = 'Packages/PrimitivesComponents/Sources/**/*.swift'
    pc.dependency 'GemWallet/Primitives'
    pc.dependency 'GemWallet/Formatters'
    pc.dependency 'GemWallet/Components'
    pc.frameworks = 'SwiftUI'
  end
  
  # GemAPI - API client
  s.subspec 'GemAPI' do |api|
    api.source_files = 'Packages/GemAPI/Sources/**/*.swift'
    api.dependency 'GemWallet/Primitives'
    api.dependency 'GemWallet/SwiftHTTPClient'
    api.frameworks = 'Foundation'
  end
  
  # ChainServices - Blockchain services
  s.subspec 'ChainServices' do |cs|
    cs.source_files = 'Packages/ChainServices/**/*.swift'
    cs.exclude_files = 'Packages/ChainServices/**/*TestKit.swift', 'Packages/ChainServices/**/*Mock.swift'
    cs.dependency 'GemWallet/Primitives'
    cs.dependency 'GemWallet/PrimitivesComponents'
    cs.dependency 'GemWallet/GemAPI'
    cs.dependency 'GemWallet/Store'
    cs.dependency 'GemWallet/Blockchain'
    cs.dependency 'GemWallet/ReownSwift'
    cs.dependency 'GemWallet/Starscream'
    cs.frameworks = 'Foundation'
  end
  
  # ReownSwift - WalletConnect v2 (local submodule)
  s.subspec 'ReownSwift' do |reown|
    reown.source_files = 'Packages/Dependencies/reown-swift/Sources/**/*.swift'
    reown.dependency 'GemWallet/Starscream'
    reown.frameworks = 'Foundation', 'Combine'
  end
  
  # Starscream - WebSocket client (local submodule)
  s.subspec 'Starscream' do |star|
    star.source_files = 'Packages/Dependencies/Starscream/Sources/**/*.swift'
    star.frameworks = 'Foundation', 'Network', 'Security'
  end
  
  # BigInt - Arbitrary precision arithmetic (local submodule)
  s.subspec 'BigInt' do |bigint|
    bigint.source_files = 'Packages/Dependencies/BigInt/sources/**/*.swift'
    bigint.frameworks = 'Foundation'
  end
  
  # FeatureServices - Feature services
  s.subspec 'FeatureServices' do |fs|
    fs.source_files = 'Packages/FeatureServices/**/*.swift'
    fs.dependency 'GemWallet/Primitives'
    fs.dependency 'GemWallet/Store'
    fs.dependency 'GemWallet/GemAPI'
    fs.dependency 'GemWallet/Preferences'
    fs.frameworks = 'Foundation', 'SwiftUI'
  end
  
  # Localization - Localized strings
  s.subspec 'Localization' do |l10n|
    l10n.source_files = 'Packages/Localization/Sources/**/*.swift'
    l10n.resource_bundles = {
      'GemWalletLocalization' => ['Packages/Localization/Sources/**/*.strings']
    }
    l10n.frameworks = 'Foundation'
  end
end

