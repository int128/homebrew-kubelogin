class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.9.0/kubelogin_darwin_amd64.zip"
  version "v1.9.0"
  sha256 "bd0e1ad96d52fae807b2b7a7d5fd5f0e4fe03ce74286962bc8a7f8fa1f74bb2f"
  def install
    bin.install "kubelogin_darwin_amd64" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
