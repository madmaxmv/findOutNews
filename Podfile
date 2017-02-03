source 'https://github.com/CocoaPods/Specs.git'
source 'git@github.com:tutu-ru/Specs.git'

platform :ios, '9.0'

use_frameworks!

target ‘findOut’ do

    # Доступ к связке ключей для хранения токенов доступа
    pod 'KeychainSwift', '~> 7.0'
    
    # HockeyApp - распространение и аналитика
    pod 'HockeySDK-Source', '~> 4.1'
    
    # Rx
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
    pod 'RxBlocking', '~> 3.0'
    pod 'RxDataSources', '~> 1.0'

    pod 'Optimizely-iOS-SDK', '~> 1.5'
    
    # вспомогательные методы для асинхронного выполнения задач
    pod 'AsyncSwift', '~> 2.0'
end

post_install do |installer|
    # выключаем поддержку bitcode, тк не все поддерживают
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end


