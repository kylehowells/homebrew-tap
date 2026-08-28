class GraniteMlx < Formula
  desc "Native Granite Speech transcription for Apple Silicon"
  homepage "https://github.com/kylehowells/Granite-MLX"
  url "https://github.com/kylehowells/Granite-MLX/releases/download/0.1.1/granite-mlx-0.1.1-macos-arm64.tar.gz"
  sha256 "4a2f99758253ac2ae04107fb2e4e18f7008813aea7aac7dac26fe232a8e2ad45"
  license any_of: ["Apache-2.0", "MIT"]

  depends_on arch: :arm64
  depends_on "ffmpeg"
  depends_on macos: :sonoma

  def install
    libexec.install "granite-mlx", "mlx.metallib", "README.md",
                    "LICENSE", "LICENSE-APACHE", "LICENSE-MIT"
    bin.install_symlink libexec/"granite-mlx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/granite-mlx --version")
    assert_match "Run Granite Speech 5.0", shell_output("#{bin}/granite-mlx --help")

    models = shell_output("#{bin}/granite-mlx models list --json")
    assert_match "apache-q8", models
    assert_match '"cache_state"', models
  end
end
