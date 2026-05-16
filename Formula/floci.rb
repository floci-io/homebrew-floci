class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.2/floci-darwin-arm64"
      sha256 "150eebac7189bf80566d8b19c97403c58e29754a8713a0ea178e4ac9b2b7b38e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.2/floci-linux-arm64"
      sha256 "3fd1aadf6e84cc65fc936341c6e1697079c3e5b652705ac9287092b421d6a66b"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.2/floci-linux-amd64"
      sha256 "46b4024fdb96097f71f05e3c4518bca2792884bedd3afd523c054d10181f5330"
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
