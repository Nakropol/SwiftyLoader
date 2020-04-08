Pod::Spec.new do |spec|


  spec.name         = "SwiftyLoader"
  spec.version      = "1.0"
  spec.summary      = "Simple Loader for Swift"

  spec.description  = "Description for SwiftyLoader"

  spec.homepage     = "https://github.com/Nakropol/SwiftyLoader.git"

  spec.license      = "MIT"

  spec.author             = { "Nakropol" => "nakrocp@gmail.com" }

  spec.platform     = :ios, "10.0"
  spec.swift_versions = "4.0"


  spec.source       = { :git => "https://github.com/Nakropol/SwiftyLoader.git", :tag => spec.version }

  spec.source_files  = "SwiftyLoader/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"


end
