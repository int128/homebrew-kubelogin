class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.32.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.0/kubelogin_darwin_amd64.zip"
    sha256 "ffeab2f789d81147ccf94eac4bf7d79238e7c85fa072b0e0036325db7548ff99"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.0/kubelogin_darwin_arm64.zip"
    sha256 "d18f9ba635cd7fb294df2835d772daeec36dacb780e19d1da9b45b8fc7a325a1"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.0/kubelogin_linux_amd64.zip"
    sha256 "84dd9328962ad96bcb37f02391e74351c2b388df5f3eefbbf2385c87e5fecbc5"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.0/kubelogin_linux_arm64.zip"
    sha256 "5700c9dd73e738f57599f4d9e9fe8f18f64d4884467dfe15cc1f0e3c48050596"
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
