class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.19.3"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "7f7b63400b32d2416457ebc64f1b4d70d1351936b2b06f3e5684794338f0f353"
  elsif OS.linux?
    kernel = "linux"
    sha256 "4be97b6e8814f87f1c2575e517399d4d7fb5fa2b387cf42234052574ae96959e"
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
