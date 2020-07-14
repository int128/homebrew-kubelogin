class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.19.4"
  
  if OS.mac?
    kernel = "darwin"
    sha256 "1b23f53f45639c451093d47ba130882b7de8de5d5c22634e35dd7fbaa4f8a766"
  elsif OS.linux?
    kernel = "linux"
    sha256 "8273b6426d8f29e357000b9e7e7c70c30d40d9c343e21408a32be612b15a69eb"
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
