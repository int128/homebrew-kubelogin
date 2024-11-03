class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.31.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.0/kubelogin_darwin_amd64.zip"
    sha256 "77691e0a80912750849bf303840b205d263a2ab260f65503ca4a7eed186365a0"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.0/kubelogin_darwin_arm64.zip"
    sha256 "3f887eed9dcd87608df5caa2fb611a181716f516de5183c070aa83687a9c0c7a"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.0/kubelogin_linux_amd64.zip"
    sha256 "6cf3cfaa6b81305ebbc83cf1119fa60c079f6cd9756a9baf4169103b811ef86b"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.31.0/kubelogin_linux_arm64.zip"
    sha256 "e68cd375d07b963c2456b43265499a543eca8332391d80fa482057f295dbd9f2"
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
