class Kubelogin < Formula
  desc "kubectl with OpenID Connect (OIDC) authentication"
  homepage "https://github.com/int128/kubelogin"
  url "https://github.com/int128/kubelogin/releases/download/1.8.2/kubelogin_1.8.2_darwin_amd64.tar.gz"
  version "1.8.2"
  sha256 "2cc83d3c9513259e2b24a519e2fbdd6535b2c282854c54d78d06389f27b7ab5c"

  def install
    bin.install "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-login"
  end

  test do
    system "#{bin}/kubelogin --help"
    system "#{bin}/kubectl-login --help"
  end
end
