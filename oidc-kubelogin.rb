# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "v1.25.4"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.4/kubelogin_darwin_amd64.zip"
    sha256 "4d01349c647da0dd43868e5790f2e6bc3e4daaf00a05bc95f55c2ca31548e397"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.4/kubelogin_darwin_arm64.zip"
    sha256 "f5160ad42764d370e599253bab46dfee6e47d381916b376a6b684c9134c60c6d"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.4/kubelogin_linux_amd64.zip"
    sha256 "f62c277aadf11e475620c37cfc6cc2e60c53c9628d39400305e7882c4ab25d3d"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v1.25.4/kubelogin_linux_arm64.zip"
    sha256 "cba7a3f92f86fad21d8b481b8910643b18e5570e886adba73dddbbe54afe5f24"
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
