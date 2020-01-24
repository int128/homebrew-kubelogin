class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.16.0/kubelogin_darwin_amd64.zip"
  version "v1.16.0"
  sha256 "ff3bd8061fcf7e8e24d2ff2a8a2f00ddb38b09afc17a0c48d8b3f904f21cac0b"
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
