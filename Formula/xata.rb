class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.11/8497f35a/xata-v0.16.11-8497f35a-darwin-x64.tar.xz"
  sha256 "b998b3e75e8bdfb6c0d68c277e4f84b1cfefe407249b7b4e6c6474101d1eb1b1"
  version "0.16.11"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.11/8497f35a/xata-v0.16.11-8497f35a-darwin-arm64.tar.xz"
      sha256 "755da6d7a88fd1eb16cef4b1e10048cc33988621b5254d68ee6dc583d73c46fd"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.11/8497f35a/xata-v0.16.11-8497f35a-linux-x64.tar.xz"
      sha256 "cad7019fe59a85044dd61ae4890c05da2e6f25c8b1ead4399682cceda74e6223"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.11/8497f35a/xata-v0.16.11-8497f35a-linux-arm64.tar.xz"
      sha256 "f2f00f08c664b87306fdadad71aa7e73b2edf8bf65bab971aec5e8fb75f056eb"
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

