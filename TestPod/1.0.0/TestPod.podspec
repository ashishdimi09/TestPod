Pod::Spec.new do |s|
s.name         = "TestPod"
s.version      = "1.0.0"
s.summary      = "Test"
s.description  = "TestPod"
s.homepage     = "https://www.TestPod.io/"
s.license      = ""
s.author       = {"Ashish Das" => "ashish.d@imimobile.com"}
s.platform     = :ios, "9.0"
s.source       = { :http => "https://github.com/ashishdimi09/TestPod/raw/master/TestPod.zip"}
s.vendored_frameworks = "TestPod.framework"
end
