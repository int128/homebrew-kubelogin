class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.19.2"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "02a5605d6ecf26a825d8babbe0c68bebf68ef44c572a6b25f9e87374536cacf4"
  elsif OS.linux?
    kernel = "linux"
    sha256 "c57a37a5b8c883f871e81c452b664b2120dc4aa3d2c497dd1584db1fe503f22f"
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
