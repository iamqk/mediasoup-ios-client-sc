#
# Be sure to run `pod lib lint mediasoup-ios-client-sc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mediasoup-ios-client-sc'
  s.version          = '1.5.4.2'
  s.summary          = 'Mediasoup 3 iOS Client'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/iamqk/mediasoup-ios-client-sc'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'ISC', :file => 'LICENSE' }
  s.author           = { 'iamqk' => 'iamqk@msn.com' }
  s.source           = { :git => 'https://github.com/iamqk/mediasoup-ios-client-sc.git', :tag => s.version.to_s }
  # s.social_media_url = 'mediasoup'

  s.ios.deployment_target = '12.0'
  spec.requires_arc = false

  spec.pod_target_xcconfig = {
    "USE_HEADERMAP" => "NO",
    "ALWAYS_SEARCH_USER_PATHS" => "NO",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
    "CLANG_CXX_LIBRARY" => "libc++",
    "OTHER_CPLUSPLUSFLAGS" => '"-stdlib=libc++" "-Wall" "-Wextra" "-Wpedantic"',
    "VALID_ARCHS" => "$(ARCHS_STANDARD_64_BIT)",
    "OTHER_LD_FLAGS" => "-all_load",
  }
  
  spec.frameworks = "AVFoundation", "AudioToolbox", "CoreAudio", "CoreMedia", "CoreVideo"

  spec.vendored_frameworks = "mediasoup-ios-client-sc/release/combined/mediasoup_client_ios.framework", "mediasoup-ios-client-sc/release/combined/mediasoup_client_ios.framework/Frameworks/WebRTC.framework"

  spec.module_map = "mediasoup-ios-client-sc/mediasoup-client-ios/mediasoup_ios_client.modulemap"
end
