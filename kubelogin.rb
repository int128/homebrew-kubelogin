class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.23.0"

  on_macos do
    url "https://github.com/int128/kubelogin/releases/download/v1.23.1/kubelogin_darwin_amd64.zip"
    sha256 "aa60c53038e4a16a758651fdd05fa03ce9c4ac035a8c847a923edac1850e10c6"
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
