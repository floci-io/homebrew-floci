class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.2/floci-darwin-arm64"
      sha256 "64e8b3d24647c367391a8a00346f8836a01fbd8175883aafac37caef5afbb270"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.2/floci-darwin-amd64"
      sha256 "9b48dcc06a67084fe4fc237149fa7d9792adbb537ea046b3e2513a5a7625445a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.2/floci-linux-arm64"
      sha256 "ad39d001db4a70a71bbf397e25dcd078c75ef0ef8e28c7e732c2883ea0a3eaaf"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.2.2/floci-linux-amd64"
      sha256 "9365bb8938208d09edf7689e79e8b5e72c2e962d2e391c0e6f5dc2a1b6281664"
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
