Pod::Spec.new do |s|
  s.name         = "CircularProgressView"
  s.version      = "1.5"
  s.summary      = "A custom audio circular progress view for iOS."
  s.description  = <<-DESC
                  A custom audio circular progress view for iOS.You can customlize its frame,background circle color & progress circle color and circle width as you wish.
                  DESC
  s.homepage     = "https://github.com/nijino/CircularProgressView"
  s.screenshots  = "http://ww3.sinaimg.cn/large/540e407ajw1ejko11y21cg208s0gc7a3.gif"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "nijino" => "nijino@sohu.com" }
  s.social_media_url   = "http://www.weibo.com/nijinosaki"
  s.source       = { :git => 'https://github.com/nijino/CircularProgressView.git',
  :tag => s.version.to_s }
  s.platform     = :ios, '4.3'
  s.frameworks   = "AVFoundation", "QuartzCore"
  s.source_files = 'CircularProgressView.{h,m}'
  s.requires_arc   = true
end

