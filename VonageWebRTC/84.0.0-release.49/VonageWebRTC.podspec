#
# Be sure to run `pod spec lint vonagewebrtc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VonageWebRTC'
  s.version          = '84.0.0-release.49'
  s.summary          = 'Vonages WebRTC native library in Vonage products.'
  s.description      = <<-DESC
Vonages WebRTC native library in Vonage products. WebRTC is a free, open project that provides browsers and mobile applications with Real-Time Communications capabilities via simple APIs.
                       DESC
  s.homepage         = 'https://www.vonage.com.es/'
  s.license      = { :type => "Commercial", :text => "https://tokbox.com/support/tos" }
  s.author           = { 'Vonage' => 'vcp_webrtc@vonage.com' }
  s.source           = { :http => "https://s3.amazonaws.com/artifact.tokbox.com/vonage-webrtc/pod/vonagewebrtc/release/macos/#{s.version}/VonageWebRTC-#{s.version}.zip" }
  s.platform = :osx
  s.osx.deployment_target = '10.10'
  s.preserve_paths = 'VonageWebRTC.framework*'
  s.vendored_frameworks = 'VonageWebRTC.framework'
  s.frameworks = 'AVFoundation', 'AudioToolbox', 'CoreGraphics', 'CoreMedia', 'GLKit', 'VideoToolbox'
  s.libraries = 'c++'
  s.xcconfig     = { "FRAMEWORK_SEARCH_PATHS" => "${PODS_ROOT}/VonageWebRTC" }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=macosx*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=macosx*]' => 'arm64' }
end
