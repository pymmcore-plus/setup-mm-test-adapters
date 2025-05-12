# OS-Specific Precompiled Artifact Deployer

A GitHub Action that places pre-compiled Micro-Manager test adapters
into a user-specified location.

## Features

- Automatically detects runner OS (Linux, macOS, Windows).
- Copies the corresponding pre-compiled binary from your `files/` directory to a user-specified destination.

## Usage

```yaml
uses: pymmcore-plus/setup-mm-test-adapter@v1
with:
  destination: path/to/deploy
```
