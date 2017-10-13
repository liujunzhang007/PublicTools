Pod::Spec.new do |s|

  s.name         = "PublicTools"
  s.version      = "1.0.1"
  s.summary      = "There are some public tools,Something is useful in my daily work!"
  s.description  = <<-DESC
  Computes the meaning of life.
                     Features:
                     1. Is self aware
                     ...
                     42. Likes candies.
                   DESC
  s.homepage     = "https://github.com/liujunzhang007/PublicTools"
  s.license      = "MIT"
  s.author       = { "liujunzhang007" => "liujunzhang007@sina.cn" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/liujunzhang007/PublicTools.git", :tag => s.version.to_s }
  s.source_files  = "PublicTools/PublicTools/*.{h,m}","PublicTools/PublicToolsTests/*.{h,m}"
  s.ios.framework  = "UIKit","Foundation"
  s.vendored_frameworks   = "PublicTools/PublicTools.framework"
  s.requires_arc = true
  s.subspec "All" do |spec|
    spec.ios.dependency "PublicTools/PublicToolsTests/AlertMessage"

end

  s.subspec "AlertMessage" do |spec|

    spec.requires_arc            = false
    spec.compiler_flags          = '-ObjC'
    spec.frameworks = "UIKit","Foundation"
    spec.source_files  = "TWAlertMessage/*.{h,m}"

  end
