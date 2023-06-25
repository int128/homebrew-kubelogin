# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.28.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.0/kubelogin_darwin_amd64.zip"
    sha256 "8169c6e85174a910f256cf21f08c4243a4fb54cd03a44e61b45129457219e646"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.0/kubelogin_darwin_arm64.zip"
    sha256 "322546af4d32ad1dc3037b0d589aec8957dc7dd595f2f6df5738ac6ccf63f33f"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.0/kubelogin_linux_amd64.zip"
    sha256 "83282148fcc70ee32b46edb600c7e4232cbad02a56de6dc17e43e843fa55e89e"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.0/kubelogin_linux_arm64.zip"
    sha256 "70aa444fd32b7337bb98f43278f6321426f7f4e644e64974e3ad1fb389484c54"
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
