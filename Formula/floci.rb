class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.0/floci-darwin-arm64"
      sha256 "6fdf3b2f25da9cb9287a10069a19134bb33b227ca4ec5d7f2e7e724e7f6f4ec8"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.0/floci-darwin-amd64"
      sha256 "427c4d3f1cf84ff33872dc06139bdf053cc97b8d1e72e54c0c4cb37f2ba50008"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.0/floci-linux-arm64"
      sha256 "1c3f89885cf80e69c338abafafe9c1fda98ec29d49bd591c27aec20fafbead3e"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.0/floci-linux-amd64"
      sha256 "6a45b23f7b3a9fae9214e1028190c56398dfaf35bdfd3fe2c24c6735be841933"
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
