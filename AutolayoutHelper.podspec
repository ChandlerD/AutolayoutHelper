
Pod::Spec.new do |s|
  s.name             = "AutolayoutHelper"
  s.version          = "1.0.1"
  s.summary          = "A category on UIView that makes using auto layout in code easier."
  s.homepage         = "https://github.com/ChandlerD/AutolayoutHelper"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => 'MIT', :file => "LICENSE"}
  s.author           = { "Chandler De Angelis" => "chandler.dea@me.com" }
  s.source           = { :git => "https://github.com/ChandlerD/AutolayoutHelper.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/*.{h,m}'
end
