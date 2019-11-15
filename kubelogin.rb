class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.15.1/kubelogin_darwin_amd64.zip"
  version "v1.15.1"
  sha256 "94c1d030a3e26bd14d50e2cfd4e47c49ec654a85b9632be88326eafcfc49c4eb"
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
