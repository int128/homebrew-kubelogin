class Kubelogin < Formula
  desc "kubectl with OpenID Connect (OIDC) authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/1.7/kubelogin_1.7_darwin_amd64.tar.gz"
  version "1.7"
  sha256 "44954b8cb84ff9aa403c881eb97784559c8aa4803061ef3df76267cb1c4a2a5b"

  def install
    bin.install "kubelogin"
  end

  test do
    system "#{bin}/kubelogin --help"
  end
end
