
Pod::Spec.new do |s|

  s.name         = "HFoundationCategory"
  s.version      = "0.0.1"
  s.summary      = "Foundation的分类"

  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/hare27/HFoundationCategory"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "hare27" => "hare27@foxmail.com" }

  s.platform     = :ios

    s.osx.deployment_target = "10.7"

  s.source       = { :git => "https://github.com/hare27/HFoundationCategory.git", :tag => "0.0.1" }

  s.source_files  = "HFoundationCategory", "HFoundationCategory/**/*.{h,m}"

end
