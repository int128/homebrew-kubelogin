class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.34.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.0/kubelogin_darwin_amd64.zip"
    sha256 "9ae8d6e4a44b86440992033458f5203eb515d1483cb6c905865bce66237e2c20"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.0/kubelogin_darwin_arm64.zip"
    sha256 "f10cabe0e451ff6b4b4087753a50a0fc92ba6a89875c61ad1439f2abebc0ce9b"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.0/kubelogin_linux_amd64.zip"
    sha256 "9f68bd3fb1427fd12befe492a45a309bcb341d1bdff0d090052cfe3833291529"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.34.0/kubelogin_linux_arm64.zip"
    sha256 "97a0d6884796f208bc408e39f0fdf72a9752490c3dd12194c24389775857564f"
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
