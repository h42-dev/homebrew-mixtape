# Homebrew formula for the Mixtape CLI. Lives in the tap repo h42-dev/homebrew-mixtape as Formula/mixtape.rb
# (`brew install h42-dev/mixtape/mixtape`). Written by cli/scripts/release.sh — don't edit the url/sha256 by hand.
class Mixtape < Formula
  desc "Mixtape in your terminal: private chats with sealed songs"
  homepage "https://mixtape-hph42.vercel.app"
  url "https://github.com/h42-dev/mixtape-cli/releases/download/v1.7.7/mixtape-cli-1.7.7.tgz"
  sha256 "da4592edb94fe8df8a436ed5c1448672d39798574db6df1c6afb1617a6b87083"
  version "1.7.7"

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
