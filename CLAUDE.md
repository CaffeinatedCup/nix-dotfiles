# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

Rebuild and switch the current host's NixOS config:
```bash
<<<<<<< HEAD
sudo nixos-rebuild switch --flake .#<hostname>
=======
sudo nh os swtich --hostname=.#<hostname>
>>>>>>> 95b2f2d28fe59332dbf9ff6c1a228a52a28b4af5
```

Rebuild with verbose output (useful for debugging):
```bash
sudo nixos-rebuild switch --flake .#<hostname> |& nom
```

Compare generations before/after a switch:
```bash
nvd diff /run/current-system result
```

Update flake inputs:
```bash
nix flake update
```

Check flake for errors without building:
```bash
nix flake check
```

## Architecture

This is a NixOS flake-based dotfiles repo managing multiple machines for user `zack`.

### Hosts

| Host | Machine | Role |
|------|---------|------|
| `geeker` | AMD desktop | Primary workstation (main host) |
| `parted` | Framework laptop | Personal laptop |
| `liberator` | System76 Darter Pro | Server (runs headlessly, lid closed) |
| `vulch` | Vultr VPS | Web/cloud server |
| `pie` | Raspberry Pi 4 | aarch64 server |

Each host lives in `hosts/<name>/default.nix` and `hardware-configuration.nix`. Hosts import NixOS modules from `nixos/` and optionally wire in Home Manager.

### NixOS Modules (`nixos/`)

- `nixos/core/` — shared baseline: networking, locale, nix settings
- `nixos/configuration.nix` — full desktop configuration (imports core + all optional desktop modules); used by `geeker` and `parted`
- `nixos/optional/` — opt-in modules:
  - `desktop.nix` — Hyprland + Niri + XDG portals
  - `server.nix` — Docker + self-hosted services (Nextcloud, Vaultwarden, Memos, Actual, Mealie, rmfakecloud, nginx)
  - `traefik.nix` — Traefik reverse proxy (used by `vulch`)
  - `boot.nix`, `greetd.nix`, `fonts.nix`, `gaming.nix`, `peripherals.nix`

### Home Manager (`home/`)

Home Manager is embedded as a NixOS module (not standalone) for `geeker` and `parted`. The shared config is `home/home.nix`, which imports:

- `home/gui/` — Hyprland packages (waybar, hyprpaper, hypridle, hyprlock, rofi, mako, etc.), GTK theme, XDG defaults
- `home/cli/` — CLI tools (neovim via external flake, tmux, lazygit, yazi, bat, eza, fzf, ripgrep, etc.) and shell config
- `home/files.nix` — raw config files managed via `home.file` or XDG

### Config Files (`home/files/`)

Dotconfig files for Hyprland (`hyprland.conf`, `hyprlock.conf`, `hypridle.conf`, `hyprpaper.conf`), Waybar (`config` + `style.css`), Kitty, and Rofi are kept as plain files under `home/files/` and linked into `~/.config/` via Home Manager.

### External Flake Inputs

- `nixpkgs` — nixos-unstable channel
- `home-manager` — follows nixpkgs
- `hyprland` — upstream Hyprland (follows nixpkgs)
- `nvim-config` — Neovim config from separate repo (`github:CaffeinatedCup/nvim-config`)
- `spicetify-nix` — Spotify theming for desktop hosts
- `noctalia` — custom shell/theme input
- `zen-browser` — Zen Browser flake
- `nixos-hardware` — hardware quirks (used for Raspberry Pi)
