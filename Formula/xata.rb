class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/27e21d2e/xata-v0.15.15-27e21d2e-darwin-x64.tar.xz"
  sha256 "3a605ef244eeffc1f5f82269ceb56075aa6f50a26ead34ad1dce3bfd7afcce7b"
  version "0.15.15"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/27e21d2e/xata-v0.15.15-27e21d2e-darwin-arm64.tar.xz"
      sha256 "0f0dc233a4b31a7a56a2f463e4f521938854d1b08c2f1355b6f2eec2d878d501"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/27e21d2e/xata-v0.15.15-27e21d2e-linux-x64.tar.xz"
      sha256 "1f6c4de0378265bd1dac32b13021b51c3ff0922728dd2049f4efd87ed592725b"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/27e21d2e/xata-v0.15.15-27e21d2e-linux-arm64.tar.xz"
      sha256 "e7779c02222b72ce5de120d4e8c01ea6fff215e9831f9ecd927cf022cbfc98ba"
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

