#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GQLSchemaGenerator'
  s.version          = '0.0.1'
  s.summary          = 'Code generator for generating GraphQL schema'

  s.description      = 'Code generator for generating GraphQL schema'

  s.homepage         = 'https://github.com/Lumyk/GQLSchemaGenerator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Evgeny Kalashnikov' => 'lumyk@me.com' }
  s.source           = { :git => 'https://github.com/Lumyk/GQLSchemaGenerator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = '{Sources, Scripts}/**/*'
end
