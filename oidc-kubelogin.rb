# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.25.1"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.1/kubelogin_darwin_amd64.zip"
    sha256 "4d26778eddf61f162724191d5d8db5ff94e9f721fb9f746b6e8db06193cbbc39"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.1/kubelogin_darwin_arm64.zip"
    sha256 "0675b253673b89480db839cfe67c9495c72d9ccdf5c99601fb3412aac57c86e3"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.1/kubelogin_linux_amd64.zip"
    sha256 "d265388f27a4d7ceaa7cc1a7ed6c0297cc5d04aa7022325a4554e46a6f56cc3c"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.1/kubelogin_linux_arm64.zip"
    sha256 "cc1acd86a45055577174dfb16008581b099f237248e1e6b391081999dd1453b7"
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
