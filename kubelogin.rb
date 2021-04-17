class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.23.0"

  on_macos do
    url "https://github.com/int128/kubelogin/archive/v1.23.1.tar.gz"
    sha256 "d56ace0099199dd6b5e32a40dfaf8d80cdb9bf03f0a3c941970cf231ba4bd995"
  end
  on_linux do
    url "https://github.com/int128/kubelogin/releases/download/v1.23.0/kubelogin_linux_amd64.zip"
    sha256 "fe644996b0bc0193d3281262a74d2573a7e41693d5085f384165cfc1a3e15c5d"
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
