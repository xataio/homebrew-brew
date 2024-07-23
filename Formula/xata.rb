class Xata < Formula
  desc "Everything you need to get started with Xata"
  homepage "https://xata.io"
  url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/fa4cda37/xata-v0.15.15-fa4cda37-darwin-x64.tar.xz"
  sha256 "c854b515d6f6f5109733f3d2a35a016409f5affbdf7bf3e0f85c3b1a88f80bfa"
  version "0.15.15"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/fa4cda37/xata-v0.15.15-fa4cda37-darwin-arm64.tar.xz"
      sha256 "3f39941b9c7be8907a741bd31db8a9ee1b55ae06720216acc6e93325418ece9e"
    end
  end

  on_linux do
    on_intel do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/fa4cda37/xata-v0.15.15-fa4cda37-linux-x64.tar.xz"
      sha256 "50e65420c8c1a27ddb52fb831a316fa44cf9e414f7304b75140f35b0366bb756"
    end
    on_arm do
      url "https://xata-cli-assets.s3.us-east-1.amazonaws.com/versions/0.15.15/fa4cda37/xata-v0.15.15-fa4cda37-linux-arm.tar.xz"
      sha256 "bb611ec67bc9ec0fff1ac9a1965de904a7f5ea49271c233f78f6a43cdcffab46"
    end
  end

  def install
    inreplace "bin/xata", /^CLIENT_HOME=/, "export XATA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/xata"

    bash_completion.install libexec/"autocomplete-scripts/brew/bash" => "xata"
    zsh_completion.install libexec/"autocomplete-scripts/brew/zsh/_xata"
  end

  def caveats; <<~EOS
    To use the Xata CLI's autocomplete --
      Via homebrew's shell completion:
        1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
            NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                  and called, either explicitly or via a framework like oh-my-zsh.
        2) Then run
          $ xata autocomplete --refresh-cache
      OR
      Use our standalone setup:
        1) Run and follow the install steps:
          $ xata autocomplete
  EOS
  end

  test do
    system bin/"xata", "version"
  end
end
