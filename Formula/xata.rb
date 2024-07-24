class Xata < Formula
  desc Everything you need to get started with Xata
  homepage https://xata.io
  url ${CLI_MAC_INTEL_DOWNLOAD_URL}
  sha256 3
  version 2
  version_scheme 1

  on_macos do
    on_arm do
      url ${CLI_MAC_INTEL_DOWNLOAD_URL}
      sha256 4
    end
  end

  on_linux do
    on_intel do
      url ${CLI_MAC_INTEL_DOWNLOAD_URL}
      sha256 5
    end
    on_arm do
      url ${CLI_MAC_INTEL_DOWNLOAD_URL}
      sha256 6
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

