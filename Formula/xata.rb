class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/34c20746/xata-v0.15.15-34c20746-darwin-x64.tar.xz"
  sha256 ","
  version "0.15.15"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/34c20746/xata-v0.15.15-34c20746-darwin-arm64.tar.xz"
      sha256 "140144baca3b6a78b706a459248f2dfd53efd0da"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/34c20746/xata-v0.15.15-34c20746-linux-x64.tar.xz"
      sha256 "ba83dbfc51e79bc53e11504675eadf3e305d993a44730b36b0e1cbf4f683e424,"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/34c20746/xata-v0.15.15-34c20746-linux-arm64.tar.xz"
      sha256 "604f09503ff638bbfe75604cc4dcbaac6d9ee0f6602459dc2aec27e7b0572114"
    end
  end

  def install
    inreplace "bin/xata", /^CLIENT_HOME=/, "export XATA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/xata"
  end

  test do
    system bin/"xata", "version"
  end
end

