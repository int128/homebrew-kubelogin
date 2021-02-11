class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.22.0"
  
  on_macos do
    url "https://github.com/int128/kubelogin/releases/download/v1.22.0/kubelogin_darwin_amd64.zip"
    sha256 "b87b4ed009c05e93a0ed529dc7e9396a0357b207e375b1b42f12edb04df13bba"
  end
  on_linux do
    url "https://github.com/int128/kubelogin/releases/download/v1.22.0/kubelogin_linux_amd64.zip"
    sha256 "4ce6e6d2f57e2b245bbd7700bd425dd655bae488dc995524a1e70ceda27e5ff9"
  end
    
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
    
end
