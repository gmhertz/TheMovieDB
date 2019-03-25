platform :ios, '10.0'

source 'https://github.com/CocoaPods/Specs.git'

target 'TheMovieDB' do
  use_frameworks!

  pod 'Kingfisher'
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'RxDataSources', '~> 3.0'
  pod 'Alamofire', '~> 5.0.0-beta.3'
  pod 'SnapKit', '~> 4.0.0'


  target 'TheMovieDBTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
    pod 'Quick'
    pod 'Nimble'
    pod 'Nimble-Snapshots'
  end

  target 'TheMovieDBUITests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
    pod 'Quick'
    pod 'Nimble'
    pod 'Nimble-Snapshots'
  end

end
