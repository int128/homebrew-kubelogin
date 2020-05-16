class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.19.1"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "51806d291e69cd4dce54af7bb03adf76a55397741ea00fee4d845718a171ddc0"
  elsif OS.linux?
    kernel = "linux"
    sha256 "3bfe06b8d1935f4276335c7c7d08945f5fcb5735b9d74701663f88908e7edef7"
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
