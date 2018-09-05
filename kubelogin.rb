class Kubelogin < Formula
  desc "kubectl with OpenID Connect (OIDC) authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/1.6/kubelogin_1.6_darwin_amd64.tar.gz"
  version "1.6"
  sha256 "97ab829abbbca29a3fe22cb11c91834a71bacd3d2a83ba2441b750b79d06936d"

  def install
    bin.install kubelogin
  end

  test do
    system "#{bin}/kubelogin --help"
  end
end
