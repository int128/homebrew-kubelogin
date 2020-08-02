class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.20.0"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "1ce071a80aa8aa6cd2c80a6c900e109d1a7b451907952854330bc252e4196bf3"
  elsif OS.linux?
    kernel = "linux"
    sha256 "c0063f8060e969fa8c8fcfb4e37f2bbe35e7537cdbc82dd0535c96098953c6a6"
  end 
   
  url baseurl + "/#{version}/kubelogin_#{kernel}_amd64.zip"
    
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
    
end
