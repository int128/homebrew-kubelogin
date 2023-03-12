# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.27.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.27.0/kubelogin_darwin_amd64.zip"
    sha256 "8c09b54fe2050a5663946d3267955e984039e0de077500a2ea80aea997afc0e8"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.27.0/kubelogin_darwin_arm64.zip"
    sha256 "56841bf44cdf7f49bbaefd7300be8fc13111aba32bcaecf95e175f932eb6e2a9"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.27.0/kubelogin_linux_amd64.zip"
    sha256 "405526cac363387cd3ee53a20024ba4e0b7f8fb26f1ce2956953a502927ade9b"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.27.0/kubelogin_linux_arm64.zip"
    sha256 "3ac06e8499ad00370bf1f873474b91f72bbefa45f2079d681b1911f0477a1e00"
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
