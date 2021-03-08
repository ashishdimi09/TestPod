Pod::Spec.new do |s|
s.name         = "Lemnisk"
s.version      = "2.3.0"
s.summary      = "Test"
s.description  = "Lemnisk Test"
s.homepage     = "https://www.lemnisk.com/"
s.license      = { :type => 'MIT', :text => 'Permission is hereby granted ...' }
s.author       = {"Somanath Reddy" => "somanath.r@lemnisk.com"}
s.platform     = :ios, "10.0"

s.source       = { :http => "https://github.com/ashishdimi09/TestPod/releases/download/v2.2.1/Lemnisk.zip" }
s.vendored_frameworks = "Lemnisk.xcframework"

s.subspec 'NotificationServiceExtension' do |ns|
ns.source       = { :http => "https://github.com/ashishdimi09/TestPod/releases/download/v2.2.1/LemniskRichNotification.zip" }
ns.vendored_frameworks = "LemniskRichNotification.xcframework"
end
s.subspec 'NotificationContentExtension' do |nc|
nc.source       = { :http => "https://github.com/ashishdimi09/TestPod/releases/download/v2.2.1/LemniskNotificationContent.zip" }
nc.vendored_frameworks = "LemniskNotificationContent.xcframework"
end
end