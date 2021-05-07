class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.23.0"

  on_macos do
    url "https://github.com/int128/kubelogin/archive/v1.23.2.tar.gz"
    sha256 "205afb33a20d4ee87c16678b8e184a7541740c8b2aa7005511cd24fdc34394eb"
  end
  on_linux do
    url "https://github.com/int128/kubelogin/releases/download/v1.23.1/kubelogin_linux_amd64.zip"
    sha256 "69dc162ac8bac35dd1078410f752c92137d8fb461a00d2e23ae3fa279bb3596e"
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
