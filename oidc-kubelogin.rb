# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.25.3"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.3/kubelogin_darwin_amd64.zip"
    sha256 "713416fd9d7d9ac0903900a3cb9e98f04187bfec39667f391fedaa8825f9849f"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.3/kubelogin_darwin_arm64.zip"
    sha256 "93910aa264a10475c33ca98abdb5d78ff6767c45712fa7f080bf8902700e6e02"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.3/kubelogin_linux_amd64.zip"
    sha256 "9b4c96cdf623b7d25fb1a6ce45c2b3fa5260fd6ef0f08c89ac05cb00b603744f"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.3/kubelogin_linux_arm64.zip"
    sha256 "a73eb0b7f0481ab55d24064fb5a368ec749ee649c89c8ef79a71e831073fe8a4"
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
