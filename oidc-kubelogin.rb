# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.30.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.0/kubelogin_darwin_amd64.zip"
    sha256 "e63f0bd1d9c193b2f7efb6419fd7528b7f23f802247e5872ace3440706f0e530"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.0/kubelogin_darwin_arm64.zip"
    sha256 "3382fce6304b656b0cbda76821c0c2f60525507c433947f78d08b22b64371489"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.0/kubelogin_linux_amd64.zip"
    sha256 "3e61379ff750e7e74b64807a8003b755c9733b919a9cae0f22634bd19589b636"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.0/kubelogin_linux_arm64.zip"
    sha256 "b741f4cd5b4c5da7f27ffe83ac33e5e2ecf7a7553d6e7d704264822be392baae"
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
