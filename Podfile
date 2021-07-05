# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
use_frameworks!

workspace 'ZWallet'

def common_dependency
  pod 'Kingfisher'
end

target 'App' do
  pod 'Moya'
  pod 'netfox', :configurations => ['Debug']
  common_dependency
end

target 'Core' do
  project '../Module/Core/Core'

  pod 'Moya'
  common_dependency
end

target 'History' do
  project '../Module/History/History'
a
  common_dependency
end

target 'Home' do
  project '../Module/Home/Home'

  common_dependency
end

target 'Login' do
  project '../Module/Login/Login'
end

target 'Register' do
  project '../Module/Register/Register'
end

target 'AddPhone' do
  project '../Module/AddPhone/AddPhone'
end

target 'Confirmation' do
  project '../Module/Confirmation/Confirmation'
end

target 'EditProfile' do
  project '../Module/EditProfile/EditProfile'
end

target 'Otp' do
  project '../Module/Otp/Otp'
end

target 'Pin' do
  project '../Module/Pin/Pin'
end

target 'PinConfirmation' do
  project '../Module/PinConfirmation/PinConfirmation'
end

target 'Profile' do
  project '../Module/Profile/Profile'
end

target 'Receiver' do
  project '../Module/Receiver/Receiver'
end

target 'SuccessTransfer' do
  project '../Module/SuccessTransfer/SuccessTransfer'
end

target 'TopUp' do
  project '../Module/TopUp/TopUp'
end

target 'TopupCentre' do
  project '../Module/TopupCentre/TopupCentre'
end

target 'Transfer' do
  project '../Module/Transfer/Transfer'
end