Pod::Spec.new do |spec|
    spec.name         = 'KPGallery'
    spec.version      = '1.0.0'
    spec.osx.deployment_target = "10.9"
    spec.ios.deployment_target = "8.0"
    spec.tvos.deployment_target = "9.0"
    spec.watchos.deployment_target = "2.0"
    spec.summary      = 'Nice gallery visualizations for images.'
    spec.description  = 'The KPGallery is a completely customizable gallery that can be used in any  iOS,tvOS,macOS app.'
    spec.author       = { "Jose Garfias Lopez" => "jose@karmapulse.com" }
    spec.homepage     = 'http://karmapulse.com'
    spec.license      = { :type => 'MIT', :file => 'LICENSE.md' }
    spec.source       = { :path => '.' }
    spec.source_files = 'Sources/*.swift'
    spec.social_media_url = 'https://twitter.com/garfiaslopez'
    #spec.documentation_url = 'http://Karmapulse.com/KPGallery/api/'
end
