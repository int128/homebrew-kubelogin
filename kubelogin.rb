class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.21.0"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "5eeb96ef901cd427054de8256a979ac76df1eb30711fc978385c7e334f21025a"
  elsif OS.linux?
    kernel = "linux"
    sha256 "e0022c7f49a8626be22400910c87b778162939719068b2800649f1c10186b672"
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
