class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.5/floci-darwin-arm64"
      sha256 "049a2545a1d8f92dd671bf423036af49121bff72158fd7b3c88fd691de6c680d"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.5/floci-darwin-amd64"
      sha256 "006fb328580a50533ba35db2ac89834a9b3e5ad221540d98460b868c63c962b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.5/floci-linux-arm64"
      sha256 "66ccabb05dda2cbf4d18cfb28f7a52ed9947b03380f67770487d521bdcfe1e2d"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.5/floci-linux-amd64"
      sha256 "3deaff5435d38429de4710eb1c48231ff5285ae92244c0addbf91282cc8a2064"
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
