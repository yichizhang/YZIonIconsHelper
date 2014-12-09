Pod::Spec.new do |s|
  s.name         = "YZIonIconsHelper"
  s.version      = "0.0.2"
  s.summary      = "It helps make working with IonIcons easier."
  s.homepage     = "https://github.com/yichizhang/" + s.name
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Yichi Zhang" => "zhang-yi-chi@hotmail.com" }
  s.source       = {
    :git => "https://github.com/yichizhang/" + s.name + ".git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Source/*.{h,m}'
  #s.resources    = 'RES.bundle'

  s.dependency 'ionicons'
  s.framework  = 'Foundation', 'UIKit'

end
