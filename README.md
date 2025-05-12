# Setup Micro-Manager Test Device Adapters

A GitHub Action that downloads and installs platform-specific Micro-Manager test device adapters
from the [mm-test-adapters](https://github.com/pymmcore-plus/mm-test-adapters/releases) repository.

## Features

- Automatically detects runner OS (Linux, macOS, Windows) and architecture (X64, ARM64).
- Downloads the appropriate release file from the GitHub repository.
- Extracts files to platform-specific locations following the platformdirs convention:
  - **Windows**: `[destination]/pymmcore-plus/pymmcore-plus/mm/Micro-Manager-[version]`
  - **macOS**: `[destination]/pymmcore-plus/mm/Micro-Manager-[version]`
  - **Linux**: `[destination]/pymmcore-plus/mm/Micro-Manager-[version]`

## Usage

```yaml
- name: Install MM test adapters
  uses: pymmcore-plus/setup-mm-test-adapters@v1
  with:
    destination: ./mm-test-adapters
    version: latest  # or a specific version
```

## Inputs

| Name | Description | Required | Default |
|------|-------------|----------|---------|
| `destination` | Directory where test adapters will be installed | Yes | |
| `version` | Version to install | No | `latest` |

## Example workflow

```yaml
name: Test with MM device adapters

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup MM test adapters
        uses: pymmcore-plus/setup-mm-test-adapters@v1
        with:
          destination: ./mm-test-adapters
      
      - name: Run tests with adapters
        run: |
          # Your tests here
          python -c "import os; print(os.listdir('./mm-test-adapters'))"
```
