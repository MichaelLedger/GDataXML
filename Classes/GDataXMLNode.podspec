Pod::Spec.new do |spec|

  spec.name         = "GDataXMLNode"
  spec.version      = "0.0.1"
  spec.summary      = "Support CocoaPods for GDataXML."

  spec.homepage     = "https://github.com/MichaelLedger/GDataXML"

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Mountain Xiang" => "MichaelLedger@163.com" }

  spec.platform     = :ios, "6.0"

  # - WARN  | github_sources: Github repositories should end in `.git`.
  spec.source       = { :git => "git@github.com:MichaelLedger/GDataXML.git", :tag => "#{spec.version}" }

  # - ERROR | xcodebuild:  /Users/MichaelLedger/Desktop/GDataXML-Demo/Classes/GDataXMLNode.m:313:16: error: ARC forbids explicit message send of 'release'
  spec.requires_arc = false
  spec.source_files = "*.{h,m}"
  spec.framework    = "CoreFoundation","Foundation"

  # - ERROR | [iOS] libraries: Libraries should omit the `lib` prefix  (`libxml2.tbd`)
  # - ERROR | [iOS] libraries: Libraries should not include the extension (`libxml2.2.dylib`)
  # - ERROR | [iOS] libraries: Libraries should omit the `lib` prefix  (`libxml2.2.dylib`)
  spec.library      = "xml2","xml2.2"
  spec.xcconfig     = { 'HEADER_SEARCH_PATHS' => '/usr/include/libxml2' }
  
end
