#
# Be sure to run `pod lib lint DZAnimatedGift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DZAnimatedGift'
  s.version          = '0.2.0'
  s.summary          = 'Show gift animated on screen.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
* 0.1.0
Release 0.1.0, please see readme
                       DESC

  s.homepage         = 'https://github.com/darkzero/DZAnimatedGift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'darkzero' => 'darkzero_mk2@hotmail.com' }
  s.source           = { :git => 'https://github.com/darkzero/DZAnimatedGift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'

  s.source_files = 'DZAnimatedGift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DZAnimatedGift' => ['DZAnimatedGift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
