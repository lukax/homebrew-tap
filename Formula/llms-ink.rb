class LlmsInk < Formula
  desc "Turn any link into llms.txt and llms-full.txt for your AI"
  homepage "https://llms.ink"
  url "https://registry.npmjs.org/@lukax/llms-ink/-/llms-ink-0.7.2.tgz"
  sha256 "45a1020324c8c38b536a6e51a3ccfc9e4d56b291a409d2926758a6029167e61f"
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
