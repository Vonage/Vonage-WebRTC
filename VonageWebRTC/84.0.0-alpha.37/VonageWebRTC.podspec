#
# Be sure to run `pod spec lint VonageWebRTC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VonageWebRTC'
  s.version          = '84.0.0-alpha.37'
  s.summary          = 'Vonages WebRTC native library in Vonage products.'
  s.description      = <<-DESC
Vonages WebRTC native library in Vonage products. WebRTC is a free, open project that provides browsers and mobile applications with Real-Time Communications capabilities via simple APIs.
                       DESC
  s.homepage         = 'https://www.vonage.com.es/'
  s.license      = { :type => "Commercial", :text => "https://tokbox.com/support/tos" }
  s.author           = { 'Vonage' => 'vcp_webrtc@vonage.com' }
  # No need for s.platform info given we are using the deployment attribute for each platform below.
  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '9.0'
  s.source           = { :http => "https://d3opqjmqzxf057.cloudfront.net/vonage-webrtc/pod/vonagewebrtc/release/#{s.version}/VonageWebRTC-#{s.version}.zip" }
  s.osx.preserve_paths = 'macos/VonageWebRTC.framework*'
  s.ios.preserve_paths = 'iphoneos/VonageWebRTC.framework*'
  s.osx.vendored_frameworks = 'macos/VonageWebRTC.framework'
  s.ios.vendored_frameworks = 'iphoneos/VonageWebRTC.framework'
  s.frameworks = 'AVFoundation', 'AudioToolbox', 'CoreGraphics', 'CoreMedia', 'GLKit', 'VideoToolbox'
  s.libraries = 'c++'
  s.xcconfig     = { "FRAMEWORK_SEARCH_PATHS" => "${PODS_ROOT}/VonageWebRTC" }
  s.osx.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=macosx*]' => 'arm64' }
  s.osx.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=macosx*]' => 'arm64' }
  s.ios.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.ios.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end

