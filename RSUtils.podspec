
Pod::Spec.new do |spec|

  spec.name         = "RSUtils"
  spec.version      = "0.0.2"
  spec.summary      = "Custom library"
  spec.requires_arc = true

  spec.description  = <<-DESC
Manager Custom library
                   DESC

  spec.homepage     = "https://github.com/nguyenhoangha1609/RSUtils"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nguyễn Hà" => "nguyenhoangha.cntt.hp@gmail.com" }

  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"
  spec.swift_version = "4.2"

  spec.source       = { :git => "https://github.com/nguyenhoangha1609/RSUtils.git", :tag => "#{spec.version}" }
  spec.source_files  = "RSUtils.swift}"

end
