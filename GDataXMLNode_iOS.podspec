Pod::Spec.new do |spec|

  spec.name         = "GDataXMLNode_iOS"
  spec.version      = "3.1.0"
  spec.summary      = "Support CocoaPods for GDataXML, create XML with automatic line breaks and CDATA format."

  spec.homepage     = "https://github.com/MichaelLedger/GDataXML"

  spec.license      = "MIT"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Mountain Xiang" => "MichaelLedger@163.com" }

  spec.platform     = :ios, "6.0"

  spec.source       = { :git => "https://github.com/MichaelLedger/GDataXML.git", :tag => "#{spec.version}" }

  spec.requires_arc = false
  spec.source_files = "Classes/**/*.{h,m}"
  spec.framework    = "CoreFoundation","Foundation"

  spec.library      = "xml2"
  spec.xcconfig     = { 'HEADER_SEARCH_PATHS' => '/usr/include/libxml2' }
  
end
