# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.31.1"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.1/kubelogin_darwin_amd64.zip"
    sha256 "e8045285a07a20f4c7e28088f68d6f03c34e645b314914bf40c8506281e47219"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.1/kubelogin_darwin_arm64.zip"
    sha256 "6e23883606cb5c794dca97e01082e78381729ee0c4cb7e0690037b70d4f2ca14"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.1/kubelogin_linux_amd64.zip"
    sha256 "aeac2750b9d5f180d2f943d8ca3ac2c06b24391c8d4c57ae4172cdb1120106ed"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.1/kubelogin_linux_arm64.zip"
    sha256 "c94d731b52465a68a03245ac635e89320ba2552a579771c44f8328bb831af5f5"
  else
    odie "Unexpected platform!"
  end

  def install
    bin.install "kubelogin" => "oidc-kubelogin"
    ln_s bin/"oidc-kubelogin", bin/"kubectl-oidc_login"
  end

  test do
    system "#{bin}/oidc-kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
