class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.14.4/kubelogin_darwin_amd64.zip"
  version "v1.14.4"
  sha256 "3b8795f70e8e20d07e4821e490fead2446d22cd27e9705b3a3a442af92ba0241"
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
