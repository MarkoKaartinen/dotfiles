# Homebrew
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# PATH (fish_add_path skips directories that do not exist)
fish_add_path -g ~/.composer/vendor/bin
fish_add_path -g ~/.local/bin

# Editor
set -gx EDITOR nano

alias a="php artisan"
alias pest="./vendor/bin/pest"
alias pint="./vendor/bin/pint"

if test (uname) = Darwin
    # Herd manages PHP and Node; its nvm has no fish integration, so use a fixed version.
    set -l herd "$HOME/Library/Application Support/Herd"
    fish_add_path -g "$herd/config/nvm/versions/node/v22.14.0/bin"
    fish_add_path -g "$herd/bin"

    alias sites="cd ~/Sites"
    alias projects="cd ~/Projects"
    alias sshkey="pbcopy < ~/.ssh/id_rsa.pub"
end

# Oh My Posh
if type -q oh-my-posh
    oh-my-posh init fish --config ~/.config/oh-my-posh/theme.json | source

    # Re-render the prompt on window resize so the right side stays aligned
    function _repaint_prompt_on_resize --on-signal WINCH
        omp_repaint_prompt
    end

    # Blank line above the prompt
    function _blank_line_before_prompt --on-event fish_prompt
        echo
    end
end

# Greeting
if type -q fastfetch
    function fish_greeting
        if test $COLUMNS -lt 100
            fastfetch --logo none
        else
            fastfetch
        end
    end
else
    set -g fish_greeting
end

# Doggo: query the common record types by default.
# Set here because the config file `type` list returns every record twice (doggo 1.4.1).
set -gx DOGGO_TYPE A,AAAA,NS,SOA,MX,TXT,CAA
