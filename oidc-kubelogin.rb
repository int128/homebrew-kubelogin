# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.28.1"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.1/kubelogin_darwin_amd64.zip"
    sha256 "7150c0ce6df9e22f958ea07ac64cafdaef8a5f66ad0abe22fbe7f5fb6dbb677e"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.1/kubelogin_darwin_arm64.zip"
    sha256 "4fbd0fb12e005a563a98704db5a441afbee06cd63373f9342c1caf7bd60e82be"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.1/kubelogin_linux_amd64.zip"
    sha256 "d17dafa1aaa8ede96a81a155cebd7dfd6a0ef6d38c7f76f3d67a57effd94775a"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.1/kubelogin_linux_arm64.zip"
    sha256 "a89b12387c124eb327894f59ac306c61afb9900660e9a5a3b743ff4008d94a77"
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
