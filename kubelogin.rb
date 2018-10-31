class Kubelogin < Formula
  desc "kubectl with OpenID Connect (OIDC) authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/1.8/kubelogin_1.8_darwin_amd64.tar.gz"
  version "1.8"
  sha256 "f0151ffd18effdc017a813ef669539c6fc25c5e0e1198db4378d1e09558dfa8d"

  def install
    bin.install "kubelogin"
  end

  test do
    system "#{bin}/kubelogin --help"
  end
end
