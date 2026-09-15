class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.3/floci-darwin-arm64"
      sha256 "0b236ca0bc1cd5c1803eab1c70fa0688894fc0ad7fb54b2cb0879b43a4abe823"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.3/floci-darwin-amd64"
      sha256 "87d34a36daca4883666ba2f3b6e64cb9c7364c782eff53d19e86fe9564ab4164"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.3/floci-linux-arm64"
      sha256 "1c1578ae3bd8a0d3e833dd9004934ed80f72413c2c6a4c48c423d1c5634abb00"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.3/floci-linux-amd64"
      sha256 "f45902db2a1f09b9990048649065e8424332db9c0fdce780529192a019fb77c2"
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
