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

return config
