# Homebrew formula for the Mixtape CLI. Lives in the tap repo h42-dev/homebrew-mixtape as Formula/mixtape.rb
# (`brew install h42-dev/mixtape/mixtape`). Written by cli/scripts/release.sh — don't edit the url/sha256 by hand.
class Mixtape < Formula
  desc "Mixtape in your terminal: private chats with sealed songs"
  homepage "https://mixtape-hph42.vercel.app"
  url "https://github.com/h42-dev/mixtape-cli/releases/download/v1.7.0/mixtape-cli-1.7.0.tgz"
  sha256 "6fc6c42a27cd28b15b1dd11ba30ce8ba2a7924b3601b8b21123c5d6f5c6ce78b"
  version "1.7.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def caveats
    <<~EOS
      Sign in with:  mixtape login
      To play YouTube songs right in the terminal:  brew install mpv yt-dlp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mixtape --version")
  end
end
