# Homebrew
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# Oh My Posh
if type -q oh-my-posh
    oh-my-posh init fish --config easy-term | source
end
