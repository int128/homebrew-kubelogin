class Kubelogin < Formula
  desc "A kubectl plugin for Kubernetes OpenID Connect authentication"
  homepage "https://github.com/int128/kubelogin"
  baseurl = "https://github.com/int128/kubelogin/releases/download"
  version "v1.19.0"

  if OS.mac?
    kernel = "darwin"
    sha256 "1f379d57a14024995ba7ec5d2ce4f5aba8448c117189e9f505cf22cf85a01638"
  elsif OS.linux?
    kernel = "linux"
    sha256 "501ad0e02f6b7575233ae0cfa9b02811eb37dfde41977993e44d3589f8ca12db"
  end

  url baseurl + "/#{version}/kubelogin_#{kernel}_amd64.zip"

  def install
    bin.install "kubelogin" => "kubelogin"
    ln_s bin/"kubelogin", bin/"kubectl-oidc_login"
  end

  test do
    system "#{bin}/kubelogin -h"
    system "#{bin}/kubectl-oidc_login -h"
  end

end
