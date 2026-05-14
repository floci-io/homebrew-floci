class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "{{VERSION}}"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/{{VERSION}}/floci-darwin-arm64"
      sha256 "{{SHA256_DARWIN_ARM64}}"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/{{VERSION}}/floci-darwin-amd64"
      sha256 "{{SHA256_DARWIN_AMD64}}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/{{VERSION}}/floci-linux-arm64"
      sha256 "{{SHA256_LINUX_ARM64}}"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/{{VERSION}}/floci-linux-amd64"
      sha256 "{{SHA256_LINUX_AMD64}}"
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
