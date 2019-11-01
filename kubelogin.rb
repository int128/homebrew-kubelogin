class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.15.0/kubelogin_darwin_amd64.zip"
  version "v1.15.0"
  sha256 "2abb9488cfbbb359d9de8d8a17e5df99ccb0dc89a6aa04e2d9f9e6a7a1989bc6"
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
