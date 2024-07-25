class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.0/9b2b2e9b/xata-v0.16.0-9b2b2e9b-darwin-x64.tar.xz"
  sha256 "67a7032c586dad347c907358bd012191869f635a69364d5f5d0341ac4d86bc0d"
  version "0.16.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.0/9b2b2e9b/xata-v0.16.0-9b2b2e9b-darwin-arm64.tar.xz"
      sha256 "ab30a8665e74517cd7f49961ff10c3624cbfc3e80231aba5f45fbd302485d23f"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.0/9b2b2e9b/xata-v0.16.0-9b2b2e9b-linux-x64.tar.xz"
      sha256 "323273852040f26c13ef8c7f7b96fb44c632233d39664dbdf3afa6143c65ab04"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.0/9b2b2e9b/xata-v0.16.0-9b2b2e9b-linux-arm64.tar.xz"
      sha256 "cf48d1d164cd87f2d22686fe803af73e792f42d1778d0f42ab075f9f6d6e1098"
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

