class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.6/floci-darwin-arm64"
      sha256 "6ad447161fa1bf9976ccc1303dd2b8040623ea7ad1b7ec0193d4f72ffb836ca7"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.6/floci-darwin-amd64"
      sha256 "e4ad30c866a15fef3a3727e32b2d56457d7973fe56d58d84b764163e160f74b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.6/floci-linux-arm64"
      sha256 "331a824ca01f9946e4737ba33f4efc4bb8b2fe13bf2a83b8898a865329841faf"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.6/floci-linux-amd64"
      sha256 "f409848cb3515de7dd10d90c8377dca0a8d6db8ec12c1105202321f0edb9e59a"
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
