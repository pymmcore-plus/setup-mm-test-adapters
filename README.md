# Setup Micro-Manager Test Device Adapters

A GitHub Action that downloads and installs platform-specific Micro-Manager test device adapters
from the [mm-test-adapters](https://github.com/pymmcore-plus/mm-test-adapters/releases) repository.

## Usage

```yaml
- name: Install MM test adapters
  uses: pymmcore-plus/setup-mm-test-adapters@main
  with:
    version: latest  # or a specific YYYYMMDD version
    destination: ./mm-test-adapters
```

## Inputs

| Name | Description | Required | Default |
|------|-------------|----------|---------|
| `version` | Version to install | No | `latest` |
| `destination` | Directory where test adapters will be installed | No | _See below_ |

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
| `version` | Resolved adapter version (`YYYYMMDD`) |
| `destination` | Final directory into which the adapters were extracted |