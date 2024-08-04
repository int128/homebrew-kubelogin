# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.28.2"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.2/kubelogin_darwin_amd64.zip"
    sha256 "1909dab8b77b45de278931f816080ab58e20da701b16673b7d534ce175eae722"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.2/kubelogin_darwin_arm64.zip"
    sha256 "ac98489295439b0b0f8ce497c1968ecbf2042fd241757dbb02cbacae2ad3efb9"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.2/kubelogin_linux_amd64.zip"
    sha256 "6bf51e2443ae750cc8db76a5e1b828b2bc1db31bd9b69146ab4efcecfc1395cc"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.28.2/kubelogin_linux_arm64.zip"
    sha256 "f315f25e5cbf21e63f62ae2d4c4922a30cc8f6e6ceec9993733a562986b5cedb"
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
