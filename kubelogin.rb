class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.14.3/kubelogin_darwin_amd64.zip"
  version "v1.14.3"
  sha256 "6672bcb9e1138b8eb72e13f6f6ee4f2cbcea1d8f6b94c4767e8272e4565839cf"
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
