# homebrew-floci

Homebrew tap for the [Floci CLI](https://github.com/floci-io/floci-cli) — the official
command-line interface for [Floci](https://floci.io), the free, open-source local cloud
emulator for AWS and Azure.

## Install

```sh
brew install floci-io/floci/floci
```

This adds the tap and installs the `floci` formula in one step. To upgrade later:

```sh
brew update
brew upgrade floci
```

To uninstall:

```sh
brew uninstall floci
brew untap floci-io/floci
```

## Supported platforms

The formula installs a prebuilt native binary for your platform:

| OS    | Architecture        | Asset                 |
|-------|---------------------|-----------------------|
| macOS | Apple Silicon (arm64) | `floci-darwin-arm64`  |
| macOS | Intel (x86_64)      | `floci-darwin-amd64`  |
| Linux | arm64               | `floci-linux-arm64`   |
| Linux | x86_64              | `floci-linux-amd64`   |

## Quick start

```sh
floci start          # launch the Floci AWS emulator
floci doctor         # check your environment
eval $(floci env)    # export AWS_ENDPOINT_URL and credentials

aws s3 mb s3://my-bucket   # use the AWS CLI against Floci
```

For the full command reference, flags, and Azure usage, see the
[floci-cli README](https://github.com/floci-io/floci-cli#readme).

## Other install methods

Not on Homebrew? The CLI is also available via an install script, Scoop (Windows),
and a JVM fallback jar — see [Installation](https://github.com/floci-io/floci-cli#installation).

## License

[MIT](LICENSE)
