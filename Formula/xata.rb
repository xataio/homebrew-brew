class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15//xata-v0.15.15--darwin-x64.tar.xz"
  sha256 ","
  version "0.15.15"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15//xata-v0.15.15--darwin-arm64.tar.xz"
      sha256 "24292ec373b4153eb889d22d0de9b93f2ba524df"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15//xata-v0.15.15--linux-x64.tar.xz"
      sha256 "65fecdf847d254bdf80bc040d354e77be5a3024a8cc982ff811144b42648d655  xata-v0.15.15-bd033e61-linux-arm.tar.xz,"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15//xata-v0.15.15--linux-arm64.tar.xz"
      sha256 "9c091dc3e3bd080feedb0720363790bbdbec7cb229991724bd73c170301f68c1  xata-v0.15.15-bd033e61-linux-arm64.tar.xz"
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

