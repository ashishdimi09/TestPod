Pod::Spec.new do |s|
s.name         = "NotificationServiceExtension"
s.version      = "2.2.1"
s.summary      = "Test"
s.description  = "Lemnisk Test"
s.homepage     = "https://www.lemnisk.com/"
s.license      = { :type => 'MIT', :text => 'Permission is hereby granted ...' }
s.author       = {"Somanath Reddy" => "somanath.r@lemnisk.com"}
s.platform     = :ios, "10.0"
s.source       = { :http => "https://github.com/ashishdimi09/TestPod/releases/download/v2.2.1/LemniskRichNotification.zip" }
s.vendored_frameworks = "LemniskRichNotification.xcframework"
end