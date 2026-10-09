class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.3.0/floci-darwin-arm64"
      sha256 "72df8bd9418057b75db0321a9142737e0491c71086d79d9e7fc6b55d2405e97a"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.3.0/floci-darwin-amd64"
      sha256 "adbff6d03645d271bf75d560e25679f295da193ff3e758d78d28c5cf3afa0e67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.3.0/floci-linux-arm64"
      sha256 "a47c4073c8a7881b03d41bfca67e38410e2c473e98f1eee24ea4385027d68f46"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.3.0/floci-linux-amd64"
      sha256 "f4754853bd8165511daab72d63051523afe69f20a276f44f74be7c188bdb8aa0"
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
