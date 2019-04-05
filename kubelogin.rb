class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.9.0/kubelogin_darwin_amd64.zip"
  version "v1.9.0"
  sha256 "5093d43b5e2674716308e5abbaa7e25b15bde4a208b2d1975b308f866665a09a"
  def install
    bin.install "kubelogin_darwin_amd64" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
