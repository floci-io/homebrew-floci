class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/1.0.0/floci-darwin-arm64"
      sha256 "7638b13f713b9bc62a8c1b25902a658b45e264af9bbb506a494e0893bbe93df7"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/1.0.0/floci-darwin-amd64"
      sha256 "34ee32a6dbc857632c83717754569201c2f2522dd1e7948cddb0645c57f44a30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/1.0.0/floci-linux-arm64"
      sha256 "d2d22b5f6150b4e800248bccc65c386ec6d18b0cc57a6e64aa2884fe196f2218"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/1.0.0/floci-linux-amd64"
      sha256 "abad8107f8ffba56f0e3af8c82710cfccee0dc61ba015699030e7a5029353714"
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
