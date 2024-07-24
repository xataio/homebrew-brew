class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/0be76854/xata-v0.15.15-0be76854-darwin-x64.tar.xz"
  sha256 "7f8a11b5e231572dd2ee7baf017b4e98eea68ac201e85a23830fd725c92e0f90"
  version "0.15.15"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/0be76854/xata-v0.15.15-0be76854-darwin-arm64.tar.xz"
      sha256 "2a0b95029698d5b38931668b54a3d403e57a92eadc4887b94eda32900b3eac18"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/0be76854/xata-v0.15.15-0be76854-linux-x64.tar.xz"
      sha256 "c496e1d24e756072127267232c41341f0a0638b6f2246da159aa92d545d5fbb3"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/0be76854/xata-v0.15.15-0be76854-linux-arm64.tar.xz"
      sha256 "7988b7c1e7e93a749f139506cb457eccba37bdc9738a3f511cf71af9ab51f94d"
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

