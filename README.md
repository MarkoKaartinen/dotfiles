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
| Herdr Automatic Rename | Herdr tab naming plugin | [Instructions](https://github.com/qu8n/herdr-automatic-rename) |
| Doggo | DNS client | [Instructions](https://doggo.mrkaran.dev/docs/installation/) |
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

### Linux server

Console-only Ubuntu servers. Only the selected tools below are deployed;
desktop tools (WezTerm, Zed) and the macOS configuration are not.

| Tool | Purpose | Installation |
|------|---------|--------------|
| Fish | Shell, with its own per-machine history | `apt install fish` ([PPA](https://launchpad.net/~fish-shell/+archive/ubuntu/release-4) for a newer version) |
| Herdr | Terminal multiplexer and remote session server | `curl -fsSL https://herdr.dev/install.sh \| sh` |
| Doggo | DNS client | [Instructions](https://doggo.mrkaran.dev/docs/installation/) |
| Codex | AI coding agent | [Instructions](https://learn.chatgpt.com/docs/codex/cli) |
| Claude Code | AI coding agent | [Instructions](https://code.claude.com/docs/en/overview) |

Clone the repository to `~/.dotfiles` and link the configuration with the
[Symlinks](#symlinks) commands for Fish, Herdr (and its plugin), Doggo and Git.
`herdr/config.toml` sets Fish as the default shell, so install Fish first.
Herdr does not copy config or plugins to remote machines.

Try `fish` by hand before making it the login shell, see [Login shell](#login-shell).

Ubuntu prints its own login message (MOTD, update notices, `Last login`) before
the shell starts. To hide it for the current user only, run `touch ~/.hushlogin`
(revert with `rm ~/.hushlogin`). Update and reboot notices are hidden too.

#### Connect from the Mac

Check that plain `ssh <host>` works, then save the server in the local Herdr:

```sh
herdr machine add <host>
herdr machine status
```

Use `ForwardAgent yes` in `~/.ssh/config` for trusted hosts if Git needs the local key.

### Windows

No platform-specific configuration yet.

## Symlinks

Manual symlink commands, run from the repository root.

### Fish

```sh
mkdir -p ~/.config/fish
ln -s "$PWD/fish/config.fish" ~/.config/fish/config.fish
```

#### Login shell

Optional. Start `fish` by hand first and check that it works.

Linux (the apt package is already listed in `/etc/shells`):

```sh
chsh -s "$(command -v fish)"
```

macOS (Homebrew Fish must be added to `/etc/shells` first):

```sh
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

Log out and back in, then check with `echo $SHELL`.
To revert, run `chsh -s /bin/bash` (Linux) or `chsh -s /bin/zsh` (macOS).

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

#### Plugins

##### Automatic Rename

Install the plugin, then link the config:

```sh
herdr plugin install qu8n/herdr-automatic-rename --yes
mkdir -p ~/.config/herdr-automatic-rename
ln -s "$PWD/herdr-automatic-rename/config.sh" ~/.config/herdr-automatic-rename/config.sh
```

### Fastfetch

```sh
mkdir -p ~/.config/fastfetch
ln -s "$PWD/fastfetch/config.jsonc" ~/.config/fastfetch/config.jsonc
```

### Doggo

```sh
ln -s "$PWD/doggo/config.toml" ~/.doggo.toml
```

### Git

The `commit-msg` hook removes AI attribution lines (such as `Co-Authored-By: Claude`)
from commit messages. It also runs the repository's own `commit-msg` hook, if any.

Setting `core.hooksPath` applies to every repository and disables their other hooks
(`pre-commit` etc.). Check the current value first:

```sh
git config --global --get core.hooksPath
```

If it is empty, enable the hook:

```sh
mkdir -p ~/.config/git/hooks
ln -s "$PWD/git/hooks/commit-msg" ~/.config/git/hooks/commit-msg
git config --global core.hooksPath ~/.config/git/hooks
```

Commits made with `--no-verify` skip the hook.
