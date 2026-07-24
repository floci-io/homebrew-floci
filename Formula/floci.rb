class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.9/floci-darwin-arm64"
      sha256 "2cfbb939211b05f88c5556c26ab6f2d8252e41b009c44c4f624c5c2c1e4dc27a"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.9/floci-darwin-amd64"
      sha256 "ac58c9cd5805a3d0745b1c61401efc1519ff3c5e59a35991a29a08d1f0b75de5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.9/floci-linux-arm64"
      sha256 "5a6541fe8a0841884640570a74f1ff246cf035e8bcab0e323aa18d7925c1e1a5"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.9/floci-linux-amd64"
      sha256 "54af7037456255eb807d25d46b42162aa37da5cdec9c73c39581c2aebe680923"
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
