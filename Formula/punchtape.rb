class Punchtape < Formula
  desc "External arbiter for AI coding agents: work runs start to finish, with every claim proven"
  homepage "https://punchtape.dev"
  version "0.5.1"
  license "MIT"
  head "https://github.com/neurophant/punchtape.git", branch: "main"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/neurophant/punchtape/releases/download/v0.5.1/punchtape-darwin-amd64"
      sha256 "f88f01126ad7119b7a966a360301bd37195d878dee26ce9ba1c4f67ccc27553a"
    else
      url "https://github.com/neurophant/punchtape/releases/download/v0.5.1/punchtape-darwin-arm64"
      sha256 "1a9b32496aaed7f3ee5a570cb514d4c4ab40e5d1b9cbd0bcfbb8ebc0b85fca54"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/neurophant/punchtape/releases/download/v0.5.1/punchtape-linux-amd64"
      sha256 "8309c98f7286113471fa0e3d5a09d4c14163e5bf121d903a93321d5be9b69335"
    else
      url "https://github.com/neurophant/punchtape/releases/download/v0.5.1/punchtape-linux-arm64"
      sha256 "ceb9c4a3d703c5d3a892c87236edc2925efefff41d29494de1ed20845cf26ea0"
    end
  end

  def install
    binary = Dir["punchtape-*"].reject { |f| f.end_with?(".sha256") }.first
    bin.install binary => "punchtape"
  end

  test do
    # без аргументов машина печатает свой контракт и ничего не создаёт
    assert_match "the contract", shell_output("#{bin}/punchtape 2>&1 || true")
  end
end
