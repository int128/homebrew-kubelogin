class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.26.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.26.0/kubelogin_darwin_amd64.zip"
    sha256 "1086814f19fb713278044f275c006d3d111d11ca6d92f2348af7f3eff78eecf1"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.26.0/kubelogin_darwin_arm64.zip"
    sha256 "de8098c84dd761acce1f98f80ea276088795e413049660589ad569b1e7d42726"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.26.0/kubelogin_linux_amd64.zip"
    sha256 "d75d0d1006530f14a502038325836097b5cc3c79b637619cf08cd0b4df5b3177"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.26.0/kubelogin_linux_arm64.zip"
    sha256 "d1e157e0e9daf4f1418dc071c5fed0232c9a002ebf728ff2347e1aba8c74009d"
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
