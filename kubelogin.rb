class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.22.1"

  on_macos do
    url "https://github.com/int128/kubelogin/archive/v1.22.1.tar.gz"
    sha256 "e78515d639579f91588111a2c05da90551f36da7674dc692cb4dbf67f0ff3b9c"
  end
  on_linux do
    url "https://github.com/int128/kubelogin/releases/download/v1.22.1/kubelogin_linux_amd64.zip"
    sha256 "dfbc8a6535178f58c2d96bd8d1061d4688de8c83eb1cae9d0db687224ebc6726"
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
