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

-- Put the window buttons into the tab bar and color the bar from the scheme.
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
if scheme then
  config.window_frame = {
    active_titlebar_bg = scheme.background,
    inactive_titlebar_bg = scheme.background,
  }
  local bg = wezterm.color.parse(scheme.background)
  config.colors = {
    tab_bar = {
      active_tab = { bg_color = bg:lighten(0.12), fg_color = scheme.foreground },
      inactive_tab = { bg_color = scheme.background, fg_color = scheme.ansi[8] },
      inactive_tab_hover = { bg_color = bg:lighten(0.06), fg_color = scheme.foreground },
      new_tab = { bg_color = scheme.background, fg_color = scheme.ansi[8] },
      new_tab_hover = { bg_color = bg:lighten(0.06), fg_color = scheme.foreground },
    },
  }
end

-- Show the current directory name in the tab title.
wezterm.on('format-tab-title', function(tab)
  local cwd = tab.active_pane.current_working_dir
  local name = tab.active_pane.title
  if cwd and cwd.file_path then
    local path = cwd.file_path:gsub('/$', '')
    name = path == os.getenv('HOME') and '~' or path:match('[^/]+$') or '/'
  end
  return ' ' .. (tab.tab_index + 1) .. ': ' .. name .. ' '
end)

-- Native Wayland draws a gray client-side frame above the window on Hyprland.
config.enable_wayland = false

-- Ligatures are enabled by default in WezTerm.
config.font = wezterm.font 'JetBrains Mono'
config.font_size = wezterm.target_triple:find('linux') and 13.0 or 14.0
config.line_height = 1.2

-- Open at a fixed size so the window does not resize after the shell starts.
config.initial_cols = 140
config.initial_rows = 36

return config
