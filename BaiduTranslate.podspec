#
#  Be sure to run `pod spec lint BaiduTranslate.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name               = "BaiduTranslate"
  s.version            = "0.0.1"
  s.summary            = "Unofficial Baidu Translation iOS SDK"
  s.homepage           = "https://github.com/summerblue/baidu-translate-ios-sdk"
  
  s.license            = "MIT"
  s.author             = { "Charlie Jade" => "summer.alex07@gmail.com" }
  s.social_media_url   = "http://summerblue.me"
  s.platform           = :ios, "6.0"
  
  s.source             = { :git => "https://github.com/summerblue/baidu-translate-ios-sdk.git", :tag => s.version }
  
  s.requires_arc       = true
  s.source_files       = 'BaiduTranslate/**/*.{h,m}'

  s.dependency 'AFNetworking', '~> 2.0'
  s.dependency 'Mantle', '~> 1.5'
end
