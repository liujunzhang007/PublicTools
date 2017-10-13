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
  non_arc_files = "PublicTools/PublicTools/AlertMessage.h","PublicTools/PublicToolsTests/AlertMessage.m"
  s.requires_arc = true

 s.exclude_files = non_arc_files
 s.subspec "no-arc" do |sna|
 sna.requires_arc = false
 sna.source_files = non_arc_files
 end

end

 
