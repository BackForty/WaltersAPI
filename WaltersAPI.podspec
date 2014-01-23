Pod::Spec.new do |s|
  s.name         = "WaltersAPI"
  s.version      = "0.0.1"
  s.summary      = "A client library for The Walters Museum API"

  s.description  = <<-DESC
                   A Client library for [The Walters Museum API](http://api.thewalters.org)
                   DESC

  s.homepage     = "http://github.com/BackForty/WaltersAPI"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Ed Schmalzle" => "ed@nerded.net" }
  s.social_media_url = "http://twitter.com/inthebackforty"
  s.platform     = :ios
  s.source       = {:git => 'https://github.com/BackForty/WaltersAPI.git', :tag => 'beta'}
  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.requires_arc = true
end
