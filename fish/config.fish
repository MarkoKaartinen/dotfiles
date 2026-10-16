# Homebrew
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# PATH (fish_add_path skips directories that do not exist)
fish_add_path -g ~/.composer/vendor/bin
fish_add_path -g ~/.local/bin

if test (uname) = Darwin
    # Herd manages PHP and Node; its nvm has no fish integration, so use a fixed version.
    set -l herd "$HOME/Library/Application Support/Herd"
    fish_add_path -g "$herd/config/nvm/versions/node/v22.14.0/bin"
    fish_add_path -g "$herd/bin"
end

# Oh My Posh
if type -q oh-my-posh
    oh-my-posh init fish --config easy-term | source
end
