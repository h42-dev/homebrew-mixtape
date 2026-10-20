# Homebrew formula for the Mixtape CLI. Lives in the tap repo h42-dev/homebrew-mixtape as Formula/mixtape.rb
# (`brew install h42-dev/mixtape/mixtape`). Written by cli/scripts/release.sh — don't edit the url/sha256 by hand.
class Mixtape < Formula
  desc "Mixtape in your terminal: private chats with sealed songs"
  homepage "https://mixtape-hph42.vercel.app"
  url "https://github.com/h42-dev/mixtape-cli/releases/download/v1.7.5/mixtape-cli-1.7.5.tgz"
  sha256 "1acee43fc632b14b617713825d48d54133b8290706159d59165bc7be54d27428"
  version "1.7.5"

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
