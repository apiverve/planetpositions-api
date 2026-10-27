Pod::Spec.new do |s|
  s.name             = 'APIVervePlanetPositions'
  s.version          = '1.2.3'
  s.summary          = 'Planet Positions locates solar system bodies for any observer coordinates on Earth.'
  s.description      = <<-'DESC'
Planet Positions locates solar system bodies for any observer coordinates on Earth. It checks if the sun, moon, or planets sit below the horizon, while paid plans add celestial coordinates and distance.

This iOS/macOS SDK provides a convenient way to access the Planet Positions from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/planetpositions?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/planetpositions-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVervePlanetPositions/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
