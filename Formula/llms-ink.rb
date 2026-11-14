class LlmsInk < Formula
  desc "Turn any link into llms.txt and llms-full.txt for your AI"
  homepage "https://llms.ink"
  url "https://registry.npmjs.org/@lukax/llms-ink/-/llms-ink-0.3.1.tgz"
  sha256 "b605fd4c43efa2c9ab4575e1f622f84e6d068a0e4b67ee7de62931f2d4436815"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/llms-ink --version").strip
    assert_match "llms-full.txt", shell_output("#{bin}/llms-ink --help")
    assert_match "Unknown option", shell_output("#{bin}/llms-ink --bogus 2>&1", 2)
  end
end
