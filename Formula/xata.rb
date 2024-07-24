class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/07597599/xata-v0.15.15-07597599-darwin-x64.tar.xz"
  sha256 ","
  version "0.15.15"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/07597599/xata-v0.15.15-07597599-darwin-arm64.tar.xz"
      sha256 "3a101e8f6839bab5a31ba21f08ac1d4bfc213f8af3decbe41d9397f6ebb1aab6"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/07597599/xata-v0.15.15-07597599-linux-x64.tar.xz"
      sha256 "58ed00383240c331e472392337fea8b513d7490c8b14cb78dc6d19f69b85e765,"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/07597599/xata-v0.15.15-07597599-linux-arm64.tar.xz"
      sha256 "8e0b6a5072db61be5305fbc026f181e5d380ad3a5565a7a32647e7aeb3bcf4ea"
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

