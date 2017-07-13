
Pod::Spec.new do |s|

  s.name         = "HFoundationCategory"
  s.version      = "0.0.2"
  s.summary      = "Foundation的分类"

  s.description  = <<-DESC
在NSObject+Common.h的增加了类方法
                   DESC

  s.homepage     = "https://github.com/hare27/HFoundationCategory"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "hare27" => "hare27@foxmail.com" }

  s.platform     = :ios

    s.osx.deployment_target = "10.7"

  s.source       = { :git => "https://github.com/hare27/HFoundationCategory.git", :tag => "0.0.1" }

  s.source_files  = "HFoundationCategory", "HFoundationCategory/**/*.{h,m}"

end
