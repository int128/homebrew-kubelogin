# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.34.1"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.1/kubelogin_darwin_amd64.zip"
    sha256 "ab30b3c7b84f5185e2c39ff4a7e7569fb227e9f8b88e2f49f5a35bb7ade6e201"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.1/kubelogin_darwin_arm64.zip"
    sha256 "154629cb4353255f17b606237b7bca62593ff180dfc6d9a717d1ce20cf531f06"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.1/kubelogin_linux_amd64.zip"
    sha256 "018226f75b7f5f3223e5d46df3af746a778315fa2ea10c422cd4ead086173c96"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.1/kubelogin_linux_arm64.zip"
    sha256 "06a2fee7e82b2676c5772a06e874947d5f88a0b2857d29a8447f012101df6fe1"
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
