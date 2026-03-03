# Setup Micro-Manager Test Device Adapters

A GitHub Action that downloads and installs platform-specific Micro-Manager test device adapters
from the [mm-test-adapters](https://github.com/micro-manager/mm-test-adapters/releases) repository.

## Usage

```yaml
# Auto-detect version from installed pymmcore/pymmcore-nano
# (must run after uv sync / pip install)
- uses: pymmcore-plus/setup-mm-test-adapters@main

# Or specify a version explicitly
- uses: pymmcore-plus/setup-mm-test-adapters@main
  with:
    # or a specific version, e.g. "75", or "74.20250829"
    version: latest
    # optional, defaults to pymmcore-plus install location
    destination: ./mm-test-adapters  
```

## Inputs

| Name | Description | Required | Default |
|------|-------------|----------|---------|
| `version` | Version to install (`"auto"`, `"latest"`, or a specific version like `75`) | No | `auto` |
| `destination` | Directory where test adapters will be installed | No | _See below_ |

When `version` is `"auto"` (the default), the action detects the device interface
version from the installed `pymmcore` or `pymmcore-nano` package. This requires
Python to be available and the package to be installed _before_ this action runs
(e.g. after `uv sync` or `pip install`). If detection fails, it falls back to
`"latest"`.

If `destination` is not not provided, adapters will be installed into a
`Micro-Manager-YYYYMMDD` folder inside the  default
[pymmcore-plus](https://github.com/pymmcore-plus/pymmcore-plus) install location


- **Windows**: `$LOCALAPPDATA/pymmcore-plus/pymmcore-plus/mm`
- **macOS**: `$HOME/Library/Application Support/pymmcore-plus/mm`
- **Linux**: `$HOME/.local/share/pymmcore-plus/mm`

> [!TIP]
> *These are the directories that [`mmcore
> install`](https://pymmcore-plus.github.io/pymmcore-plus/install/#installing-micro-manager-device-adapters)
> installs to, and where
> [`pymmcore_plus.find_micro_manager()`](https://pymmcore-plus.github.io/pymmcore-plus/api/utils/#pymmcore_plus.find_micromanager)
> will look for Micro-Manager installations at runtime.*

## Outputs

| Name | Description |
|------|-------------|
| `version` | Resolved adapter version (`DIV` or `DIV.YYYYMMDD`) |
| `destination` | Final directory into which the adapters were extracted |
