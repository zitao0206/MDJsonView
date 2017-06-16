source 'https://github.com/CocoaPods/Specs.git' 
use_frameworks!

platform :ios, '8.0' 

target 'MDProject' do
  pod 'ReactiveCocoa', '~> 2.5.0'
  pod 'AFNetworking'
  pod 'SDWebImage'
end

pre_install do |installer|
    `git config --global core.ignorecase false`
    
    # Avoid mkmf.log
    require 'mkmf'
    
    module MakeMakefile::Logging
    @logfile = File::NULL
end

if not find_executable 'xcproj'
    raise 'Please install xcproj by running `brew install xcproj`'
end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'DailyBuild'
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'TEST=1']
            end
        end
    end
end
