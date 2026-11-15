class LlmsInk < Formula
  desc "Turn any link into llms.txt and llms-full.txt for your AI"
  homepage "https://llms.ink"
  url "https://registry.npmjs.org/@lukax/llms-ink/-/llms-ink-0.8.0.tgz"
  sha256 "592f9af97d61c3289f12bf4db42f28d7909bd2f73cf3085c60ce2617b2727446"
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
