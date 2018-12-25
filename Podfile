workspace 'cleanswapi'
platform :ios, '12.0'
use_frameworks!

def common
    pod 'Alamofire', '4.8.0'
end

target 'cleanswapi' do
    project 'cleanswapi/cleanswapi.xcodeproj'
    
    common
end

target 'Services' do
  project 'Services/Services.xcodeproj'
  
  common
end
