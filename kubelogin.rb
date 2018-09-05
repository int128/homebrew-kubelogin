class Kubelogin < Formula
  desc "kubectl with OpenID Connect (OIDC) authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/1.6/kubelogin_1.6_darwin_amd64.tar.gz"
  version "1.6"
  sha256 "1dea514150979424ac0c7019253e4a58533e5ec1bc629241ff657a006de3a1b7"

  def install
    bin.install "kubelogin"
  end

  test do
    system "#{bin}/kubelogin --help"
  end
end
