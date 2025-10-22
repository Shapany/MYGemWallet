# Uncomment the next line to define a global platform for your project
platform :ios, '17.0'

# CocoaPods analytics sends network stats synchronously affecting flutter build latency.
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

use_frameworks!
inhibit_all_warnings!

target 'Gem' do
  # Use the local podspec for development
  # pod 'GemWallet', :path => '.'
  
  # External dependencies
  pod 'GRDB.swift', '~> 7.0'
  pod 'GRDBQuery', '~> 0.10'
  pod 'BigInt', '~> 5.2'
  pod 'Starscream', '~> 4.0'
  # Note: ReownWalletKit might need to be added manually or use a custom fork
  
  target 'GemTests' do
    inherit! :search_paths
  end
end

target 'GemPriceWidget' do
  # Widget extension target
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
      config.build_settings['SWIFT_VERSION'] = '6.0'
      
      # Enable module stability
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      
      # Fix warnings
      config.build_settings['WARNING_CFLAGS'] ||= ['$(inherited)']
      config.build_settings['WARNING_CFLAGS'] << '-Wno-error=non-modular-include-in-framework-module'
    end
  end
end

