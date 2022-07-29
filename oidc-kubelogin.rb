# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.25.2"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.2/kubelogin_darwin_amd64.zip"
    sha256 "1b1b9c767e099266a842000a082c38cd5e88d5578c14b79ea284e0bf47b67a94"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.2/kubelogin_darwin_arm64.zip"
    sha256 "70dc2cb8f894907766f86220fa33fc1b8a2b6f8a7f47e3517838f51d3db548ea"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.2/kubelogin_linux_amd64.zip"
    sha256 "913341c90cd678ba3b7b1679d350437db9ec5779ee364858e5dea33f94c720c2"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.2/kubelogin_linux_arm64.zip"
    sha256 "9e74d07c0d7cdcf114e7458f37a67cd9a9aacdec2f848032b50d26cf13407a59"
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
