# Zack's NixOS Config

Personal, [Nix flake](https://nixos.wiki/wiki/Flakes)-based NixOS configuration. One repo
manages every machine I run — desktop, laptop, and a handful of servers.
[Home Manager](https://github.com/nix-community/home-manager) is embedded as a NixOS module on
the desktop hosts so the whole setup (system + dotfiles) builds from a single `nixos-rebuild`.

## Hosts

| Host        | Machine               | Arch          | Role                          |
|-------------|-----------------------|---------------|-------------------------------|
| `geeker`    | AMD desktop           | `x86_64-linux`  | Primary workstation (main)    |
| `parted`    | Framework laptop      | `x86_64-linux`  | Personal laptop               |
| `liberator` | System76 Darter Pro   | `x86_64-linux`  | Headless home server          |
| `vulch`     | Vultr VPS             | `x86_64-linux`  | Web / cloud server            |
| `pie`       | Raspberry Pi 4        | `aarch64-linux` | aarch64 server                |

## The Look

A Wayland desktop built around:

- **Compositors:** [Niri](https://github.com/YaLTeR/niri)
- **Shell / bar:** [Noctalia](https://github.com/noctalia-dev/noctalia-shell)
- **Launcher / notifications:** Rofi + Mako
- **Terminal:** Kitty
- **Theme:** Configuarble via Noctalia

<!-- Screenshots go here -->

## Structure

```
.
├── flake.nix              # Inputs + nixosConfigurations
├── hosts/<name>/          # Per-machine config + hardware-configuration.nix
├── nixos/
│   ├── configuration.nix  # Full desktop config (core + optional desktop modules)
│   ├── core/              # Shared baseline: network, locale, nix settings
│   └── optional/          # Opt-in modules: desktop, server, traefik, boot,
│                          #   greetd, fonts, gaming, peripherals, syncthing
└── home/                  # Home Manager
    ├── gui/               # Hyprland packages, GTK theme, XDG defaults
    ├── cli/               # Shell + CLI tooling (neovim, tmux, lazygit, yazi, …)
    └── files/             # Raw dotconfigs linked into ~/.config
```

## Notable Flake Inputs

- [`nixpkgs`](https://github.com/nixos/nixpkgs) — `nixos-unstable` channel
- `nixpkgs-stable` — `nixos-25.11` (for select packages)
- [`home-manager`](https://github.com/nix-community/home-manager)
- [`hyprland`](https://github.com/hyprwm/Hyprland)
- [`noctalia`](https://github.com/noctalia-dev/noctalia-shell)
- [`nvim-config`](https://github.com/CaffeinatedCup/nvim-config) — my Neovim config
- [`zen-browser`](https://github.com/youwen5/zen-browser-flake)
- [`spicetify-nix`](https://github.com/Gerg-L/spicetify-nix)
- [`nixos-hardware`](https://github.com/NixOS/nixos-hardware)
- `waveforms` / `stm32cubeide` — electronics & embedded tooling


## TODO
* Make Noctalia config stuff permanenent
* Secrets management (agenix or SOPS-nix)
* Add lanzaboot
