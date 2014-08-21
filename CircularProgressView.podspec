Pod::Spec.new do |s|
  s.name         = "CircularProgressView"
  s.version      = "1.5"
  s.summary      = "A custom audio circular progress view for iOS."
  s.homepage     = "https://github.com/nijino/CircularProgressView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "nijino" => "nijino_saki@163.com" }
  s.source       = { :git => "https://github.com/nijino/CircularProgressView.git",
  :tag => s.version.to_s }
  s.platform     = :ios, '4.3'
  s.source_files = 'CircularProgressView.{h, m}'
  s.requires_arc   = true
end

