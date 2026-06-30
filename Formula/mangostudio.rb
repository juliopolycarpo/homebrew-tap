class Mangostudio < Formula
  desc "AI-powered image generation and chat studio"
  homepage "https://github.com/juliopolycarpo/mangostudio"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juliopolycarpo/mangostudio/releases/download/v0.1.0/mangostudio-0.1.0-darwin-arm64.tar.gz"
      sha256 "57e6dbe61c1100442bb191fd1af6e2db37acf48a157a30da50363256c0002d7e"
    end
    on_intel do
      url "https://github.com/juliopolycarpo/mangostudio/releases/download/v0.1.0/mangostudio-0.1.0-darwin-x64.tar.gz"
      sha256 "eb548fbb05105d8d5deb9396ca5a28b753aa7b6083c87f0a3e728534519ff0ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juliopolycarpo/mangostudio/releases/download/v0.1.0/mangostudio-0.1.0-linux-arm64.tar.gz"
      sha256 "8f9753c4d1bf0b03b1cdc5819109cfde97f172bcafad7c776c8da4c4f89b71b0"
    end
    on_intel do
      url "https://github.com/juliopolycarpo/mangostudio/releases/download/v0.1.0/mangostudio-0.1.0-linux-x64.tar.gz"
      sha256 "32b2caacd1e00a1c2238f8ae4c9009cfad4bff113e952016db76c3bef4a3e060"
    end
  end

  def install
    # The binary resolves its frontend sidecar (public/) beside the real
    # executable path, so install the whole flat archive into libexec and
    # expose only the symlinked binary on PATH.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"mangostudio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mangostudio --version")
  end
end
