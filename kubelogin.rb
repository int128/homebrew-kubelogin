class Kubelogin < Formula
  desc "kubectl with OpenID Connect (OIDC) authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/1.8.1/kubelogin_1.8.1_darwin_amd64.tar.gz"
  version "1.8.1"
  sha256 "fda9dc20d18878a962ffa95d7de28e8ead0dabbcb7dfb8edb967b872ce4cf8b5"

  def install
    bin.install "kubelogin"
    ln_s bin/"kubelogin" bin/"kubectl-login"
  end

  test do
    system "#{bin}/kubelogin --help"
    system "#{bin}/kubectl-login --help"
  end
end
