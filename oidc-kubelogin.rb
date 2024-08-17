# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.29.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.29.0/kubelogin_darwin_amd64.zip"
    sha256 "86bde0a743aaba019e9bd51d1cb1fe8f2d458bda094ac327be21a1c63d4a8abe"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.29.0/kubelogin_darwin_arm64.zip"
    sha256 "323e7781a31146fdaface0b2137142a8f7928c655ac8ab8bc6f4ea258a110655"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.29.0/kubelogin_linux_amd64.zip"
    sha256 "60b64c524ff525baa6cbbf0dcd40aa325cb653c0f8000d9ae40e33b1a98d1159"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.29.0/kubelogin_linux_arm64.zip"
    sha256 "d67ffbf4ae67eb830f70f332f4f8ac3482d7cf0f7594828dc3f704fad4ea29a8"
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
