class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.19.2-beta.1"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "c02bb615d76134ef12c3fc3aa8d9786b5fb8e51ded93c70bcea56cb824242b2d"
  elsif OS.linux?
    kernel = "linux"
    sha256 "0a3699ae34ee9376da4a4958294766f9f2278a88c3ac1934eabb746c7fbbc699"
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
