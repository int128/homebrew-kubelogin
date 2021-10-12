# Renaming to oidc-kubelogin to prevent conflicts, e.g. with https://github.com/Azure/kubelogin
class OidcKubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  version "1.24.0"

  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v#{version}/kubelogin_darwin_amd64.zip"
    sha256 "7bb080e2bd3928ae0cd275baede6e1fcc4a1e8252d15598254cda609cb0095f3"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v#{version}/kubelogin_darwin_arm64.zip"
    sha256 "1c3c4bec277e31fd3c9348495d769c89175e210cd6507e54c873726bf6070d0c"
  when OS.linux? && Hardware::CPU.intel?
    url "https://github.com/int128/kubelogin/releases/download/v#{version}/kubelogin_linux_amd64.zip"
    sha256 "658499b338b8cee7c622130d68405a55b4c4051ba43f7c841cb3f3d9364b3292"
  when OS.linux? && Hardware::CPU.arm?
    url "https://github.com/int128/kubelogin/releases/download/v#{version}/kubelogin_linux_arm64.zip"
    sha256 "45cc255a494296bc8d3ed453e7d6e35ebe2e1a58e2369ba1d15fddecc3c29630"
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
