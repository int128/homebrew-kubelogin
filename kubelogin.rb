class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.14.0/kubelogin_darwin_amd64.zip"
  version "v1.14.0"
  sha256 "d5c35a172b35f4df33513a67e61ace832c37be1dd75c3217e0aa1c7f52a9e77b"
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
