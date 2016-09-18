

Pod::Spec.new do |s|
  s.name         = "NGKit"
  s.version      = "0.2.0"
  s.source       = { :git => "https://github.com/NagiYan/NGKit.git", :tag => "0.2.0" }
  s.summary      = "my lib, with some usefull tools, use swift + oc, no dependency on other pods"
  s.description  = <<-DESC
			Blocks,Device,Extension,Pattern,View, some useful extensions, some view, location services and so on
                   DESC
  s.homepage     = "https://github.com/NagiYan/NGKit"
  s.license      = "MIT"
  s.author       = { "nagi" => "yxj@foxmail.com" }
  s.platform     = :ios, "8.0"
  
  s.default_subspec = 'All'
  s.subspec 'All' do |spec|
    spec.ios.dependency 'NGKit/Blocks'
    spec.ios.dependency 'NGKit/Device'
    spec.ios.dependency 'NGKit/Extension'
    spec.ios.dependency 'NGKit/Pattern'
    spec.ios.dependency 'NGKit/View'
  end
  
  s.subspec 'Blocks' do |spec|
    spec.requires_arc = true
    spec.source_files = "NGKit/Blocks/*"
    spec.exclude_files = "NGKitTests/*"
    spec.frameworks = "UIKit"
  end

  s.subspec 'Device' do |spec|
    spec.requires_arc = true
    spec.source_files = "NGKit/Device/*"
    spec.exclude_files = "NGKitTests/*"
    spec.frameworks = "UIKit"
  end

  s.subspec 'Extension' do |spec|
    spec.requires_arc = true
    spec.source_files = "NGKit/Extension/**/*", "NGKit/NGCommon.swift"
    spec.exclude_files = "NGKitTests/*"
    spec.frameworks = "UIKit"
  end

  s.subspec 'Pattern' do |spec|
    spec.requires_arc = true
    spec.source_files = "NGKit/Pattern/*"
    spec.exclude_files = "NGKitTests/*"
    spec.frameworks = "UIKit"
  end

  s.subspec 'View' do |spec|
    spec.requires_arc = true
    spec.source_files = "NGKit/View/*", "NGKit/Extension/UI/*", "NGKit/NGCommon.swift"
    spec.exclude_files = "NGKitTests/*"
    spec.frameworks = "UIKit"
  end
end
