class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/v1.14.1/kubelogin_darwin_amd64.zip"
  version "v1.14.1"
  sha256 "b88c9bf44da92e46d3feed1888f9852aace3b85f535b8a783710b98750c65b67"
  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end
  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
