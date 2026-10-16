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
| Zed | Code editor | [Instructions](https://zed.dev/docs/installation) |
| Codex | AI coding agent | [Instructions](https://learn.chatgpt.com/docs/codex/cli) |
| Claude Code | AI coding agent | [Instructions](https://code.claude.com/docs/en/overview) |

### macOS

| Tool | Purpose | Installation |
|------|---------|--------------|
| Homebrew | Package manager | [brew.sh](https://brew.sh/) |

### Linux

No platform-specific configuration yet.

### Windows

No platform-specific configuration yet.

## Symlinks

Manual symlink commands, run from the repository root.

### WezTerm

```sh
mkdir -p ~/.config/wezterm
ln -s "$PWD/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
```
