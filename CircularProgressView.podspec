Pod::Spec.new do |s|
  s.name         = "CircularProgressView"
  s.version      = "1.1"
  s.summary      = "A custom audio circular progress view for iOS.You can customlize its frame,background circle color & progress circle color,circle width as you wish."
  s.homepage     = "https://github.com/nijino/CircularProgressView"
  s.license      = 'MIT'
  s.author       = { "nijino" => "nijino_saki@163.com" }
  s.source       = { :git => "https://github.com/nijino/CircularProgressView.git",
  :tag => "1.1" }
  s.platform     = :ios, '4.3'
  s.source_files = 'CircularProgressView.{h, m}'
  s.requires_arc   = true
end

