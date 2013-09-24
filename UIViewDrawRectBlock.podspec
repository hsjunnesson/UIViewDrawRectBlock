Pod::Spec.new do |s|
  s.name     = 'UIViewDrawRectBlock'
  s.version  = '0.0.2'
  s.summary  = 'A category on UIView to create an instance with a block for its drawRect.'
  s.homepage = 'https://github.com/hsjunnesson/UIViewDrawRectBlock'
  s.author   = { 'Hans Sjunnesson' => 'hans.sjunnesson@gmail.com' }
  s.license  = { :type => 'MIT', :file => 'README.md' }
  s.source   = { :git => 'https://github.com/hsjunnesson/UIViewDrawRectBlock.git' }
                 
  s.description = 'Tired of subclassing UIView just to implement drawRect? ' \
                  'This is a category on UIView to create an instance with a ' \
                  'block for its drawRect.'

  s.platform = :ios
  s.source_files = '*.{h,m}'
end
