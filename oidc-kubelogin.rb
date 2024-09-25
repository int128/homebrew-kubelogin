# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.30.1"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.1/kubelogin_darwin_amd64.zip"
    sha256 "d86daf251d5049bd67aac448892538bbaa74d55b0c3fcd8175f2ef016aeecfd2"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.1/kubelogin_darwin_arm64.zip"
    sha256 "483fbf76d32838588c2ae9a9fa4d54ebdf0783d4f62d39da6b628ae61487fc90"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.1/kubelogin_linux_amd64.zip"
    sha256 "36297a69b10664003ec8c9ca53fa56c37b72596cc104a9b55e7145542683532b"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.30.1/kubelogin_linux_arm64.zip"
    sha256 "97e59a21e95c7229bfedbbeed4d828aabb80fc140954b33aaa00320c74a6227a"
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
