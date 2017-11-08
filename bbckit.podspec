
Pod::Spec.new do |s|
  s.name             = 'bbckit'
  s.version          = '0.1.2'
  s.summary          = 'A useful kit for BBCTeam.'


  s.description      = <<-DESC
                        *我实在装不下去了，咱们还是用中文写吧。
                        *主要分UI和Foundation两部分，都是基于分类写的方便开发使用的组件，谁用谁知道。
                        DESC

  s.homepage         = 'https://github.com/carusd/bbckit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'carusd' => 'carusd@yy.com' }
  s.source           = { :git => 'https://github.com/carusd/bbckit.git', :tag => s.version.to_s, :submodules => true }

  s.ios.deployment_target = '7.0'

  s.source_files = 'bbckit/{Foundation,UI}/**/*.{h,m}'

#  s.subspec 'Foundation' do |ss|
#    ss.source_files = 'BBCKitRelease/Foundation/**/*.{h,m}'
#    ss.public_header_files = 'BBCKitRelease/Foundation/bbc_foundation.h'
#  end

#  s.subspec 'UI' do |ss|
#    ss.source_files = 'BBCKitRelease/UI/**/*.{h.m}'
#    ss.public_header_files = 'BBCKitRelease/UI/bbc_ui.h'
#    ss.ios.frameworks = 'MobileCoreServices', 'ImageIO', 'AssetsLibrary', 'Photos'
#  end

end
