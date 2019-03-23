# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TheMovieDB' do
  use_frameworks!

  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'Alamofire', '~> 5.0.0-beta.3'


  def testing_pods
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
  end

  target 'TheMovieDBTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'TheMovieDBUITests' do
    inherit! :search_paths
    testing_pods
  end

end
