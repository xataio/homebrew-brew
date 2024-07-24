class Xata < Formula
  desc Everything you need to get started with Xata
  homepage https://xata.io
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions//ed5a53b2/xata-v-ed5a53b2-darwin-x64.tar.xz"
  sha256 ""
  version ""
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions//ed5a53b2/xata-v-ed5a53b2-darwin-arm64.tar.xz"
      sha256 ""
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions//ed5a53b2/xata-v-ed5a53b2-linux-x64.tar.xz"
      sha256 ""
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions//ed5a53b2/xata-v-ed5a53b2-linux-arm64.tar.xz"
      sha256 ""
    end
  end

  def install
    inreplace bin/xata, /^CLIENT_HOME=/, export XATA_OCLIF_CLIENT_HOME=#{lib/client}nCLIENT_HOME=
    libexec.install Dir[*]
    bin.install_symlink libexec/bin/xata
  end

  test do
    system bin/xata, version
  end
end

