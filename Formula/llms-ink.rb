class LlmsInk < Formula
  desc "Turn any link into llms.txt and llms-full.txt for your AI"
  homepage "https://llms.ink"
  url "https://registry.npmjs.org/@lukax/llms-ink/-/llms-ink-0.6.0.tgz"
  sha256 "d6858ef8ac51190de56c805b9ee0853f227f357ea3b31e4d71676232a3902253"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/llms-ink --version").strip
    assert_match "llms-full.txt", shell_output("#{bin}/llms-ink --help")
    assert_match "hosted Inspect pilot", shell_output("#{bin}/llms-ink inspect --help")
    assert_match "Unknown option", shell_output("#{bin}/llms-ink --bogus 2>&1", 2)
  end
end
