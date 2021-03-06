#
# Be sure to run `pod lib lint Passer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Passer'
  s.version          = '0.1.6'
  s.summary          = 'mCooly Studio Private iOS Library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Although the house sparrow is small, but be fullies equipped.
                       DESC

  s.homepage         = 'https://github.com/mCooly/Passer-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WeiXuG' => 'weixug@mcooly.com' }
  s.source           = { :git => 'https://github.com/mCooly/Passer-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/mCooly'
  
  s.frameworks = 'Foundation'
  
  s.default_subspec = "BLL"

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  # DAL层(数据访问层)
  s.subspec "DAL" do |ss|
      ss.dependency 'Passer/Network'
      ss.dependency 'Passer/Database'
  end
  
  s.subspec "Network" do |ss|
    ss.source_files = 'Passer/Classes/Network/**/*.swift'
    ss.dependency 'Alamofire', '~> 5.4.1'
  end
  
  s.subspec "Database" do |ss|
    ss.dependency 'RealmSwift', '~> 10.7.2'
  end
  
  # BLL层(业务逻辑层)
  s.subspec "BLL" do |ss|
    ss.dependency 'Passer/DAL'
    ss.dependency 'SwiftyJSON', '~> 5.0.0'
  end
  
  # UI层(表示层)
  s.subspec "UI" do |ss|
    ss.frameworks = 'UIKit'
    ss.dependency 'SnapKit', '~> 5.0.1'
    ss.dependency 'Kingfisher', '~> 6.2.1'
  end
  
  # 测试库
  s.subspec "Test" do |ss|
    ss.dependency 'Quick', '~> 3.1.2'
    ss.dependency 'Nimble', '~> 9.0.0'
  end
  
end
