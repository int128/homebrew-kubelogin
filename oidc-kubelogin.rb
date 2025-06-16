# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.33.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.33.0/kubelogin_darwin_amd64.zip"
    sha256 "a7640609688858d860cf320a2d4ba017217df494a4e3c9ad4d82d30b02049775"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.33.0/kubelogin_darwin_arm64.zip"
    sha256 "fdfdf0eaf03035b4abab345768132da5d1a19e763cf1e383277c13286bb8eebd"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.33.0/kubelogin_linux_amd64.zip"
    sha256 "4043f82a06d687cb6c5a5e770ef0cae49783a7b00a72bde1fc1743b80550a86d"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.33.0/kubelogin_linux_arm64.zip"
    sha256 "2cfb36ca680d169bfbf831e3dbc4a7574d340a42be7b3b1b08f73f48b38f7437"
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
