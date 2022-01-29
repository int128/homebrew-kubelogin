class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.25.1"

  on_macos do
    url "https://github.com/int128/kubelogin/releases/download/v1.25.1/kubelogin_darwin_amd64.zip"
    sha256 "4d26778eddf61f162724191d5d8db5ff94e9f721fb9f746b6e8db06193cbbc39"
  end
  on_linux do
    url "https://github.com/int128/kubelogin/releases/download/v1.25.1/kubelogin_linux_amd64.zip"
    sha256 "d265388f27a4d7ceaa7cc1a7ed6c0297cc5d04aa7022325a4554e46a6f56cc3c"
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
