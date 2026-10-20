# homebrew-tap
Tap for homebrew formula from Cortex that aren't available in homebrew-core yet.

| Formula | What it installs |
|---|---|
| `cortexapps-cli` | the Cortex CLI |
| `engrams` | the engrams CLI and terminal client, newest stable release |
| `engrams-nightly` | the engrams CLI, newest nightly prerelease (conflicts with `engrams`) |

```sh
brew install cortexapps/tap/engrams
```

The `engrams` formulae are written by the release workflows of
[cortexapps/engrams](https://github.com/cortexapps/engrams) (`scripts/homebrew-tap.sh`
there). Do not edit them by hand.
