class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.4/floci-darwin-arm64"
      sha256 "c6c504095778305a6328f1fbbc763f97cc99c6b73edb10060424101bf2dd4e7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.4/floci-linux-arm64"
      sha256 "8a61899545036b4aa8e67bb539c2c7e5bd38ac1f4df568b66629326315091e1b"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.4/floci-linux-amd64"
      sha256 "70ab8340839ce9b1a3820a8a4ac77da4a51567f7fa13935942ab88df582086b7"
    end
  end

  def install
    bin.install Dir["floci*"].first => "floci"
  end

  def caveats
    <<~EOS
      Set AWS_ENDPOINT_URL to point the AWS CLI at Floci:
        export AWS_ENDPOINT_URL=http://localhost:4566

      Quick start:
        floci start
        floci doctor
    EOS
  end

  test do
    system "#{bin}/floci", "version"
  end
end
