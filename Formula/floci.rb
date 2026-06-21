class Floci < Formula
  desc "Official CLI for the Floci local AWS emulator"
  homepage "https://floci.io"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.8/floci-darwin-arm64"
      sha256 "6418c2e434aed6508fb90cb450d091a9e0e6c7f4f1cf684e8b8d17fc521d6466"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.8/floci-darwin-amd64"
      sha256 "c8757b309b173121753c245986ebc2a163b843bafeff5188be5d83d639040d70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.8/floci-linux-arm64"
      sha256 "b8ed57d8fd23a98ca20ab9fe62aa9bbd063b83cf458d2f7e8586b560b851a09c"
    end
    on_intel do
      url "https://github.com/floci-io/floci-cli/releases/download/0.1.8/floci-linux-amd64"
      sha256 "ebc27e551bf1038cb70339c9fcbb9fa31a47ed21dfad0463f4e9ae8e9d1e7bae"
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
