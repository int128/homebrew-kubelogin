class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.32.2"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.2/kubelogin_darwin_amd64.zip"
    sha256 "611248dacf375aaaa9d2c3a9c11584d66123e2377c884b8499dc4bba1fb2f0cb"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.2/kubelogin_darwin_arm64.zip"
    sha256 "ebe64daadc3e2e5bfed49633256ea04162c489a974c9b0e7b97e87e8b504cfc1"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.2/kubelogin_linux_amd64.zip"
    sha256 "83cd392b0b53cbf4335e3fdbbef6ca1eb26831fb37369e9759169954ea8f7b7b"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.2/kubelogin_linux_arm64.zip"
    sha256 "996b6336bcda807493b13f3b4823981ca4f3444835825bf99eb4c0c749794366"
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
