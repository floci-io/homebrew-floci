class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.3/floci-darwin-arm64"
      sha256 "eada79f805bb4b3eaba4401d7dd9737ebf4196ee0f68f34eb9308c8733d00a52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.3/floci-linux-arm64"
      sha256 "598d3e2cb5c89aabefe468c3af11024a42cce350f493f8f5d0c08218806f29d6"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.3/floci-linux-amd64"
      sha256 "358d342f543d0782daacd7c58189c0ec34d6c53f89b64c9e45de3e6150574574"
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
