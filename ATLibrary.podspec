#
# Be sure to run `pod lib lint ATLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ATLibrary'
  s.version          = '0.1.2'
  s.summary          = 'ATLibrary is a categories of UIKit, Foundation  and ulti tool'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: ATLibrary is a categories of UIKit, Foundation  and ulti tool
                       DESC

  s.homepage         = 'https://github.com/wipal194/ATLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Âu Ngọc Thái' => 'ngocthai194@gmail.com' }
  s.source           = { :git => 'https://github.com/wipal194/ATLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ATLibrary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ATLibrary' => ['ATLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
