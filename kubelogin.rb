class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.20.1"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "3c8dd763474428c871579bad00d8af55b2151d5260c6b7db350fd563f754ff7a"
  elsif OS.linux?
    kernel = "linux"
    sha256 "1a61572dc76b6ec23c01ab15c7874ce6ae0e8ff470c7c1e7369ff3b2fe3dcdc0"
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
