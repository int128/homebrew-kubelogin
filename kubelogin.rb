class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.32.3"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.3/kubelogin_darwin_amd64.zip"
    sha256 "1d7b8d60236b088491cba870def0e79d6437277b5ca789ea5cb8187a82678640"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.3/kubelogin_darwin_arm64.zip"
    sha256 "3a6b7999743529d10ab82d73b6036a0877e3d80e42298c786bc8ed33b8723c6e"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.3/kubelogin_linux_amd64.zip"
    sha256 "c065f95401f96e548a835838aaf0834dba9d347a0e5af2f38664272a66e2d948"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.32.3/kubelogin_linux_arm64.zip"
    sha256 "4de7356c5eda64e5dc8e3a373f5bb99e1736d8edf4383e2d978839c4f6417938"
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
