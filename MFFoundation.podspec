#
# Be sure to run `pod lib lint MFFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MFFoundation"
  s.version          = "1.0.1"
  s.summary          = "MFFoundation is a cross-platofrm (iOS/MacOS) Utility Library."
  s.description      = <<-DESC
                    MFFoundation is a cross-platofrm (iOS/MacOS) Utility Library.
                    It includes
                    - Convenient extras ( categories ) on some foundation classes
                    - Date Utils
                    - Formatters
                    - Maths Functions
                    - System functions ( model, ios version test, …)
                       DESC
  s.homepage         = "https://github.com/moosefactory/MFFoundation"
  s.license          = 'MIT'
  s.author           = { "Tristan Leblanc" => "tristan@moosefactory.eu" }
  s.source           = { :git => "https://github.com/moosefactory/MFFoundation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/moosefactory_eu'

    s.ios.deployment_target = '6.0'
    s.osx.deployment_target = '10.8'
    s.requires_arc = true

  s.source_files = 'MFFoundation/**/*'
end
