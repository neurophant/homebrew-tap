class Punchtape < Formula
  desc "External arbiter for AI coding agents: work runs start to finish, with every claim proven"
  homepage "https://punchtape.dev"
  version "0.6.0"
  license "MIT"
  head "https://github.com/neurophant/punchtape.git", branch: "main"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/neurophant/punchtape/releases/download/v0.6.0/punchtape-darwin-amd64"
      sha256 "3fb60103d50a093584b4d0b4c261d4f66f17eae34a6fab3efcd1a7422a591b3d"
    else
      url "https://github.com/neurophant/punchtape/releases/download/v0.6.0/punchtape-darwin-arm64"
      sha256 "68468aa5823b6f739734e88fd4a3a300008ea6ad55d4828ee30748230410229a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/neurophant/punchtape/releases/download/v0.6.0/punchtape-linux-amd64"
      sha256 "80e52955f49d00b2ac3865b4850efc96a6fb1433d3fee2fcde5c8aa7004f5007"
    else
      url "https://github.com/neurophant/punchtape/releases/download/v0.6.0/punchtape-linux-arm64"
      sha256 "c3853c66d9d94382f81f5c005f15c01dd9d780ffab94bc9fbe019246a863e8d8"
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
