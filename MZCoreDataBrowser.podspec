Pod::Spec.new do |s|
  s.name             = "MZCoreDataBrowser"
  s.version          = "1.1.1"
  s.summary          = "A quick and powerful Core Data browser for developers"

  s.description      = <<-DESC
   `MZCoreDataBrowser` provides a super quick way to visualize and navigate your Core Data objects.
   It is designed to be used within a debug / developer menu in an application and to be trivially
   easy to integrate. Simply hand it a MOC, put it onscreen, and you're ready to go.
                       DESC

  s.homepage         = "https://github.com/moshozen/MZCoreDataBrowser"
  s.license          = 'MIT'
  s.author           = { "Mat Trudel" => "mat@geeky.net" }
  s.source           = { :git => "https://github.com/moshozen/MZCoreDataBrowser.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mattrudel'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/MZCoreDataBrowserViewController.h'
end
