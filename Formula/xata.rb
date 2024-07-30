class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.1/0c18aa58/xata-v0.16.1-0c18aa58-darwin-x64.tar.xz"
  sha256 "7210ff11f128bbf9e852fca98ef27bb5537ea1042871198aeb53b6ec61d95d9c"
  version "0.16.1"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.1/0c18aa58/xata-v0.16.1-0c18aa58-darwin-arm64.tar.xz"
      sha256 "e5ce1132dd05f2b17f3db6e802a47893dcb17b5d996419805e785735508a9435"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.1/0c18aa58/xata-v0.16.1-0c18aa58-linux-x64.tar.xz"
      sha256 "299774c7714b6e02e362cc307e2d4b7cd349d252c46daec035e09342a576deec"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.16.1/0c18aa58/xata-v0.16.1-0c18aa58-linux-arm64.tar.xz"
      sha256 "1fb10b1df320f1118760c69ba7fe4d3623b04f16c527a0263dadd6c98fc61728"
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

