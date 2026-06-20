class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.7/floci-darwin-arm64"
      sha256 "e016b07107904f5feee1bfbc73762f5c0cc654dda571f35a5a307d6b0065ea51"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.7/floci-darwin-amd64"
      sha256 "11a66af5e68e5536e23cffc62f6e7bc937ad07e854979b3cd22bd6c7a17575c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.7/floci-linux-arm64"
      sha256 "c4f49a0703d25fb21adea82b69cb03cf334c765aead2ce3722a461f9022e1626"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.7/floci-linux-amd64"
      sha256 "d6d3ad7e8d2cdda9ec394894bae7bdc21b3a4476c75024f968ddecf1c5bfb32e"
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
