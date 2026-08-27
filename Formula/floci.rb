class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.1/floci-darwin-arm64"
      sha256 "b998ddecabbe32b5e1d7f468ff6fbb152fc5acfafc608cc4084e899370fba5b9"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.1/floci-darwin-amd64"
      sha256 "1fc446e5f2e9a1b27ddd87ca2edf3cbf01d56301e5f6876fcb2526fb321641f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.1/floci-linux-arm64"
      sha256 "40658a021b1de73c4c379a9624dcf3b89d580c2e6dd4e26b8e77bbc212018c82"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.1/floci-linux-amd64"
      sha256 "de5832eacd09f4576fc4a96a38f517672b85334994bafd173cf17ae6b2701f86"
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
