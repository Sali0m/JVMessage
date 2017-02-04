#
# Be sure to run `pod lib lint JVMessage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JVMessage'
s.version          = '1.0.0'
  s.summary          = 'Easily show a toaster'

  s.description      = "JVMessage is a simple way of showing a temporary message, some may call it a toaster. It's currently showing at bottom of the desired view."

  s.homepage         = 'https://github.com/Sali0m/JVMessage'
  s.screenshots      = 'http://www.saliom.be/githubImg/JVMessage.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sali0m' => 'jehan.vossen@gmail.com' }
  s.source           = { :git => 'https://github.com/Sali0m/JVMessage.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Sali0m'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JVMessage/Classes/**/*'
end
