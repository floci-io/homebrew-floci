class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.4.0/floci-darwin-arm64"
      sha256 "3c0914c12f2dbfcd55eaa164ede3aaefba3ccf16ab520e8dd0c3bb44cd468080"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.4.0/floci-darwin-amd64"
      sha256 "40ae8e34e6a82f2db79bfc8d529a287f5f2a38d6123ca8e6f422052e7e0d2366"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.4.0/floci-linux-arm64"
      sha256 "62b2d1c202f5041d545e5ae681a38dc9dc148fb355a0b8b203dcae0b0951637b"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.4.0/floci-linux-amd64"
      sha256 "cdf4603e169a030b57d18b2fff6ef3f6a4ad45a2bbf137992cb9cf691c4620f8"
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
