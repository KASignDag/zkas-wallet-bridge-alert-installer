# ZKas Wallet Bridge Alert — Plug-and-Play Installer

## Unofficial Community Tool

**This is an independent community utility. It is not affiliated with, endorsed by, sponsored by, or maintained by the ZKas project or its developers.**

This repository is the **plug-and-play Windows installer edition** of ZKas Wallet Bridge Alert.

It is separate from:

- `KASignDag/zkas-wallet-bridge-alert` — source/manual edition
- `KASignDag/zkas-dual-alert` — standalone/manual Windows bridge edition

## Goal

For normal users the setup should be:

1. Download `ZKas-Wallet-Bridge-Alert-Setup.exe` from Releases.
2. Double-click it.
3. Approve the Windows administrator prompt.
4. Finish the installer.
5. The local alert dashboard opens and monitoring starts automatically.

No separate Python installation is required.

## Defaults

- ZKas Desktop Wallet bridge telemetry: `http://127.0.0.1:18114`
- Alert dashboard: `http://127.0.0.1:3041`
- Install directory: `C:\Program Files\ZKas Wallet Bridge Alert`
- Windows startup task: `ZKas Wallet Bridge Alert`

The alert is read-only. It does not need a seed phrase, private key, wallet spending permission, node-control access, or miner-control access.

## What the installer does

- Installs a self-contained Windows executable built with PyInstaller
- Bundles the required Python runtime
- Creates a Windows Scheduled Task that starts the alert after boot
- Uses the ZKas Desktop Wallet bridge endpoint automatically
- Opens the local dashboard after installation
- Adds an uninstall entry to Windows
- Keeps alert data/configuration under `%ProgramData%\ZKasWalletBridgeAlertInstaller\data`

## Notifications

Monitoring works immediately after installation. Email and Discord are optional and are configured later from the local dashboard because those require each user's own credentials/webhook.

## Compatibility

Initial target:

- Windows 10/11 x64
- ZKas Desktop Wallet managed KAS + ZKAS bridge
- `solo-dual-bridge v1.0.7` compatible `/api/stats` / Prometheus telemetry

## Release status

The first installer release is **v0.1.0**.

## Security

The build workflow packages only public source files. User credentials, `config.json`, `state.json`, logs, wallet addresses, and notification secrets are never included in release builds.

## License

MIT
