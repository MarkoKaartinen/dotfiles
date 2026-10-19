# Dotfiles

Personal dotfiles for macOS, Linux and Windows.

Configurations are added incrementally and managed with Git.
No automated installation at the moment. Coming Soon™.

See [BACKLOG.md](BACKLOG.md) for tools, applications, and ideas being considered.

## Tools & Configuration

### Shared

| Tool | Purpose | Installation |
|------|---------|--------------|
| WezTerm | Terminal emulator | [Instructions](https://wezterm.org/installation.html) |
| Fish | Shell | [Instructions](https://fishshell.com/) |
| Oh My Posh | Shell prompt | [Instructions](https://ohmyposh.dev/docs/installation/macos) |
| Fastfetch | System information | [Instructions](https://github.com/fastfetch-cli/fastfetch) |
| Herdr | Terminal multiplexer | [Instructions](https://herdr.dev/docs/install/) |
| Zed | Code editor | [Instructions](https://zed.dev/docs/installation) |
| Codex | AI coding agent | [Instructions](https://learn.chatgpt.com/docs/codex/cli) |
| Claude Code | AI coding agent | [Instructions](https://code.claude.com/docs/en/overview) |

### macOS

| Tool | Purpose | Installation |
|------|---------|--------------|
| Homebrew | Package manager | [brew.sh](https://brew.sh/) |

Homebrew packages are listed in [macos/Brewfile](macos/Brewfile).
Install them manually:

```sh
brew bundle --file=macos/Brewfile
```

### Linux

No platform-specific configuration yet.

### Windows

No platform-specific configuration yet.

## Symlinks

Manual symlink commands, run from the repository root.

### Fish

```sh
mkdir -p ~/.config/fish
ln -s "$PWD/fish/config.fish" ~/.config/fish/config.fish
```

### Oh My Posh

```sh
mkdir -p ~/.config/oh-my-posh
ln -s "$PWD/oh-my-posh/theme.json" ~/.config/oh-my-posh/theme.json
```

### WezTerm

```sh
mkdir -p ~/.config/wezterm
ln -s "$PWD/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
```

### Herdr

```sh
mkdir -p ~/.config/herdr
ln -s "$PWD/herdr/config.toml" ~/.config/herdr/config.toml
```

### Fastfetch

```sh
mkdir -p ~/.config/fastfetch
ln -s "$PWD/fastfetch/config.jsonc" ~/.config/fastfetch/config.jsonc
```
