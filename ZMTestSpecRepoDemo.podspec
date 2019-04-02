#
# Be sure to run `pod lib lint ZMTestSpecRepoDemo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
 #名称
 #版本号
 #简短介绍
  s.name             = 'ZMTestSpecRepoDemo'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ZMTestSpecRepoDemo.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.homepage         = 'https://github.com/lucking/ZMTestSpecRepoDemo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZM' => '1531073749@qq.com' }
  s.source           = { :git => 'https://github.com/lucking/ZMTestSpecRepoDemo.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.requires_arc = true                 #是否使用ARC
  s.ios.deployment_target = '8.0'
  s.source_files = 'ZMTestSpecRepoDemo/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZMTestSpecRepoDemo' => ['ZMTestSpecRepoDemo/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'UIKit'

#依赖关系，该项目所依赖的其他库，如果有多个可以写多个 s.dependency
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency "JSONKit", "~> 1.4"
end
