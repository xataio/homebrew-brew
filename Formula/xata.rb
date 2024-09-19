class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.10/de0148dd/xata-v0.16.10-de0148dd-darwin-x64.tar.xz"
  sha256 "7ffb57cfdc1db6b1f4138ee440bc478571639e6e4492d89e01857d1bc5334193"
  version "0.16.10"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.10/de0148dd/xata-v0.16.10-de0148dd-darwin-arm64.tar.xz"
      sha256 "fd1f4c436b968b1e96aadf0ac902759acc5bb47bfb371754819fb04828d886d4"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.10/de0148dd/xata-v0.16.10-de0148dd-linux-x64.tar.xz"
      sha256 "80841025ebdc03937d58d950e35eedfc8dbef7953830c34064ec598abe3597ce"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.10/de0148dd/xata-v0.16.10-de0148dd-linux-arm64.tar.xz"
      sha256 "a44088b321a79d722c27fbe6bbad99dfb5fce9fd480691c0db9e897de791f016"
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

