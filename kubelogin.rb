class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.32.4"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.4/kubelogin_darwin_amd64.zip"
    sha256 "1ca78e3e5e743fe2d2a29ae53709c477e4412ef6fbd81b69c7963db137e91056"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.4/kubelogin_darwin_arm64.zip"
    sha256 "d9c5ecca60f8a0da0e4e34a56ffdb631d9d2598f1466741dc4af4867ba565338"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.4/kubelogin_linux_amd64.zip"
    sha256 "667f3b4c753d52e45898e77865a0bb25c9741c860a6ea30e087c93090872041a"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.4/kubelogin_linux_arm64.zip"
    sha256 "718c74a48f0148888f2ffa1aa16be5eaf5ea0a66fe843bc3d1f3d63d36ed9448"
  else
    odie "Unexpected platform!"
  end

  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end

  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end
end
