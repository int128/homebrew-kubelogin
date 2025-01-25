# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.32.1"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.1/kubelogin_darwin_amd64.zip"
    sha256 "5a10828c8f2c5457e7c2de930a1b58e34cda74068206f1d00eaff83488915292"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.1/kubelogin_darwin_arm64.zip"
    sha256 "4ce9d19d23b97fe7218ab895e8149778d4f7f0620972eda737970760aa0fe6b0"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.1/kubelogin_linux_amd64.zip"
    sha256 "71fde8935bd2c43119e9a9f62bf0540c31799387b559aa9a08d93a123ad2b178"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.1/kubelogin_linux_arm64.zip"
    sha256 "0bbf5ab8109bbf6a366aaf6274d939f7065e9aca258edc97676a78036f4c1252"
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
