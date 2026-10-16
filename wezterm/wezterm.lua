local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- GUI-launched WezTerm may not have Homebrew in PATH, so look for fish explicitly.
local function find_fish()
  local candidates = {
    '/opt/homebrew/bin/fish',
    '/usr/local/bin/fish',
    '/usr/bin/fish',
  }
  for _, path in ipairs(candidates) do
    local file = io.open(path, 'r')
    if file then
      file:close()
      return path
    end
  end
  return 'fish'
end

config.default_prog = { find_fish(), '-l' }

config.color_scheme = 'Catppuccin Mocha'

-- Ligatures are enabled by default in WezTerm.
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14.0
config.line_height = 1.2

-- Open at a fixed size so the window does not resize after the shell starts.
config.initial_cols = 140
config.initial_rows = 36

return config
