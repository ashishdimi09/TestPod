Pod::Spec.new do |s|
s.name         = "PodTest"
s.version      = "1.0.0"
s.summary      = "Test"
s.description  = "PodTest"
s.homepage     = "https://www.PodTest.io/"
s.license      = { :type => 'MIT', :text => 'Permission is hereby granted ...' }
s.author       = {"Ashish Das" => "ashish.d@imimobile.com"}
s.platform     = :ios, "9.0"
s.source       = { :http => "https://github.com/ashishdimi09/TestPod/raw/master/PodTest.zip" }
s.vendored_frameworks = "PodTest.framework"
end
